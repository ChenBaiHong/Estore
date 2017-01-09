package com.walkerChen.estore.commonUtils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtils {
	private static Configuration configuration;
	private static SessionFactory sessionFactory;
	
	static{
		configuration = new Configuration().configure();
		sessionFactory = configuration.buildSessionFactory();
	}
	
	
	public static Session openSession (){
		return sessionFactory.openSession();
	}
	/**
	 * ThreadLocal<Conection>
	 * 单线程处理
	 * @return
	 */
	public static Session getCurrentSession(){
		return sessionFactory.getCurrentSession();
	}

	public static void main(String[] args){
		openSession();
	}
}
