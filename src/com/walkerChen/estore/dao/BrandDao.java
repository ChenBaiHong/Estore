package com.walkerChen.estore.dao;

import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageInfoOfBrand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.QueryResultOfBrand;

import java.util.List;


public interface BrandDao {

	public abstract void addBrand(Brand brand);

	public abstract Brand findBrand(String id);

	public abstract List<Brand> findAllBrand();

	public abstract void deleteBrand(String id);

	Boolean isDuplicateName(String brandName);

	QueryResultOfBrand getQueryResultOfBrand(PageInfoOfBrand queryInfo);

	public List<Brand> likeBlurredSearchBrand(Object conditionParam);

	public void updateBrand(Brand brand);

}