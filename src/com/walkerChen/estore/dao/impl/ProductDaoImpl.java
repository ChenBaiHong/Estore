
package com.walkerChen.estore.dao.impl;


import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.swing.JOptionPane;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;
import org.junit.Test;

import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.page.QueryResult;
import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.MySecurityException;
import com.walkerChen.estore.dao.ProductDao;
import com.walkerChen.estore.dao.implHbm.CategoryDaoImpl;
import com.walkerChen.estore.myDbutils.MyQueryRunner;

/**
 * create table Product(
	id varChar(40) primary key,
	name varChar(100) not null,
	price decimal(8 , 1) not null ,
	iconurl varChar(225) not null,
	quantity int not null,
	totalSaleNum int null,
	description varChar(225),
	category_id varChar(40),
	foreign key(category_id) references category(id)
);
 * @author hareClase
 *
 */
@SuppressWarnings("all")
public class ProductDaoImpl implements ProductDao {
	/**
	 * 产品和分类是多对多的关系要做多多的处理
	 * 
	 * 品牌 和 产品之间就是多对一的关系
	 */
	@Override
	public void addProduct(Product product) {
		product.setId(UUID.randomUUID().toString().replaceAll("-", ""));//创建唯一的UUID
		savaOrUpdateProduct(product);
		//JOptionPane.showMessageDialog(null, "Addition Successfully !");
	}
	private void savaOrUpdateProduct(Product product){
		try {
			QueryRunner runner = new QueryRunner();
			//构建语句
			StringBuilder builderStatement= new StringBuilder("INSERT INTO PRODUCT(");
			//预编译的问号的语句
			String prepareStatement = "VALUES(";
			//预备插入的参数
			List<Object> prepareParams =new ArrayList<Object>();
			
			Map<String , Object> dataEntry = new JdbcUtils().tableFieldByMethodOfMap(product);
			Set<Entry<String , Object>> entrySet =dataEntry.entrySet();
			Iterator<Entry<String , Object>> iterator = entrySet.iterator();
			while(iterator.hasNext()){
				Entry<String , Object> dataEntity = iterator.next();
				builderStatement.append(dataEntity.getKey()+",");
				prepareStatement=prepareStatement.concat("?,");
				prepareParams.add(dataEntity.getValue());
			}
			
			if(product.getBrand()!=null){//不为空就添加品牌
				builderStatement.append("brand_id)");//品牌对产品的多对一
				prepareStatement=prepareStatement.concat("?)");//预备参数品牌(id)的 ("?")占位符
				prepareParams.add(product.getBrand().getId());//参数品牌(id)
				builderStatement.append(prepareStatement);
			}else{//品牌为空就截取替换
				builderStatement.setCharAt(builderStatement.lastIndexOf(","), ')');
				prepareStatement=prepareStatement.substring(0, prepareStatement.lastIndexOf(","))+")";
				builderStatement.append(prepareStatement);
			}
			System.out.println(builderStatement.toString());
			
			runner.update(JdbcUtils.getConnection(), builderStatement.toString(),prepareParams.toArray());
			
			//开始做产品关联分类类别的处理 , 也就是多对多的处理
			
			if(product.getCategorySet()!=null){
				Iterator<Category> iteraorCategory= product.getCategorySet().iterator();
				while(iteraorCategory.hasNext()){
					Category category = iteraorCategory.next();
					if(category!=null){//类别不能为空的情况下，产品才添加类别
						prepareStatement="INSERT INTO PROD_CATE(PNO,CNO)VALUES(?,?)";
						Object[] params = new Object[]{product.getId() , category.getCid()};
						runner.update(JdbcUtils.getConnection() , prepareStatement,params);
					}
				}
			}
			JdbcUtils.commitTranscation();
		} catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	@Override
	//totalSale 销售数量就是用户购买的数量
	//产品的销售数量根据用户的购买的数据量计算，而该购物项的价格是根据产品的价格乘以购买数量
	public void remainderProductQuantity(String  productId , int totalSale ){
		try{
			Product product = findProduct(productId);
			if(product.getQuantity()==0){
				throw new MySecurityException("该产品已销售告罄！");
			}if(product.getQuantity()-totalSale<0){
				throw new MySecurityException("该产品销售太火热！数量不足还请见谅");
			}
			QueryRunner runner = new QueryRunner();
			String sql = "UPDATE PRODUCT SET TOTALSALENUM=? ,QUANTITY=? WHERE ID=? ";
			Object[] params ={product.getTotalSaleNum()+totalSale ,product.getQuantity()-totalSale, productId}; 
			runner.update(JdbcUtils.getConnection(), sql, params);
			JdbcUtils.commitTranscation();
		}catch(Exception e){
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	
	@Override
	public Product findProduct(String id) {
		try {
			QueryRunner runner = new QueryRunner();
			MyQueryRunner myRunner = new MyQueryRunner();
			String sql = "select * from product where id=?";
			Product product = (Product) myRunner.queryBean(JdbcUtils.getConnection(), sql, new Object[]{id}, Product.class);
			
			//查询产品关联品牌，品牌与产品多对一查询
			sql = "SELECT b.* FROM BRAND b , PRODUCT p WHERE b.ID=p.BRAND_ID AND p.ID=\""+id+"\"";
			Brand brand = (Brand) runner.query(JdbcUtils.getConnection(), sql,new BeanHandler(Brand.class));
			product.setBrand(brand);
			//查询产品关联分类类别，多对多查询
			sql="SELECT c.* FROM CATEGORY c INNER JOIN PROD_CATE pc ON c.CID=pc.CNO AND pc.PNO=\""+id+"\"";
			List<Category> categoryList = (List<Category>) runner.query(JdbcUtils.getConnection(),sql,new BeanListHandler(Category.class));
			product.getCategorySet().addAll(categoryList);
			
			String iconurl = product.getIconurl();
			if(iconurl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(iconurl,"&");
				/**
				 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
				 */
				while(stringTokenizer.hasMoreTokens()){
					String iconPath= stringTokenizer.nextToken();
					int lastSprit = iconPath.lastIndexOf("/");
					String iconName = iconPath.substring(lastSprit+1,iconPath.length());
					//list集合中添加图片文件的名字
					product.getImgUrlList().add(iconName);
					//设置第一张图片
					product.setFirstImgUrl(iconName);
					product.getMappingImgUrl().put(iconName, iconPath);
				}
			}
			String paramIconurl = product.getParamIconurl();
			if(paramIconurl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(paramIconurl,"&");
				/**
				 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
				 */
				while(stringTokenizer.hasMoreTokens()){
					String paramIconPath= stringTokenizer.nextToken();
					int lastSprit = paramIconPath.lastIndexOf("/");
					String paramIconName = paramIconPath.substring(lastSprit+1,paramIconPath.length());
					product.getImgParamList().add(paramIconName);
					product.getMappingImgUrl().put(paramIconName, paramIconPath);
				}
			}
			JdbcUtils.commitTranscation();
			return product;
		} catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	
	/**
	 * 
	 * @param startIndex
	 * @param pageSize
	 * @param where where条件的格式：String where = "where category_id=?"
	 * @return
	 */
	private List<Product> findlScopeByProduct(int startIndex, int pageSize,String where) {
		try {
			QueryRunner runner = new QueryRunner();
			where = (where==null?"":where);
			String sql="SELECT * FROM PRODUCT "+where+" LIMIT "+startIndex+","+pageSize;
			List<Product> productList = (List<Product>) runner.query(JdbcUtils.getConnection(), sql,new BeanListHandler(Product.class));
			for(int i = 0;productList !=null && i<productList.size();i++){
				Product product = productList.get(i);
				//品牌
				sql = "SELECT b.* FROM BRAND b , PRODUCT p WHERE b.ID=p.BRAND_ID AND p.ID=\""+product.getId()+"\"";
				Brand brand = (Brand) runner.query(JdbcUtils.getConnection(), sql, new BeanHandler(Brand.class));
				product.setBrand(brand);
				//类别
				sql="SELECT c.* FROM CATEGORY c INNER JOIN PROD_CATE pc ON c.CID=pc.CNO AND pc.PNO=\""+product.getId()+"\"";
				List<Category> categoryList = (List<Category>) runner.query(JdbcUtils.getConnection(),sql,new BeanListHandler(Category.class));
				product.getCategorySet().addAll(categoryList);
			}
			JdbcUtils.commitTranscation();
			return productList;
		} catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	/**
	 * 
	 * @param where where条件的格式：String where = "where brand_id=?"
	 * @param param
	 * @return
	 */
	private  int findProductTotalRecord(String where) {
		long totalRecord=0;
		String sql=null;
		try {
			QueryRunner runner = new QueryRunner();
			if(where != null && !where.trim().equals("")){
				sql = "select count(*) from Product "+where;
				totalRecord =  (long) runner.query(JdbcUtils.getConnection(), sql,new ScalarHandler());//...new ScalarHandler() ，查询出的是长整型整数
			}else{
				sql = "select count(*) from Product";
				totalRecord = (long) runner.query(JdbcUtils.getConnection(),sql,new ScalarHandler());
				
			}
			JdbcUtils.commitTranscation();
			return new Long(totalRecord).intValue();
		} catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}

	@Override	
	public QueryResult getProductQueryResult(QueryPaging queryInfo) {
		List<Product> productList = findlScopeByProduct(queryInfo.getStartIndex(), queryInfo.getPageSize(),
				queryInfo.getWhereAssociate());
		for(int i = 0 ; productList!=null && i<productList.size();i++){
			Product product = productList.get(i);
			String iconUrl = product.getIconurl();
			/**
			 * 在这里我们要使用产品对象的list集合封装该产品的图片的名字，而不是图片的绝对地址，访问网页不能是对地址的访问，这样不安全要用流读取
			 */
			if(iconUrl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
				while(stringTokenizer.hasMoreTokens()){
					String iconPath= stringTokenizer.nextToken();
					int lastSprit = iconPath.lastIndexOf("/");
					String iconName = iconPath.substring(lastSprit+1,iconPath.length());
					//list集合中添加图片文件的名字
					product.getImgUrlList().add(iconName);
					//设置第一张图片
					product.setFirstImgUrl(iconName);
					product.getMappingImgUrl().put(iconName, iconPath);
				}
				//System.out.println(product.getImgUrlList());
			}
			String paramIconurl = product.getParamIconurl();
			if(paramIconurl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(paramIconurl,"&");
				/**
				 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
				 */
				while(stringTokenizer.hasMoreTokens()){
					String paramIconPath= stringTokenizer.nextToken();
					int lastSprit = paramIconPath.lastIndexOf("/");
					String paramIconName = paramIconPath.substring(lastSprit+1,paramIconPath.length());
					product.getImgParamList().add(paramIconName);
					product.getMappingImgUrl().put(paramIconName, paramIconPath);
				}
			}
		}
		int totalRecord = findProductTotalRecord(queryInfo.getWhereAssociate());
		QueryResult queryResult = new QueryResult();
		queryResult.setList(productList);
		queryResult.setRecodeResult(totalRecord);
		return queryResult;
	}
	@Override
	public void deleteProduct(String id){
		try{
			String sql=null;
			Connection connection = JdbcUtils.getConnection();
			QueryRunner runner = new QueryRunner();
			sql="DELETE FROM prod_cate WHERE pno=?";//先删除关联的分类类别
			runner.update(connection, sql, id);
			sql="DELETE FROM PRODUCT WHERE ID=?";//再删除产品
			runner.update(connection, sql, id);
			JdbcUtils.commitTranscation();
		} catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	@Override
	public Boolean isDuplicateNameOfProduct(String productName) {
		try{
			QueryRunner runner = new QueryRunner();
			String sql="select name from product";
			Object[] productNames = (Object[]) runner.query(JdbcUtils.getConnection(), sql ,new ArrayHandler());
			JdbcUtils.commitTranscation();
			for(int i = 0 ; productNames!=null && i<productNames.length; i++){
				String pName=(String) productNames[i]; 
				if(pName.equalsIgnoreCase(productName.trim())){
					return true;
				}
			}
			return false;
		}catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	@Override
	public void updateProduct(Product product) {
		try{
			String sql=null;
			QueryRunner runner = new QueryRunner();
			sql="DELETE FROM prod_cate WHERE pno=?";//先删除关联的分类类别
			runner.update(JdbcUtils.getConnection(), sql, product.getId());
			sql="DELETE FROM PRODUCT WHERE ID=?";//再删除产品
			runner.update(JdbcUtils.getConnection(), sql, product.getId());
			savaOrUpdateProduct(product);//以对事物做了提交和关闭
		}catch (Exception e) {
			throw new MySecurityException(e);
		}
	}
	//SELECT p.* FROM PRODUCT p INNER JOIN PROD_CATE pc ON p.ID=pc.PNO AND pc.CNO="402881e6588a900901588a9c50f60001" and  pc.CNO="402881e7587f7f2b01587f8041590000" and p.salePrice>100 and p.salePrice<600;
	@Override
	public List<Product> findPagingProductByCategory(QueryPaging queryInfo , String categoryId){
		try{
			QueryRunner runner = new QueryRunner();
			String sortOrder = queryInfo.getSortCondition()==null?"":" ORDER BY p."+queryInfo.getSortCondition();
			//Oracle 分页查询
			//select * from (select rownum r, e.* from (select * from emp where ename="" order by sal desc) e where rownum<=10) where r>5
			String sql = "SELECT p.* FROM PRODUCT p INNER JOIN PROD_CATE pc ON p.ID=pc.PNO AND pc.CNO=? "+sortOrder+" LIMIT ?,?";
			Object[] params = {categoryId , queryInfo.getStartIndex() , queryInfo.getPageSize()};
			List<Product> productList = (List<Product>) runner.query(JdbcUtils.getConnection() , sql , params , new BeanListHandler(Product.class));
			for(int i = 0;productList !=null && i<productList.size();i++){
				Product product = productList.get(i);
				//产品图片
				String iconurl = product.getIconurl();
				if(iconurl!=null){
					StringTokenizer stringTokenizer = new StringTokenizer(iconurl,"&");
					/**
					 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
					 */
					while(stringTokenizer.hasMoreTokens()){
						String iconPath= stringTokenizer.nextToken();
						int lastSprit = iconPath.lastIndexOf("/");
						String iconName = iconPath.substring(lastSprit+1,iconPath.length());
						//list集合中添加图片文件的名字
						product.getImgUrlList().add(iconName);
						//设置第一张图片
						product.setFirstImgUrl(iconName);
						product.getMappingImgUrl().put(iconName, iconPath);
					}
				}
				//产品图文参数图片
				String paramIconurl = product.getParamIconurl();
				if(paramIconurl!=null){
					StringTokenizer stringTokenizer = new StringTokenizer(paramIconurl,"&");
					/**
					 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
					 */
					while(stringTokenizer.hasMoreTokens()){
						String paramIconPath= stringTokenizer.nextToken();
						int lastSprit = paramIconPath.lastIndexOf("/");
						String paramIconName = paramIconPath.substring(lastSprit+1,paramIconPath.length());
						product.getImgParamList().add(paramIconName);
						product.getMappingImgUrl().put(paramIconName, paramIconPath);
					}
				}
				//品牌
				sql = "SELECT b.* FROM BRAND b , PRODUCT p WHERE b.ID=p.BRAND_ID AND p.ID=\""+product.getId()+"\"";
				Brand brand = (Brand) runner.query(JdbcUtils.getConnection(), sql, new BeanHandler(Brand.class));
				product.setBrand(brand);
				//类别
				sql="SELECT c.* FROM CATEGORY c INNER JOIN PROD_CATE pc ON c.CID=pc.CNO AND pc.PNO=\""+product.getId()+"\"";
				List<Category> categoryList = (List<Category>) runner.query(JdbcUtils.getConnection(),sql,new BeanListHandler(Category.class));
				product.getCategorySet().addAll(categoryList);
			}
			JdbcUtils.commitTranscation();
			return productList;
		}catch (Exception e) {
			throw new MySecurityException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	@Test
	public void test(){
		QueryPaging queryInfo =new QueryPaging();
		queryInfo.setSortCondition("quantity");
		System.out.println(findPagingProductByCategory(queryInfo , "402881e7586c621e01586c6228380002"));;
	}
}