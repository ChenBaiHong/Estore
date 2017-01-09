package com.walkerChen.estore.dao.implHbm;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.commonUtils.HibernateUtils;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.dao.CategoryDao;
@SuppressWarnings("all")
public class CategoryDaoImpl implements CategoryDao{
	/**
	 * 添加分类， 在这里分类有阶层的概念
	 */
	@Override
	public void addCategory(Category category) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.save(category);
		transaction.commit();
		session.close();
	}
	/**
	 * 查找某一个产品
	 */
	@Override
	public Category findCategory(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Category category = session.get(Category.class, id);
		transaction.commit();
		session.close();
		return category;
	}

	@Override
	public List<Category> findAllCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	//查找同一阶层的分类
	@Override
	public  List<Category> findCategoryByLayer(int layer){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<Category> subCategoryList =
				session.createNativeQuery("select * from category where layer='"+layer+"' order by layer asc").addEntity(Category.class).getResultList();
		transaction.commit();
		session.close();
		return subCategoryList;
	}
	//查找同一阶层的分类，在父类的基础上
	@Override
	public  List<Category> findCategoryByLayerAndParentId(int layer , String parentId){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<Category> subCategoryList =
				session.createNativeQuery("select * from category where parentId=\""+parentId+"\" and layer='"+layer+"' order by layer asc").addEntity(Category.class).getResultList();
		transaction.commit();
		session.close();
		return subCategoryList;
	}
	@Override
	public void deleteCategory(String id) {
		//下面是开始hibernate删除分类
		Session session =HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Category category = session.get(Category.class,id);
		session.delete(category);
		transaction.commit();
		session.close();
	}

	@Override
	public Boolean isDuplicateCategoryInSubcategory(String categoryName, String id) {
		
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<String> categoryNames=null;
		if(id!=null && !id.trim().equals("")){
			Category category = session.get(Category.class, id);
			categoryNames = session.createNativeQuery("select name from category where layer='"+(category.getLayer()+1)+"' and parentId=\""+id+"\"").getResultList();
		}else{
			categoryNames = session.createNativeQuery("select name from category").getResultList();
		}
		for(int i = 0 ; categoryNames!=null && i<categoryNames.size(); i++){
			if(categoryNames.get(i).equalsIgnoreCase(categoryName)){
				return true;
			}
		}
		transaction.commit();
		session.close();
		return false;
	}

	@Override
	public List<Category> likeBlurredSearchCategory(Object conditionParam) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<String> categoryColumns = JdbcUtils.tableField(Category.class);
		StringBuilder sBuilder = new StringBuilder("select * from category where ");
		for(int i = 0 ; categoryColumns!=null && i<categoryColumns.size();i++){
			sBuilder.append(categoryColumns.get(i)+" like \"%"+conditionParam+"%\" or ");
		}
		sBuilder.trimToSize();
		String sql = sBuilder.substring(0,sBuilder.lastIndexOf("or"));
		List<Category> categoryList = session.createNativeQuery(sql).addEntity(Category.class).getResultList();
		transaction.commit();
		session.close();
		return categoryList;
	}
	/**
	 * 更新产品
	 */
	@Override
	public void updateCategory(Category category) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(category);
		transaction.commit();
		session.close();
	}
	@Test
	public void playground(){
		
		
			//1 导航分类项
			Category category =this.findCategory("402881e7587f7f2b01588025b3a40016");
			List<Category> sortCategory = new ArrayList<Category>();
			sortCategory.addAll(category.getSubCategorys());
			Collections.sort(sortCategory, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			category.setSubCategorys(new HashSet<Category>());
			category.getSubCategorys().addAll(sortCategory);
			System.out.print(sortCategory);
	}
}
