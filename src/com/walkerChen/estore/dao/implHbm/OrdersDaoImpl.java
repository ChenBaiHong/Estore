package com.walkerChen.estore.dao.implHbm;

import java.sql.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;

import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.bean.substance.OrderItem;
import com.walkerChen.estore.bean.substance.Orders;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.commonUtils.HibernateUtils;
import com.walkerChen.estore.dao.OrdersDao;
@SuppressWarnings("all")
public class OrdersDaoImpl implements OrdersDao{

	@Override
	public void addOrders(Orders orders) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		session.save(orders);
		transaction.commit();
		session.close();
	}

	@Override
	public Orders findOrders(String id) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Orders orders= session.get(Orders.class, id);
		transaction.commit();
		session.close();
		return orders;
	}

	@Override
	public List<Orders> findStateOrders(String state) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<Orders> ordersList = (List<Orders>) session.createCriteria(Orders.class).add(Restrictions.eq("state", state)).list();
		transaction.commit();
		session.close();
		return ordersList;
	}

	@Override
	public void updateOrderState(String id, String state) {
		Session session = HibernateUtils.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		Orders orders= session.get(Orders.class, id);
		orders.setState(state);
		session.update(orders);
		transaction.commit();
		session.close();
	}
	@Test
	public void test(){
		
	}
}
