package com.walkerChen.estore.dao;

import java.util.List;

import com.walkerChen.estore.bean.substance.Category;
public interface CategoryDao {
	
	public void addCategory(Category category);

	public Category findCategory(String id);

	public List<Category> findCategoryByLayer(int layer);
	
	public List<Category> findAllCategory();

	public void deleteCategory(String id);

	public Boolean isDuplicateCategoryInSubcategory(String categoryName, String id) ;

	public List<Category> likeBlurredSearchCategory(Object conditionParam);

	public void updateCategory(Category category);

	List<Category> findCategoryByLayerAndParentId(int layer, String parentId);
}
