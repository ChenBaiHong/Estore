package com.walkerChen.estore.dao;

import java.util.List;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.PageInfoOfAdmin;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.QueryResultOfAdmin;

public interface AdminDao {

	public abstract void addAdmin(Admin admin);

	public abstract Admin findAdmin(String id);

	public abstract Admin findAdmin(String username, String password);

	public abstract List<Admin> findAllAdmin();

	public abstract void updateAdmin(Admin amdin);

	List<String> findAllAdminName();

	List<Admin> pagingSearchAdmin(int startIndex, int pagingSize);
	
	public QueryResultOfAdmin queryAdminResult(PageInfoOfAdmin pageInfo);

	void deleteAdmin(String adminId);

	List<Admin> searchLikeAdmin(String searchCondition);

	public void alterAdminName(String id, String newName);
}