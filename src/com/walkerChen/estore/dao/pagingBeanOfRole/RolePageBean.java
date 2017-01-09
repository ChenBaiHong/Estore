package com.walkerChen.estore.dao.pagingBeanOfRole;

import java.util.ArrayList;
import java.util.List;

import com.walkerChen.estore.bean.backstage.Role;

/**
 * 交互页面或数据库查询的数据
 * 
 * @author cbh12
 *
 */
public class RolePageBean {
	private List<Role> roleList = new ArrayList<Role>();
	private Integer totalRecord;// 总记录数
	private int currentPage = 1;// 用户的当前所在页面
	private int totalPage;
	private int pageSize = 3;// 当前页面的数据数量
	private int startIndex;// 记住用户看的页的起始位置
	private int[] pagingBar;

	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}

	public Integer getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(Integer totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	// 总共几页数据是根据数据库查询的总记录除以用户给定的每页多少条记录
	public int getTotalPage() {
		if (this.totalRecord % this.pageSize != 0) {
			return this.totalPage = this.totalRecord / this.pageSize + 1;
		} else {
			return this.totalPage = this.totalRecord / this.pageSize;
		}
	}
	
	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
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
