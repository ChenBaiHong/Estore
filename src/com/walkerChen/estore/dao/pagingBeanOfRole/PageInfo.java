package com.walkerChen.estore.dao.pagingBeanOfRole;
@SuppressWarnings("all")
/**
 * 来自页面默认的分页数据
 * @author cbh12
 *
 */
public class PageInfo {
	private int currentPage=1;//用户的当前所在页面
	private int pageSize=4;//当前页面的数据数量
	private int startIndex;//记住用户看的页的起始位置
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
	public int getStartIndex() {
		return startIndex=(this.currentPage-1)*this.pageSize;
		//从“0”开始显示3条数据
		//相当于     select name , type from customer limit 0,3;   中的“0”是开始数据查询的位置  currentPage=1
		//从“3”开始显示3条数据
		//以此类推  select name , type from customer limit 3,3;   中的“3”是开始数据查询的位置  currentPage=2
		//从“6”开始显示3条数据
		//以此类推  select name , type from customer limit 6,3;   中的“6”是开始数据查询的位置  currentPage=3
	}
}
