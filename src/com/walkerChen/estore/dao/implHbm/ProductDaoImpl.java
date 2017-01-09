package com.walkerChen.estore.dao.implHbm;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.junit.Test;

import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.page.QueryResult;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.commonUtils.HibernateUtils;
import com.walkerChen.estore.commonUtils.MySecurityException;
import com.walkerChen.estore.dao.ProductDao;
@SuppressWarnings("all")
public class ProductDaoImpl implements ProductDao{

	@Override
	public void addProduct(Product product) {
		Session session  = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.save(product);
		Set categorySet = product.getCategorySet();
		transaction.commit();
		session.close();
	}
	@Override
	public void updateProduct(Product product){
		Session session  = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(product);
		transaction.commit();
		session.close();
	}
	@Override
	/**
	 * 剩余产品的数量
	 */
	public void remainderProductQuantity(String productId, int totalSale) {
		Product product = findProduct(productId);
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		if(product.getQuantity()==0){
			throw new MySecurityException("该产品已销售告罄！");
		}if(product.getQuantity()-totalSale<0){
			throw new MySecurityException("该产品销售太火热！数量不足还请见谅");
		}
		product.setQuantity(product.getQuantity()-totalSale);
		product.setTotalSaleNum(product.getTotalSaleNum()+totalSale);
		session.update(product);
		transaction.commit();
		session.close();
	}
	@Override
	public Product findProduct(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Product product = session.get(Product.class, id);
		transaction.commit();
		session.close();
		String iconurl = product.getIconurl();
		if(iconurl!=null){
			StringTokenizer stringTokenizer = new StringTokenizer(iconurl,"&");
			/**
			 * 在这里我们要使用list集合封装该产品对象的图片的绝对地址，因此不因该是图片的名字，地址是要用流读取给页面的
			 */
			while(stringTokenizer.hasMoreTokens()){
				String iconPath= stringTokenizer.nextToken();
				product.getImgUrlList().add(iconPath);
				int lastSprit = iconPath.lastIndexOf("/");
				String iconName = iconPath.substring(lastSprit+1,iconPath.length());
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
				product.getImgParamList().add(paramIconPath);
				int lastSprit = paramIconPath.lastIndexOf("/");
				String paramIconName = paramIconPath.substring(lastSprit+1,paramIconPath.length());
				product.getMappingImgUrl().put(paramIconName, paramIconPath);
			}
		}
		return product;
	}
	/**
	 * 
	 * @param startIndex
	 * @param pageSize
	 * @param where where条件的格式：String where = "where category_id=?"
	 * @param param
	 * @return
	 */
	private List<Product> findlScopeByProduct(int startIndex, int pageSize,
			String where) {
		List<Product> productList = null;
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		if(where != null && !where.trim().equals("")){
			NativeQuery query = session.createNativeQuery("select * from product "+where);
			query.setFirstResult(startIndex);
			query.setMaxResults(pageSize);
			productList = query.addEntity(Product.class).list();
		}else{
			NativeQuery query = session.createNativeQuery("select * from product");
			query.setFirstResult(startIndex);
			query.setMaxResults(pageSize);
			productList = query.addEntity(Product.class).list();
		}
		transaction.commit();
		session.close();
		return productList;
	}
	/**
	 * 
	 * @param where where条件的格式：String where = "where brand_id=?"
	 * @param param
	 * @return
	 */
	private  int findProductTotalRecord(String where) {
		int totalRecord;
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		
		if(where != null && !where.trim().equals("")){
			String sql = "select count(*) from Product "+where;
			Number number = (Number) session.createNativeQuery(sql).uniqueResult();
			totalRecord= number.intValue();
		}else{
			String hql = "select count(*) from Product";
			Number number = (Number) session.createQuery(hql).uniqueResult();
			totalRecord= number.intValue();
		}
		transaction.commit();
		session.close();
		return totalRecord;
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
			StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
			while(stringTokenizer.hasMoreTokens()){
				String iconPath= stringTokenizer.nextToken();
				int lastSprit = iconPath.lastIndexOf("/");
				String iconName = iconPath.substring(lastSprit+1,iconPath.length());
				product.getImgUrlList().add(iconName);
			}
			System.out.println(product.getImgUrlList());
		}
		int totalRecord = findProductTotalRecord(queryInfo.getWhereAssociate());
		QueryResult queryResult = new QueryResult();
		queryResult.setList(productList);
		queryResult.setRecodeResult(totalRecord);
		return queryResult;
	}

	@Override
	public void deleteProduct(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.delete(session.get(Product.class, id));
		transaction.commit();
		session.close();
	}
	@Override
	public Boolean isDuplicateNameOfProduct(String productName){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<String> productNames = session.createNativeQuery("select name from product").getResultList();
		transaction.commit();
		session.close();
		System.out.println(productNames);
		for(int i = 0 ; productNames!=null && i<productNames.size(); i++){
			if(productNames.get(i).equalsIgnoreCase(productName.trim())){
				return true;
			}
		}
		return false;
	}
	@Test
	public void test(){
		CategoryDaoImpl categoryDao = new CategoryDaoImpl();
		Category dress = categoryDao.findCategory("402881e7586c621e01586c6228380002");//服装裙子类别
		
		//Product womanDress = new Product("女士裙子",123);
		Product womanDress =this.findProduct("402881e7586c739101586c739b040000");
		Set<Category> categorySet = new HashSet<Category>();
		categorySet.add(dress);
		womanDress.setCategorySet(categorySet);
		//this.updateProduct(womanDress);
		System.out.println(womanDress);
	}
	@Override
	public List<Product> findPagingProductByCategory(QueryPaging queryInfo,
			String categoryId) {
		// TODO Auto-generated method stub
		return null;
	}
}
