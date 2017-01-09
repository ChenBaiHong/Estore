package com.walkerChen.estore.businessFactory;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DaoFactory {
		private  static Properties daoConfiguration = new Properties();
		private  static DaoFactory instance = new DaoFactory();
		private  DaoFactory(){
			InputStream inStream =DaoFactory.class.getClassLoader().getResourceAsStream("daoConfiguration.properties");
			try {
				daoConfiguration.load(inStream);
			} catch (IOException e) {
				throw new ExceptionInInitializerError(e);
			}
		}
		public static DaoFactory newInstance(){
			return instance;
		}
	/**
	 * 创建数据访问工厂通过接口
	 * @param classBean
	 * @return
	 */
	@SuppressWarnings("all")
		public <T>T createDataAccessibleFactoryByInterface(Class<T> classBean){
			String interfaceName = classBean.getSimpleName();
			String completeSubclassName = daoConfiguration.getProperty(interfaceName);
			try {
				T bean = (T) Class.forName(completeSubclassName).newInstance();
				return bean;
			} catch (InstantiationException | IllegalAccessException
					| ClassNotFoundException e) {
			throw new RuntimeException(e);
			}
		}
}
