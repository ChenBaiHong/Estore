package com.walkerChen.estore.dao.pagingBeanOfBrand;

import java.util.Arrays;
import java.util.List;

import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.businessService.BusinessServiceImpl;

public class PageBeanOfBrand {
	private List<Brand> brandList;
	private int totalRecord ;
	private int startIndex;
	private int pageSize;
	private int currentPage;
	private int totalPage;
	private int[] pageBar;
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
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		if(totalRecord%pageSize==0){
			this.totalPage=this.totalRecord/this.pageSize;
		}else{
			this.totalPage=this.totalRecord/this.pageSize+1;
		}
		return this.totalPage;
	}
	
	public int[] getPageBar() {
		int startPage;
		int endPage;
		if(this.totalPage<3){
			startPage = 1;
			endPage = this.totalPage;
		}else{
			endPage = this.currentPage+1;
			startPage = this.currentPage-1;
			if(startPage<1){
				startPage=1;
				endPage=3;
			}if(endPage>this.totalPage){
				startPage=this.totalPage-2;
				endPage=this.totalPage;
			}
		}
		this.pageBar = new int[endPage-startPage+1];//防止出现空指针异常，1-1+1
		int index = 0;
		for(;startPage<=endPage;startPage++){
			this.pageBar[index++]=startPage;
		}
		return this.pageBar;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setPageBar(int[] pageBar) {
		this.pageBar = pageBar;
	}

	
	@Override
	public String toString() {
		return "PageBeanOfBrand [brandList=" + brandList + ", totalRecord="
				+ totalRecord + ", startIndex=" + startIndex + ", pageSize="
				+ pageSize + ", currentPage=" + currentPage + ", totalPage="
				+ totalPage + ", pageBar=" + Arrays.toString(pageBar) + "]";
	}
	public static void main(String[] args){
		PageInfoOfBrand pageInfo = new PageInfoOfBrand();
		PageBeanOfBrand pageBean = new BusinessServiceImpl().getPageBeanOfBrand(pageInfo);
		System.out.println(pageBean);
		System.out.println(pageBean.getTotalPage());
		System.out.println(pageBean.getPageBar()[0]);
	}
}
