package com.walkerChen.estore.commonUtils;

import java.beans.BeanInfo;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.mchange.v2.c3p0.ComboPooledDataSource;

public class JdbcUtils {
	private static DataSource dataSource;
	private static ThreadLocal <Connection>threadLocal = new ThreadLocal<Connection>();
	static{
		dataSource = new ComboPooledDataSource();
	}
	public DataSource getDatasource(){
		return dataSource;
	}
	public static Connection getConnection(){
		try{
			Connection connection = threadLocal.get();
			if(connection==null){
				connection = dataSource.getConnection();
				connection.setAutoCommit(false);//每次（crud）增删改查都会对应一次事务的开启，为能够更好的为事务过滤器服务!相当于web层是对数据访问层的处理才会开启事务，从而避免事务链接资源无故消耗（）
				threadLocal.set(connection);
			}
			return connection;
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}

	public  static void startTranscation(){
		try{
			Connection connection= getConnection();
			connection.setAutoCommit(false);
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	public static void commitTranscation(){
		try{
			Connection connection = getConnection();
			connection.commit();
		}catch(Exception e){
			throw new RuntimeException(e);
		}
	}
	public static void closebleTranscation(){
		try{
			Connection connection =getConnection();
			connection.close();
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			threadLocal.remove();
		}
	}
	@SuppressWarnings("all")
	public static <T> T retrievalValidateLogonObject(Class<T> clazz ,String[]fieldNames,Object[] params){
		try{
			StringBuilder stringBuilder= new StringBuilder();
			stringBuilder.append("SELECT * FROM "+clazz.getSimpleName()+" WHERE ");
			for(int i = 0 ; fieldNames!=null && params!=null && i<fieldNames.length;i++){
				stringBuilder.append(fieldNames[i]+"="+params[i]+" AND ");
			}
			String sql = stringBuilder.toString();
			sql = sql.trim();
			sql = sql.substring(0,sql.length()-3);
			QueryRunner runner= new QueryRunner();
			T bean = (T)runner.query(JdbcUtils.getConnection(), sql, new BeanHandler(clazz));
			JdbcUtils.commitTranscation();
			return bean;
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			JdbcUtils.closebleTranscation();
		}
	}
	//java 类字段属性
	public static<T> List<String> classFields(Class<T> clazz){
		Field[] fields = clazz.getDeclaredFields();
		List<String> fieldList = new ArrayList<String>();
		for(Field field :fields){
			field.setAccessible(true);
			fieldList.add(field.getName());
		}
		return fieldList;
	}
	//对应java类的表字段属性
	public static <T>List<String> tableField(Class<T> clazz){
		List<String> columnNames = new ArrayList<String>();
		Connection connection=null;
		try{
			connection = dataSource.getConnection();
			DatabaseMetaData metaData = connection.getMetaData();
			// 通过连接获取数据库元数据信息，获取表信息
			ResultSet tableResultSet = metaData.getTables(null, "%", clazz.getSimpleName(), new String[] { "TABLE" });
			while (tableResultSet.next()) {
				ResultSet resultSetColumn= metaData.getColumns(null, "%", clazz.getSimpleName(), "%");
				while(resultSetColumn.next()){
					String columnName = resultSetColumn.getString("COLUMN_NAME");
					columnNames.add(columnName);
					
				}
			}
			return columnNames;
		}catch(Exception e){
			throw new RuntimeException(e);
		}finally{
			if(connection!=null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	//为查询某个类 ，要类字段和表字段相等
	public static <T>List<String> tableFieldEqClassField(Class<T> clazz){
		List<String> realyFields = new ArrayList<String>();
		List<String> tableFields = tableField(clazz);
		List<String> classFields = classFields(clazz);
		if(tableFields!=null && classFields!=null){
			for(int i =0; i<classFields.size();i++){
				for(int j =0; j<tableFields.size();j++){
					if(classFields.get(i).equalsIgnoreCase(tableFields.get(j))){
						realyFields.add(tableFields.get(j));
						break;
					}
				}
			}
		}
		return realyFields;
	}
	//获取类字段的名字和值 ，(前提要和表字段一一对应) 添加给数据库
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public <T> Map<String, Object> tableFieldByMethodOfMap(T bean)
			throws SQLException {
		Map<String, Object> dataEntry = new HashMap<String, Object>();
		List<String> columnNames = new ArrayList<String>();
		Connection connection = null;
		try {
			//获取对象类
			Class clazz = bean.getClass();
			// 通过连接获取数据库元数据信息，获取表信息
			connection = dataSource.getConnection();
			DatabaseMetaData metaData = connection.getMetaData();
			ResultSet tableResultSet = metaData.getTables(null, "%",
					clazz.getSimpleName(), new String[] { "TABLE" });
			while (tableResultSet.next()) {
				ResultSet resultSetColumn = metaData.getColumns(null, "%",
						clazz.getSimpleName(), "%");
				while (resultSetColumn.next()) {
					String columnName = resultSetColumn
							.getString("COLUMN_NAME");
					System.out.println(columnName);
					columnNames.add(columnName);
				}
			}
			// BeanInfo java.beans.Introspector.getBeanInfo(Class<?> beanClass,
			// Class<?> stopClass) 因一个停止描述的一个类就因该是Object类
			BeanInfo beanInfo = Introspector.getBeanInfo(clazz, Object.class);
			PropertyDescriptor[] propertyDescriptors = beanInfo
					.getPropertyDescriptors();
			for (int i = 0; propertyDescriptors != null
					&& i < propertyDescriptors.length; i++) {
				Method getMethod = propertyDescriptors[i].getReadMethod();
				String methodName = getMethod.getName();
				Method classMethod = clazz.getDeclaredMethod(methodName,
						new Class[] {});
				classMethod.setAccessible(true);
				Object value = classMethod.invoke(bean, new Object[] {});
				if (value != null) {
					Pattern pattern = Pattern.compile("get");
					Matcher matcher = pattern.matcher(methodName);
					if (matcher.find()) {//匹配关键字get
						String fieldName = matcher.replaceAll("").trim();//替换为空
						for(int j=0 ;columnNames!=null && j<columnNames.size();j++){
							if(columnNames.get(j).equalsIgnoreCase(fieldName)){//忽略大小写比较名字
								dataEntry.put(fieldName, value);//添加属性名字和值
								System.out.println(fieldName+"="+value);
								break;
							}
						}
					}
				}
			}
			return dataEntry;
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			if (connection != null) {
				connection.close();
			}
		}
	}
}
