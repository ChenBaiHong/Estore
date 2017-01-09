package com.walkerChen.estore.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.dao.RoleDao;
import com.walkerChen.estore.dao.pagingBeanOfRole.PageInfo;
import com.walkerChen.estore.dao.pagingBeanOfRole.RoleResult;


/**
 create table role(
	id varChar(40) primary key,
	name varChar(20) unique not null,
	description varChar(225)
);

 * @author hareClase
 	private String id; 
	private String name ; 
	private String description;
	private Set<Privilege> privilegeSet = new HashSet<Privilege>();
	
 */
@SuppressWarnings("all")
public class RoleDaoImpl implements RoleDao {
	@Override
	public void addRole(Role role){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "INSERT INTO ROLE(ID,NAME,DESCRIPTION)VALUES(?,?,?)";
			Object[] params ={role.getId(),role.getName(),role.getDescription()};
			runner.update(JdbcUtils.getConnection(), sql, params);
			Set<Privilege>privilegeList = role.getPrivilegeSet();
			Iterator<Privilege> iterator = privilegeList.iterator();
			while(iterator.hasNext()){
				Privilege privilege = iterator.next();
				sql="INSERT INTO ROLE_PRIVILEGE(ROLE_ID,PRIVILEGE_ID)VALUES(?,?)";
				params=new Object[]{role.getId(),privilege.getId()};
				runner.update(JdbcUtils.getConnection(), sql, params);
			}
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public Role findRole(String id){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT * FROM ROLE WHERE ID=?";
			Role role = (Role) runner.query(JdbcUtils.getConnection(), sql, id, new BeanHandler(Role.class));
			sql="SELECT p.* FROM PRIVILEGE p , ROLE_PRIVILEGE rp WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=?";
			List<Privilege>privilegeList= (List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, id, new BeanListHandler(Privilege.class));
			role.getPrivilegeSet().addAll(privilegeList);
			return role;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	
	@Override
	@SuppressWarnings("all")
	public List<Role> findAllRole(){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM ROLE";
			List<Role> roleList = (List<Role>) runner.query(JdbcUtils.getConnection(), sql, new BeanListHandler(Role.class));
			for(Role role : roleList){
				sql="SELECT p.* FROM PRIVILEGE p , ROLE_PRIVILEGE rp WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=?";
				List<Privilege>privilegeList= (List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, role.getId(), new BeanListHandler(Privilege.class));
				role.getPrivilegeSet().addAll(privilegeList);
			}
			return roleList;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	
	@Override
	public void deleteRole(String id){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="DELETE FROM ROLE_PRIVILEGE WHERE ROLE_ID=?";
			runner.update(JdbcUtils.getConnection(), sql, id);
			sql="DELETE FROM ROLE WHERE ID=?";
			runner.update(JdbcUtils.getConnection(), sql, id);
		}catch(Exception e){
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException("dataBindingError");
		}
	}
	
	@Override
	public void updateOfRolePrivilege(String roleId,String description ,List<Privilege> privilegeList){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "DELETE FROM ROLE_PRIVILEGE WHERE ROLE_ID=?";
			runner.update(JdbcUtils.getConnection(), sql, roleId);
			if(privilegeList!=null){
					for(Privilege privilege : privilegeList){
					sql="INSERT INTO ROLE_PRIVILEGE(ROLE_ID,PRIVILEGE_ID)VALUES(?,?)";
					Object[] params = {roleId,privilege.getId()};
					runner.update(JdbcUtils.getConnection(), sql, params);
				}
			}
			if(description!=null && description!=""){
				sql = "update role set DESCRIPTION=? WHERE ID=?";
				Object[] params = {description,roleId};
				runner.update(JdbcUtils.getConnection(), sql, params);
			}
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public void updateRoleName(String name,String roleId){
		try{
			QueryRunner runner = new QueryRunner();
			if(name!=null){
				String sql = "update role set name=? WHERE ID=?";
				Object[] params = {name,roleId};
				runner.update(JdbcUtils.getConnection(), sql, params);
			}
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public Boolean isExistRole(String name) {
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT * FROM ROLE WHERE NAME=?";
			Role role = (Role) runner.query(JdbcUtils.getConnection(), sql, name, new BeanHandler(Role.class));
			if(role==null){
				return false;
			}
			return true;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public List<Role> pagingSearchRole(int startIndex , int pagingSize){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM ROLE limit "+startIndex+","+pagingSize;
			List<Role> roleList = (List<Role>) runner.query(JdbcUtils.getConnection(), sql, new BeanListHandler(Role.class));
			for(Role role : roleList){
				sql="SELECT p.* FROM PRIVILEGE p , ROLE_PRIVILEGE rp WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=?";
				List<Privilege>privilegeList= (List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, role.getId(), new BeanListHandler(Privilege.class));
				role.getPrivilegeSet().addAll(privilegeList);
			}
			return roleList;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}

	public int totalRecord(){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT COUNT(*) FROM ROLE";
			long totalRecord =  (long) runner.query(JdbcUtils.getConnection(), sql,  new ScalarHandler());//...new ScalarHandler() ，查询出的是长整型整数
			return new Long(totalRecord).intValue();
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	} 
	/**
	 * 根据页面的查询信息，返回查询结果
	 * @param pageInfo
	 * @return
	 */
	@Override
	public RoleResult queryRoleResult(PageInfo pageInfo){
		List<Role> roleList = pagingSearchRole(pageInfo.getStartIndex() , pageInfo.getPageSize());
		int totalRecord = totalRecord();
		RoleResult roleResult = new RoleResult();
		roleResult.setRoleList(roleList);
		roleResult.setTotalRecord(totalRecord);
		return roleResult;
	}
}
