package com.walkerChen.estore.myDbutils.myHandlers;

import java.lang.reflect.Field;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.Vector;

public class HandleVector  implements HandleResultSet{

	@SuppressWarnings("rawtypes")
	private Class clazz;
	@SuppressWarnings("rawtypes")
	public HandleVector(Class clazz){
		this.clazz=clazz;
	}

	@Override
	public Vector<Object> handle(ResultSet resultSet) {
		Vector<Object> vector = new Vector<Object>();
		try {
			ResultSetMetaData metaData = resultSet.getMetaData();
			Vector<Object> column = new Vector<Object>();
			while (resultSet.next() && metaData.getColumnCount() > 0) {
				Object bean = clazz.newInstance();
				for (int i = 0; i < metaData.getColumnCount(); i++) {
					String name = metaData.getColumnName(i + 1);
					Object value = resultSet.getObject(name);
					Field field = bean.getClass().getDeclaredField(name);
					field.setAccessible(true);
					field.set(bean, value);
				}
				column.add(bean);
			}
			vector.add(column);
			return vector;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

}
