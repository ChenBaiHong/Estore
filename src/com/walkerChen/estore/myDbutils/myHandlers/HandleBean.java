package com.walkerChen.estore.myDbutils.myHandlers;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
@SuppressWarnings("all")
public class HandleBean implements HandleResultSet{
	private Class clazz;
	public HandleBean(Class clazz){
		this.clazz=clazz;
	}
	@Override
	public Object handle(ResultSet resultSet) {
		try {
			if (!resultSet.next()) {
				return null;
			}
			ResultSetMetaData metaData = resultSet.getMetaData();
			Object bean = clazz.newInstance();
			for (int i = 0; i < metaData.getColumnCount(); i++) {
				String name = metaData.getColumnName(i + 1);
				Object value = resultSet.getObject(name);
				Field field = bean.getClass().getDeclaredField(name);
				field.setAccessible(true);
				field.set(bean, value);
			}
			return bean;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
