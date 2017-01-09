package com.walkerChen.estore.dao.impl;
/**
    id varChar(40) primary key,
	username varChar(25) unique not null,
	password varChar(40) not null,
	description varChar(225)
 */

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.WebUtils;
import com.walkerChen.estore.dao.AdminDao;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.PageInfoOfAdmin;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.QueryResultOfAdmin;


@SuppressWarnings("all")
public class AdminDaoImpl implements AdminDao {
	@Override
	public void addAdmin(Admin admin){
		try {
			QueryRunner runner = new QueryRunner();
			System.out.println(admin+"=========================我是在adminDao38行");
			String sql = "INSERT INTO ADMIN(ID,ADMINNAME,PASSWORD,IMGLOCAL,DESCRIPTION)VALUES(?,?,?,?,?)";
			Object[] params = { admin.getId(), admin.getAdminname(),
					admin.getPassword(), admin.getImgLocal(),
					admin.getDescription() };
			runner.update(JdbcUtils.getConnection(), sql, params);
			Set<Role> roles = admin.getRoleSet();

			Iterator<Role> iterator = roles.iterator();
			while (iterator.hasNext()) {
				Role role = iterator.next();
				sql = "INSERT INTO ADMIN_ROLE(ADMIN_ID,ROLE_ID)VALUES(?,?)";
				params = new Object[] { admin.getId(), role.getId() };
				runner.update(JdbcUtils.getConnection(), sql, params);
			}

		} catch (Exception e) {

			throw new com.walkerChen.estore.commonUtils.MySecurityException("addAdminFailed");
		}
	}
	
	@Override
	@SuppressWarnings("all")
	public Admin findAdmin(String id){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM ADMIN WHERE ID=?";
			Admin admin = (Admin) runner.query(JdbcUtils.getConnection(), sql, id, new BeanHandler(Admin.class));
			sql = "SELECT r.* FROM ADMIN_ROLE ar , ROLE r WHERE ar.ROLE_ID=r.ID AND ar.ADMIN_ID=?";
			List<Role> roles = (List<Role>) runner.query(JdbcUtils.getConnection(),sql,id,new BeanListHandler(Role.class));
			if(roles!=null){
				for(Role role : roles){
				sql="SELECT p.*FROM  ROLE_PRIVILEGE rp, PRIVILEGE p WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=? ";
				List<Privilege>privileges =(List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, role.getId(), new BeanListHandler(Privilege.class));
				role.getPrivilegeSet().addAll(privileges);
				}
				admin.getRoleSet().addAll(roles);
			}
			return admin;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	@SuppressWarnings("all")
	public Admin findAdmin(String username , String password){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM ADMIN WHERE ADMINNAME=? AND PASSWORD=?";
			Object[] params = {username , password};
			Admin admin = (Admin) runner.query(JdbcUtils.getConnection(), sql, params, new BeanHandler(Admin.class));
			if(admin==null){
				return null;
			}
			sql = "SELECT r.* FROM ADMIN_ROLE ar , ROLE r WHERE ar.ROLE_ID=r.ID AND ar.ADMIN_ID=?";
			List<Role> roles = (List<Role>) runner.query(JdbcUtils.getConnection(),sql,admin.getId(),new BeanListHandler(Role.class));
			if(roles!=null){
				for(Role role : roles){
				sql="SELECT p.*FROM  ROLE_PRIVILEGE rp, PRIVILEGE p WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=? ";
				List<Privilege>privileges =(List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, role.getId(), new BeanListHandler(Privilege.class));
				role.getPrivilegeSet().addAll(privileges);
				}
				admin.getRoleSet().addAll(roles);
			}
			return admin;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public List<Admin> findAllAdmin(){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM ADMIN";
			List<Admin> admins = (List<Admin>) runner.query(JdbcUtils.getConnection(), sql, new BeanListHandler(Admin.class));
			for(Admin admin : admins){
				sql = "SELECT r.* FROM ADMIN_ROLE ar , ROLE r WHERE ar.ROLE_ID=r.ID AND ar.ADMIN_ID=?";
				List<Role> roles = (List<Role>) runner.query(JdbcUtils.getConnection(),sql,admin.getId(),new BeanListHandler(Role.class));
				for(Role role : roles){
					sql="SELECT p.*FROM  ROLE_PRIVILEGE rp, PRIVILEGE p WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=? ";
					List<Privilege>privileges =(List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, role.getId(), new BeanListHandler(Privilege.class));
					role.getPrivilegeSet().addAll(privileges);
				}
				admin.getRoleSet().addAll(roles);
			}
			return admins;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	
	@Override
	public void updateAdmin(Admin admin){
		try{
			QueryRunner runner  = new QueryRunner();
			String sql = "DELETE FROM ADMIN_ROLE WHERE ADMIN_ID=?";
			runner.update(JdbcUtils.getConnection(), sql, admin.getId());
			
			sql = "DELETE FROM ADMIN WHERE ID=?";
			runner.update(JdbcUtils.getConnection(), sql, admin.getId());
			
			sql = "INSERT INTO ADMIN(ID,ADMINNAME,PASSWORD,IMGLOCAL,DESCRIPTION)VALUES(?,?,?,?,?)";
			Object[] params = { admin.getId(), admin.getAdminname(),
					admin.getPassword(), admin.getImgLocal(),
					admin.getDescription() };
			runner.update(JdbcUtils.getConnection(), sql, params);
			Set<Role> roles = admin.getRoleSet();
			
			Iterator<Role> iterator = roles.iterator();
			while (iterator.hasNext()) {
				Role role = iterator.next();
				sql = "INSERT INTO ADMIN_ROLE(ADMIN_ID,ROLE_ID)VALUES(?,?)";
				params = new Object[] {admin.getId(), role.getId() };
				runner.update(JdbcUtils.getConnection(), sql, params);
			}

		} catch (Exception e) {
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException("updateAdminFailed");
		}
	}
	@Override
	public List<String>  findAllAdminName(){
		try{
			List<String> adminnames = new ArrayList<String>();
			String sql="SELECT adminname FROM ADMIN";
			Connection connection = JdbcUtils.getConnection();
			Statement statement = connection.createStatement();
			ResultSet resultSet= statement.executeQuery(sql);
			while(resultSet.next()){
				adminnames.add(resultSet.getString("adminname"));
			}
			return adminnames;
		}catch(Exception e){
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public void deleteAdmin(String adminId){
		try{
			System.out.println(adminId);
			Admin admin = findAdmin(adminId);
			if(admin.getImgLocal()!=null){
				new WebUtils().deleteFileInfo(admin.getImgLocal());
			}
			QueryRunner runner  = new QueryRunner();
			String sql = "DELETE FROM ADMIN_ROLE WHERE ADMIN_ID=?";
			runner.update(JdbcUtils.getConnection(), sql, adminId);
			sql = "DELETE FROM ADMIN WHERE ID=?";
			runner.update(JdbcUtils.getConnection(), sql, adminId);
			
		}catch(Exception e){
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}

	@Override
	public List<Admin> pagingSearchAdmin(int startIndex, int pagingSize) {
		try{
			QueryRunner queryRunner = new QueryRunner();
			String sql = "select * from admin limit ?,?";
			Object[] params = {startIndex , pagingSize};
			List<Admin> adminList = (List<Admin>) queryRunner.query(JdbcUtils.getConnection(), sql,params, new BeanListHandler(Admin.class));
			for(int i = 0 ; adminList!=null && i<adminList.size() ; i++){
				sql = "SELECT r.* FROM ADMIN_ROLE ar , ROLE r WHERE ar.ROLE_ID=r.ID AND ar.ADMIN_ID=?";
				List<Role> roleList = (List<Role>) queryRunner.query(JdbcUtils.getConnection(),sql,adminList.get(i).getId(),new BeanListHandler(Role.class));
				for(int j = 0 ;roleList!=null && j<roleList.size();j++){
					sql="SELECT p.*FROM  ROLE_PRIVILEGE rp, PRIVILEGE p WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=? ";
					List<Privilege>privileges =(List<Privilege>) queryRunner.query(JdbcUtils.getConnection(), sql, roleList.get(j).getId(), new BeanListHandler(Privilege.class));
					roleList.get(j).getPrivilegeSet().addAll(privileges);
				}
				adminList.get(i).getRoleSet().addAll(roleList);
			}
			return adminList;
		}catch(Exception e){
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	public int totalRecord(){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT COUNT(*) FROM Admin";
			long totalRecord =  (long) runner.query(JdbcUtils.getConnection(), sql,  new ScalarHandler());//...new ScalarHandler() ，查询出的是长整型整数
			return new Long(totalRecord).intValue();
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	} 
	@Override
	public QueryResultOfAdmin queryAdminResult(PageInfoOfAdmin pageInfo) {
		List<Admin> adminList =pagingSearchAdmin(pageInfo.getQueryStartIndex(), pageInfo.getPageSize());
		int totalRecord = totalRecord();
		QueryResultOfAdmin adminResult = new QueryResultOfAdmin();
		adminResult.setAdminList(adminList);
		adminResult.setTotalRecordOfAdmin(totalRecord);
		return adminResult;
	}
	
	@Override
	public List<Admin> searchLikeAdmin(String searchCondition) {
		try{
			QueryRunner queryRunner = new QueryRunner();
			String sql = "select * from Admin where adminname like \"%"+searchCondition+"%\"";
			List<Admin> adminList =(List<Admin>) queryRunner.query(JdbcUtils.getConnection(),sql,new BeanListHandler(Admin.class));
			for(int i = 0 ; adminList!=null && i<adminList.size();i++){
				sql = "SELECT r.* FROM ADMIN_ROLE ar , ROLE r WHERE ar.ROLE_ID=r.ID AND ar.ADMIN_ID=?";
				List<Role> roleList = (List<Role>) queryRunner.query(JdbcUtils.getConnection(),sql,adminList.get(i).getId(),new BeanListHandler(Role.class));
				for(int j = 0 ;roleList!=null && j<roleList.size();j++){
					sql="SELECT p.*FROM  ROLE_PRIVILEGE rp, PRIVILEGE p WHERE rp.PRIVILEGE_ID=p.ID AND rp.ROLE_ID=? ";
					List<Privilege>privileges =(List<Privilege>) queryRunner.query(JdbcUtils.getConnection(), sql, roleList.get(j).getId(), new BeanListHandler(Privilege.class));
					roleList.get(j).getPrivilegeSet().addAll(privileges);
				}
				adminList.get(i).getRoleSet().addAll(roleList);
			}
			return adminList;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public void alterAdminName(String id , String newName){
		try{
			QueryRunner queryRunner = new QueryRunner();
			String sql = "update Admin set adminname=? where id=?";
			Object[] params = {newName , id};
			queryRunner.update(JdbcUtils.getConnection(), sql, params);
		}catch(Exception e){
			e.printStackTrace();
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
}
