package com.walkerChen.estore.dao.pagingBeanOfAdmin;

import java.util.ArrayList;
import java.util.List;

import com.walkerChen.estore.bean.backstage.Admin;

public class QueryResultOfAdmin {
	private List<Admin> adminList = new ArrayList<Admin>();
	
	private int totalRecordOfAdmin;

	public List<Admin> getAdminList() {
		return adminList;
	}

	public void setAdminList(List<Admin> adminList) {
		this.adminList = adminList;
	}

	public int getTotalRecordOfAdmin() {
		return totalRecordOfAdmin;
	}

	public void setTotalRecordOfAdmin(int totalRecordOfAdmin) {
		this.totalRecordOfAdmin = totalRecordOfAdmin;
	}
}
