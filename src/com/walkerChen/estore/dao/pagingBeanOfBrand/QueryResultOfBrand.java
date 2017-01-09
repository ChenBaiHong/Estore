package com.walkerChen.estore.dao.pagingBeanOfBrand;

import java.util.List;

import com.walkerChen.estore.bean.substance.Brand;

public class QueryResultOfBrand {
	private List<Brand> brandList;
	private int totalRecord ;
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	@Override
	public String toString() {
		return "QueryResultOfBrand [brandList=" + brandList + ", totalRecord="
				+ totalRecord + "]";
	}
	
}
