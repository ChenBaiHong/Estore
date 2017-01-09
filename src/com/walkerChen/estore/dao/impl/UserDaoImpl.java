package com.walkerChen.estore.dao.impl;

import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.dao.UserDao;
import com.walkerChen.estore.commonUtils.JdbcUtils;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 * private int id; // 用户编号
 private String username; // 用户名
 private String password; // 密码
 private String nickname; // 昵称
 private String email; // 邮箱
 private String cellphone;//联系电话
 private String address;//联系地址
 private boolean state; // 是否激活
 private String activecode; // 激活码 UUID获取
 private Timestamp updatetime; // 更新时间
 * @author hareClase
 *
 *create table user(
id varChar(40),
username varChar(25) unique not null,
password varChar(40) not null,
nickname varChar(25) not null,
email varChar(60)  not null,
cellphone varChar(25) not null,
address varChar(225) not null,
state boolean not null,
activecode varChar(599) ,
updatetime timestamp
);
 */
@SuppressWarnings("all")
public class UserDaoImpl implements UserDao {

	@Override
	public void addUser(User user){
		try{
			QueryRunner runner = new QueryRunner();
			String sql = "INSERT INTO USER(ID,USERNAME,PASSWORD,NICKNAME,EMAIL,CELLPHONE,ADDRESS,STATE,ACTIVECODE,UPDATETIME)VALUES(?,?,?,?,?,?,?,?,?,?)";
			Object[] params = {user.getId(),user.getUsername(),user.getPassword(),user.getRealname(),user.getEmail(),user.getCellphone(),user.getAddress(),user.getState(),user.getActivecode(),user.getUpdatetime()};
			runner.update(JdbcUtils.getConnection(),sql , params);
		}catch(
				Exception e){
			throw new RuntimeException(e);
		}
	}
	
	@Override
	@SuppressWarnings("all")
	public User findUser(String id){
		try{
		QueryRunner runner = new QueryRunner();
		String sql="SELECT * FROM USER WHERE ID=?";
		
		User user = (User) runner.query(JdbcUtils.getConnection(), sql, id, new BeanHandler(User.class));
		return user;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	
	@Override
	@SuppressWarnings("all")
	public User  findUser(String username , String password){
		try{
			QueryRunner runner= new QueryRunner();
			String sql ="SELECT * FROM USER WHERE USERNAME=? AND PASSWORD=?";
			Object[] params = {username , password};
			User user = (User) runner.query(JdbcUtils.getConnection(), sql, params, new BeanHandler(User.class));
			return user;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	@Override
	@SuppressWarnings("all")
	public List<User> findAllUser(String state){
		try{
			QueryRunner runner = new QueryRunner();
			String sql="SELECT * FROM USER WHERE STATE=?";
			List<User> users = (List<User>) runner.query(JdbcUtils.getConnection(), sql, state,new BeanListHandler(User.class));
			return users;
		}catch(Exception e){
		throw new RuntimeException(e);	
		}
	}

	@Override
	public List<User> searchLikeUser(Object conditionParam) {
		List<String> columnNames=sqlFieldName();
		StringBuilder builder = new StringBuilder();
		builder.append("SELECT * FROM ").append(User.class.getSimpleName()).append(" WHERE ");
		for(String column :columnNames){
			builder.append(column+" LIKE "+"'"+conditionParam+"%' || ");
		}
		String sql = builder.toString().trim();
		sql = sql.substring(0, sql.lastIndexOf("||")-1);
		try{
			QueryRunner runner = new QueryRunner();
			List<User> beans =(List<User>) runner.query(JdbcUtils.getConnection(),sql, new BeanListHandler(User.class));
			return beans;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	private List<String> sqlFieldName(){
		try{
			List<String> columnNames = new ArrayList<String>();
			Connection connection = JdbcUtils.getConnection();
			DatabaseMetaData metaData = connection.getMetaData();
			// 通过连接获取数据库元数据信息，获取表信息
			ResultSet tableResultSet = metaData.getTables(null, "%", User.class.getSimpleName(), new String[] { "TABLE" });
			while (tableResultSet.next()) {
				ResultSet resultSetColumn= metaData.getColumns(null, "%", User.class.getSimpleName(), "%");
				while(resultSetColumn.next()){
					String columnName = resultSetColumn.getString("COLUMN_NAME");
					Field[] fields = User.class.getDeclaredFields();
					for(Field field: fields){
						field.setAccessible(true);
						String fieldName = field.getName();
						if(fieldName.equalsIgnoreCase(columnName)){
							columnNames.add(columnName);
						}
					}
				}
			}
			return columnNames;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	@Override
	public boolean isExistSimilarUsername(String username) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User findUserByActivecode(String activecode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void UpdateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean isExistSimilarEmail(String email) {
		return false;
	}

	@Override
	public boolean isExistSimilaCellphone(String cellphone) {
		return false;
	}
}

