package com.walkerChen.estore.dao;

import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.dao.pagingBeanOfRole.PageInfo;
import com.walkerChen.estore.dao.pagingBeanOfRole.RoleResult;

import java.util.List;


public interface RoleDao {

	public abstract void addRole(Role role);

	public abstract Role findRole(String id);
	
	public abstract Boolean isExistRole(String name);

	public abstract List<Role> findAllRole();

	public abstract void deleteRole(String id);

	public void updateOfRolePrivilege(String roleId, String description, List<Privilege> privilegeList);
	
	List<Role> pagingSearchRole(int startIndex, int pagingSize);
	
	public RoleResult queryRoleResult(PageInfo pageInfo);

	void updateRoleName(String name, String roleId);
}