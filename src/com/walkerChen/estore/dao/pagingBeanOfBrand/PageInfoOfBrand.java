package com.walkerChen.estore.dao.pagingBeanOfBrand;

public class PageInfoOfBrand {
	private int startIndex;
	private int pageSize=9;
	private int currentPage=1;
	public int getStartIndex() {
		this.startIndex = (this.currentPage-1)*this.pageSize;
		return startIndex;
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
	@Override
	public String toString() {
		return "PageInfoOfBrand [startIndex=" + startIndex + ", pageSize="
				+ pageSize + ", currentPage=" + currentPage + "]";
	}
	
	
}
