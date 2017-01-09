package com.walkerChen.estore.dao.impl;

import com.walkerChen.estore.bean.substance.OrderItem;
import com.walkerChen.estore.bean.substance.Orders;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.dao.OrdersDao;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.Connection;
import java.util.Iterator;
import java.util.List;
import java.util.Set;



/**
 * create table Orders( id varChar(40) primary key, orderTime datetime not null,
 * receiverinfo varChar(250), state boolean not null, money decimal(8,2) not
 * null, user_id varChar(40), foreign key(user_id) references user(id)
 *
 * );
 *
 * private String id; private Date orderTime; //下单时间 private String
 * receiverinfo;//接受信息 private boolean state; //订单状态 private double money;
 * //订单总价 private User user; //记住下单人 private Set <OrderItem>orderItems = new
 * HashSet<OrderItem>(); //记住订单所有的订单项
 *
 * @author ChenBaiHong
 *
 *         create table OrderItem( id varChar(id) primary key, buyQuantity int
 *         not null, price decimal(8,2) not null, product_id varChar(40),
 *         foreign key(product_id) references product(id), orders_id
 *         varChar(40), foreign key(orders_id) references orders(id) ); private
 *         String id; private String buyQuantity; private String price; private
 *         Product product;
 */
public class OrdersDaoImpl implements OrdersDao {
	@Override
	public void addOrders(Orders orders) {
		try {
			QueryRunner runner = new QueryRunner();
			String sql = "INSERT INTO ORDERS(ID,ORDERTIME,RECEIVERINFO,STATE,MONEY,USER_ID)VALUES(?,?,?,?,?,?)";
			Object[] parmas = { orders.getId(), orders.getOrderTime(),
					orders.getReceiverinfo(), orders.getState(),
					orders.getMoney(), orders.getUser().getId() };
			runner.update(JdbcUtils.getConnection(), sql, parmas);
			Set<OrderItem> orderItems = orders.getOrderItems();
			Iterator<OrderItem> iterator = orderItems.iterator();
			while (iterator.hasNext()) {
				OrderItem orderItem = iterator.next();
				sql = "INSERT INTO ORDERITEM(ID,BUYQUANTITY,PRICE,PRODUCT_ID,ORDERS_ID)VALUES(?,?,?,?,?)";
				parmas = new Object[] { orderItem.getId(),
						orderItem.getBuyQuantity(), orderItem.getSubtotal(),
						orderItem.getProduct().getId(), orders.getId() };
				runner.update(JdbcUtils.getConnection(), sql, parmas);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	@SuppressWarnings("all")
	public Orders findOrders(String id) {
		try {
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT * FROM ORDERS WHERE ID=?";
			Orders orders = (Orders) runner.query(JdbcUtils.getConnection(),
					sql, id, new BeanHandler(Orders.class));

			sql = "SELECT * FROM ORDERITEM WHERE ORDERS_ID=?";
			List<OrderItem> orderItems = (List<OrderItem>) runner.query(
					JdbcUtils.getConnection(), sql, orders.getId(),
					new BeanListHandler(OrderItem.class));
			for (OrderItem orderItem : orderItems) {
				sql = "SELECT p.* FROM ORDERITEM oi , PRODUCT p WHERE oi.PRODUCT_ID=p.id AND oi.ID=?";
				Product product = (Product) runner.query(
						JdbcUtils.getConnection(), sql, orderItem.getId(),
						new BeanHandler(Product.class));
				orderItem.setProduct(product);
			}
			orders.getOrderItems().addAll(orderItems);
			// 没有用户怎么查询用户
			sql = "SELECT u.* FROM ORDERS o , USER u WHERE o.USER_ID=u.ID AND o.ID=?";
			User user = (User) runner.query(JdbcUtils.getConnection(), sql,
					orders.getId(), new BeanHandler(User.class));
			orders.setUser(user);
			return orders;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	/*
         * state:true:已发货 state:false;未发货
         */
	@Override
	@SuppressWarnings("all")
	public List<Orders> findStateOrders(String state) {
		try {
			QueryRunner runner = new QueryRunner();
			String sql = "SELECT * FROM ORDERS WHERE STATE=?";
			List<Orders> collectionOrders = (List<Orders>) runner.query(
					JdbcUtils.getConnection(), sql, state, new BeanListHandler(
							Orders.class));
			for (Orders orders : collectionOrders) {
				sql = "SELECT * FROM ORDERITEM WHERE ORDERS_ID=?";
				List<OrderItem> orderItems = (List<OrderItem>) runner.query(
						JdbcUtils.getConnection(), sql, orders.getId(),
						new BeanListHandler(OrderItem.class));
				for (OrderItem orderItem : orderItems) {
					sql = "SELECT p.* FROM ORDERITEM oi , PRODUCT p WHERE oi.PRODUCT_ID=p.id AND oi.ID=?";
					Product product = (Product) runner.query(
							JdbcUtils.getConnection(), sql, orderItem.getId(),
							new BeanHandler(Product.class));
					orderItem.setProduct(product);
				}
				orders.getOrderItems().addAll(orderItems);
				// 没有用户怎么查询用户
				sql = "SELECT u.* FROM ORDERS o , USER u WHERE o.USER_ID=u.ID AND o.ID=?";
				User user = (User) runner.query(JdbcUtils.getConnection(), sql,
						orders.getId(), new BeanHandler(User.class));
				orders.setUser(user);
			}
			return collectionOrders;
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void updateOrderState(String id, String state) {
		try {
			// 查询出订单
			Connection connection = JdbcUtils.getConnection();
			QueryRunner queryRunner = new QueryRunner();
			String sql = "UPDATE ORDERS SET STATE=?  WHERE ID=?";
			Object[] params = { state, id };
			queryRunner.update(connection, sql, params);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
