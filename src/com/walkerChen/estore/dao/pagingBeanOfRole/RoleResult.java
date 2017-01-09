package com.walkerChen.estore.dao.pagingBeanOfRole;
/**
 * 来自数据库的查询数据据
 */
import java.util.ArrayList;
import java.util.List;

import com.walkerChen.estore.bean.backstage.Role;

public class RoleResult {
	private List<Role> roleList = new ArrayList<Role>();
	
	private Integer totalRecord;//总记录数

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
	
	
}
