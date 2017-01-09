package com.walkerChen.estore.dao;

import com.walkerChen.estore.bean.backstage.Privilege;

import java.util.List;



public interface PrivilegeDao {

	public abstract void addPrivilege(Privilege privilege);
	public abstract void updatePrivilege(Privilege privilege);
	public abstract Privilege findPrivilege(String id);

	public abstract List<Privilege> findAllPrivilege();

	public abstract void deletePrivilege(String id);

	public abstract Privilege searchPrivilege(String name);
	
	public abstract List<Privilege> searchLikePrivilege(String searchCondition);
}