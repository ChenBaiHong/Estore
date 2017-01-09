package com.walkerChen.estore.dao.pagingBeanOfAdmin;

import java.util.ArrayList;
import java.util.List;

import com.walkerChen.estore.bean.backstage.Admin;

public class AdminPageBean {
	private List<Admin> adminList = new ArrayList<Admin>();//分页查询数库的管理员
	
	private int totalPage;//总页数
	
	private int totalRecordOfAdmin;//总记录数
	
	private int currentPage=1;//默认当前页是1
	
	private int pageSize=4;//默认网页大小是4条记录
	
	private int queryStartIndex;//数据库查询的开始下标
	
	private int[] pagingBar;
	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	public int getTotalPage() {
		if(totalRecordOfAdmin%pageSize==0){
			this.totalPage=this.totalRecordOfAdmin/this.pageSize;
		}else{
			this.totalPage=this.totalRecordOfAdmin/this.pageSize+1;
		}
		return this.totalPage;
	}
	public int getTotalRecordOfAdmin() {
		return totalRecordOfAdmin;
	}

	public void setTotalRecordOfAdmin(int totalRecordOfAdmin) {
		this.totalRecordOfAdmin = totalRecordOfAdmin;
	}

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
		return queryStartIndex;
	}

	public void setQueryStartIndex(int queryStartIndex) {
		this.queryStartIndex = queryStartIndex;
	}
	
	//默认的页面分页的显示状态码是两个
	public int[] getPagingBar() {
		int startPage;
		int endPage;
		if(totalPage<2){
			startPage=1;
			endPage=this.totalPage;
		}else{
			startPage=this.currentPage;
			endPage = this.currentPage+1;
			if(startPage<1){
				startPage=1;
				endPage=2;
			}
			if(endPage>this.totalPage){
				endPage=this.totalPage;
				startPage=this.totalPage-1;
			}
		}
		pagingBar = new int[endPage-startPage+1];//防止出现空指针异常，1-1+1
		int index=0;
		for(;startPage<=endPage;startPage++){
			pagingBar[index++]=startPage;
		}
		return pagingBar;
	}
}
