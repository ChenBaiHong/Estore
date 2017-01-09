package com.walkerChen.estore.dao.implHbm;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.hibernate.query.Query;
import org.junit.Test;

import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.commonUtils.HibernateUtils;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.dao.UserDao;
@SuppressWarnings("all")
public class UserDaoImpl implements UserDao{

	@Override
	public void addUser(User user) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.save(user);
		transaction.commit();
		session.close();
	}

	@Override
	public User findUser(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		User user = session.get(User.class,id);
		transaction.commit();
		session.close();
		return user;
	}
	@Override
	public void UpdateUser(User user){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.update(user);
		transaction.commit();
		session.close();
	}
	@Override
	public User findUserByActivecode(String activecode){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		User user = (User) session.createQuery("from User where activecode=?").setParameter(0, activecode).uniqueResult();
		transaction.commit();
		session.close();
		return user;
	}
	//这个是对象查询 ？ 对应的开始下标是从零开始
	@Override
	public User findUser(String identity, String password) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Query query= session.createQuery("from User where (username=? or cellphone=? or email=?) and password=?")
				.setParameter(0, identity)
				.setParameter(1, identity)
				.setParameter(2, identity)
				.setParameter(3, password);
		User user= (User) query.uniqueResult();
		transaction.commit();
		session.close();
		return user;
	}
	//这个是sql查询 ？ 对应的开始下标是从1开始
	@Override
	public boolean isExistSimilarUsername(String username){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		User user =(User) session.createNativeQuery("select * from User where  username=?").setParameter(1, username).addEntity(User.class).uniqueResult();
		transaction.commit();
		session.close();
		if(user==null){
			return false;
		}else{
			return true;
		}
		
	}
	//这个是sql查询 ？ 对应的开始下标是从1开始
	@Override
	public boolean isExistSimilarEmail(String email){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		User user =(User) session.createNativeQuery("select * from User where  email=?").setParameter(1, email).addEntity(User.class).uniqueResult();
		transaction.commit();
		session.close();
		if(user==null){
			return false;
		}else{
			return true;
		}
		
	}
	//这个是sql查询 ？ 对应的开始下标是从1开始
	@Override
	public boolean isExistSimilaCellphone(String cellphone){
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		User user =(User) session.createNativeQuery("select * from User where  cellphone=?").setParameter(1, cellphone).addEntity(User.class).uniqueResult();
		transaction.commit();
		session.close();
		if(user==null){
			return false;
		}else{
			return true;
		}
		
	}
	@Override
	public List<User> findAllUser(String state) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<User>  UserList= (List<User>) session.createQuery("from User where state=?").setParameter(0, state).list();
		transaction.commit();
		session.close();
		return UserList;
	}

	@Override
	public List<User> searchLikeUser(Object conditionParam) {
		List<User> userList;
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction= session.beginTransaction();
		List<String> fieldNames = JdbcUtils.classFields(User.class);
		StringBuilder sBuilder = new StringBuilder("select * from user where ");
		for(String fieldName : fieldNames){
			sBuilder.append(fieldName+" like \"%"+conditionParam+"%\" or ");
		}
		sBuilder.trimToSize();
		String sql = sBuilder.substring(0, sBuilder.lastIndexOf("or"));
		userList = session.createSQLQuery(sql).addEntity(User.class).list();
		transaction.commit();
		session.close();
		return userList;
	}
	@Test
	public void test(){
	
		System.out.println(findUser("dea", "deadsf"));
	}
}
