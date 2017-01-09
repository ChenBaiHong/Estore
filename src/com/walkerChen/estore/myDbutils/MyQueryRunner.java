package com.walkerChen.estore.myDbutils;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import javax.sql.DataSource;

import com.walkerChen.estore.commonUtils.JdbcUtils;
@SuppressWarnings("all")
public class MyQueryRunner {
	
	@Override
	public String toString() {
		return "MyQueryRunner []";
	}
	/**
	 * 操作删改
	 * @param connection
	 * @param sql
	 * @param params
	 * @throws SQLException
	 */
	public void update(Connection connection , String sql , Object [] params) throws SQLException{
		PreparedStatement preparedStatement = null;
		preparedStatement = connection.prepareStatement(sql);
		for(int i = 0 ; i<params.length ; i++){
			preparedStatement.setObject(i+1, params[i]);
		}
		preparedStatement.executeUpdate();
	}
	/**
	 * 操作查询
	 * @param connection
	 * @param sql
	 * @param params
	 * @param clazz
	 * @return
	 * @throws SQLException
	 */
	public Object queryBean(Connection connection , String sql , Object [] params, Class clazz) throws SQLException{
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		for(int i = 0 ; i<params.length ; i++){
			preparedStatement.setObject(i+1, params[i]);
		}
		ResultSet resultSet = preparedStatement.executeQuery();
		HandleResultSet handleBean = new HandleBean(clazz);
		return handleBean.getBean(resultSet);
	}
	/**
	 * 查询出一个结果集的Bean对象
	 * @param sql
	 * @param bean
	 * @return
	 * @throws SQLException
	 */
	public Vector queryBeanVector(Connection connection , String sql ,  Class clazz) throws SQLException{
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		HandleResultSet handleBean = new HandleBean(clazz);
		return handleBean.getBeanVector(resultSet);
		
	}
	/**
	 * 查询数据的长度 ，带条件的
	 * @param connection
	 * @param sql
	 * @param params
	 * @return
	 * @throws SQLException
	 */
	public Integer queryScaler(Connection connection , String sql ,Object [] params) throws SQLException{
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		for(int i = 0 ; i<params.length ; i++){
			preparedStatement.setObject(i+1, params[i]);
		}
		ResultSet resultSet = preparedStatement.executeQuery();
		HandleResultSet handleBean = new HandleBean();
		return handleBean.getQueryScaler(resultSet);
	}
	/**
	 * 查询数据的长度 ，不带条件的
	 * @param connection
	 * @param sql
	 * @return
	 * @throws SQLException
	 */
	public  static Integer queryScaler(Connection connection , String sql) throws SQLException{
		PreparedStatement preparedStatement = connection.prepareStatement(sql);
		ResultSet resultSet = preparedStatement.executeQuery();
		HandleResultSet handleBean = new HandleBean();
		return handleBean.getQueryScaler(resultSet);
	}
	
	
	/*****************************************************************************************
									内部类操作接口 
										反射对象获取结果集   
										继承接口类      
									这是一种设计模式 策略模式
	****************************************************************************************/
	//一个结果集接口
	interface HandleResultSet{
		/**
		 * 获取class 对象一个完整的封装对象
		 * @param resultSet
		 * @return
		 */
		public Object getBean(ResultSet resultSet);
		/**
		 * 获取class对象一个完整的封装list集合对象
		 * @param resultSet
		 * @return
		 */
		public Vector getBeanVector(ResultSet resultSet);
		/**
		 * 获取数据的长度
		 * @param resultSet
		 * @return
		 */
		public Integer getQueryScaler(ResultSet resultSet);
	}
	//继承结果集接口操作bean , 可以是static
	static class HandleBean implements HandleResultSet{
		private Class clazz;
		List<String> classFields =null;
		public HandleBean(Class clazz){
			this.clazz=clazz;
			classFields = JdbcUtils.classFields(clazz);
		}
		
		public HandleBean() {
			super();
		}
		
		public Object getBean(ResultSet resultSet) {
			try{
				if(!resultSet.next()){
					return null;
				}
				//创建封装结果集到bean
				Object bean = clazz.newInstance();//如果对象不被Class实例化,那么这个实例出来的bean对象就是空壳，可能会抛出空指针
				//得到结果集元数据
				ResultSetMetaData metaData = resultSet.getMetaData();
				for(int i = 0 ; i<metaData.getColumnCount() ; i++){
					String name = metaData.getColumnName(i+1);
					Object value = resultSet.getObject(name);//来自数据库的值
					for(int j = 0 ; classFields!=null && j<classFields.size();j++){
						String fieldName = classFields.get(j);
						if(fieldName.equalsIgnoreCase(name)){
							Field field = bean.getClass().getDeclaredField(fieldName);
							if(field!=null){
								field.setAccessible(true);
								field.set(bean, value);
							}
							break;
						}
					}
				}
				return bean;
			}catch(Exception e){
				throw new RuntimeException(e);
			}
		}
		public Vector  getBeanVector(ResultSet resultSet) {
			Vector vector = new Vector();
			try {
				ResultSetMetaData metaData = resultSet.getMetaData();
				Vector column = new Vector();
				while(resultSet.next() && metaData.getColumnCount()>0){
					// 创建封装结果集到bean
					Object bean = clazz.newInstance();
					// 得到结果集元数据
					for (int i = 0; i < metaData.getColumnCount(); i++) {
						String name = metaData.getColumnName(i + 1);
						Object value = resultSet.getObject(name);//来自数据库的值
						for(int j = 0 ; classFields!=null && j<classFields.size();j++){
							String fieldName = classFields.get(j);
							if(fieldName.equalsIgnoreCase(name)){
								Field field = bean.getClass().getDeclaredField(fieldName);
								if(field!=null){
									field.setAccessible(true);
									field.set(bean, value);
								}
								break;
							}
						}
					}
					//循环一列后形成数据封装到bean的对象，添加到封装列的集合中去
					column.add(bean);
				}
				vector.add(column);
				return vector;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		@Override
		public Integer getQueryScaler(ResultSet resultSet) {
			try {
				int count = 0;
				if(resultSet.next()){
					count =resultSet.getInt(1);
				}
				return count;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
}

