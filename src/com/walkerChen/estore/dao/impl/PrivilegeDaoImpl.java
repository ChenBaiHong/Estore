package com.walkerChen.estore.dao.impl;


import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.dao.PrivilegeDao;

/**
 * 
 create table privilege(
	id varChar(40) primary key,
	name varChar(25) not null,
	description varChar(225)
);
 * @author hareClase
 
 	private String id;
	private String name;
	private String description;
 */
@SuppressWarnings("all")
public class PrivilegeDaoImpl implements PrivilegeDao {
	@Override
	public void addPrivilege(Privilege privilege){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="INSERT INTO PRIVILEGE(ID,NAME,DESCRIPTION)VALUES(?,?,?)";
			Object[] params={privilege.getId(),privilege.getName(),privilege.getDescription()};
			runner.update(JdbcUtils.getConnection(), sql, params);
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public void updatePrivilege(Privilege privilege){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="UPDATE PRIVILEGE SET DESCRIPTION=? WHERE ID=?";
			Object[] params={privilege.getDescription(),privilege.getId()};
			runner.update(JdbcUtils.getConnection(), sql, params);
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public Privilege findPrivilege(String id){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM PRIVILEGE WHERE ID=?";
			Privilege privilege = (Privilege) runner.query(JdbcUtils.getConnection(), sql, id, new BeanHandler(Privilege.class));
			return privilege;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	
	@Override
	@SuppressWarnings("all")
	public List<Privilege> findAllPrivilege(){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM PRIVILEGE";
			List<Privilege> privilegeList = (List<Privilege>) runner.query(JdbcUtils.getConnection(), sql, new BeanListHandler(Privilege.class));
			return privilegeList;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	
	@Override
	public void deletePrivilege(String id){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="DELETE FROM PRIVILEGE WHERE ID=?";
			runner.update(JdbcUtils.getConnection(), sql, id);
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException("dataBindingError");
		}
	}
	@Override
	public Privilege searchPrivilege(String name){
		try{
			QueryRunner queryRunner = new QueryRunner();
			String sql = "select * from privilege where name=?";
			Privilege privilege =(Privilege) queryRunner.query(JdbcUtils.getConnection(),sql,name,new BeanHandler(Privilege.class));
			return privilege;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
	@Override
	public List<Privilege> searchLikePrivilege(String searchCondition) {
		try{
			QueryRunner queryRunner = new QueryRunner();
			String sql = "select * from privilege where name like \"%"+searchCondition+"%\"";
			List<Privilege> privileges =(List<Privilege>) queryRunner.query(JdbcUtils.getConnection(),sql,new BeanListHandler(Privilege.class));
			return privileges;
		}catch(Exception e){
			throw new com.walkerChen.estore.commonUtils.MySecurityException(e);
		}
	}
}
