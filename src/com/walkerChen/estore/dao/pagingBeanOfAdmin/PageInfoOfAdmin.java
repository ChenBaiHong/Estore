package com.walkerChen.estore.dao.pagingBeanOfAdmin;

public class PageInfoOfAdmin {
	private int currentPage=1;
	
	private int pageSize=4;
	
	private int queryStartIndex;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getQueryStartIndex() {
		this.queryStartIndex = (this.currentPage-1)*this.pageSize;
		return this.queryStartIndex;
	}
}
