package com.walkerChen.estore.dao.implHbm;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.commonUtils.HibernateUtils;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.dao.BrandDao;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageInfoOfBrand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.QueryResultOfBrand;
@SuppressWarnings("all")
public class BrandDaoImpl implements BrandDao{

	@Override
	public void addBrand(Brand brand) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.save(brand);
		transaction.commit();
		session.close();
	}

	
	@Override
	public Brand findBrand(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Brand brand =session.get(Brand.class, id);
		transaction.commit();
		session.close();
		return brand;
		
	}
	@Override
	public void updateBrand(Brand brand) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(brand);
		transaction.commit();
		session.close();
	}
	@Override
	public Boolean isDuplicateName(String brandName){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<String> brandNames = session.createNativeQuery("select name  from brand").getResultList();
		transaction.commit();
		session.close();
		System.out.println(brandNames);
		for(int i = 0 ; brandNames!=null && i<brandNames.size(); i++){
			if(brandNames.get(i).equalsIgnoreCase(brandName.trim())){
				return true;
			}
		}
		
		return false;
	}
	@Override
	public List<Brand> findAllBrand() {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<Brand>  brandList= (List<Brand>) session.createQuery("from Brand").list();
		transaction.commit();
		session.close();
		return brandList;
	}

	@Override
	public void deleteBrand(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		Brand brand= session.get(Brand.class, id);
		session.delete(brand);
		transaction.commit();
		session.close();
	}
	
	private Integer totalRecordOfBrand(){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		Number totalRecord = (Number) session.createNativeQuery("select count(*) from brand").getSingleResult();
		transaction.commit();
		session.close();
		return totalRecord.intValue();
	}
	
	private List<Brand> pagingFindBrand(Integer startIndex , Integer pageSize){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<Brand> BrandList = session.createQuery("from Brand").setFirstResult(startIndex).setMaxResults(pageSize).list();
		transaction.commit();
		session.close();
		return BrandList;
	}
	@Override
	public QueryResultOfBrand getQueryResultOfBrand(PageInfoOfBrand queryInfo){
		QueryResultOfBrand queryResult = new QueryResultOfBrand();
		queryResult.setBrandList(pagingFindBrand(queryInfo.getStartIndex(), queryInfo.getPageSize()));
		queryResult.setTotalRecord(totalRecordOfBrand());
		return queryResult;
	}
	@Override
	public List<Brand> likeBlurredSearchBrand(Object conditionParam) {
		List<Brand> BrandList;
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<String> fieldNames = JdbcUtils.classFields(Brand.class);
		StringBuilder sBuilder = new StringBuilder("select * from Brand where ");
		for(String fieldName : fieldNames){
			sBuilder.append(fieldName+" like \"%"+conditionParam+"%\" or ");
		}
		sBuilder.trimToSize();
		String sql = sBuilder.substring(0, sBuilder.lastIndexOf("or"));
		BrandList = session.createNativeQuery(sql).addEntity(Brand.class).list();
		transaction.commit();
		session.close();
		return BrandList;
	}
	@Test
	public void test(){
		//Brand Brand = new Brand("1" , "SUPERIORProduct","我的高档产品 " , null);
		//addBrand(Brand);
		//System.out.println(findBrand("1"));
		//System.out.println(findAllBrand());
		//deleteBrand("1");
		//isDuplicateName("SUPERIORPRODUCT");
		isDuplicateName("BrandName");
		/*PageInfoOfBrand queryInfo = new PageInfoOfBrand();
		queryInfo.setCurrentPage(1);
		queryInfo.setPageSize(3);
		System.out.println(getQueryResultOfBrand(queryInfo));*/
	}
}
