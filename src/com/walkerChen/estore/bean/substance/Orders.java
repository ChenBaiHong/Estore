package com.walkerChen.estore.bean.substance;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;


public class Orders implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 6255890376459746154L;
	private String id;
	private Date orderTime;  //下单时间
	private String receiverinfo;//接受信息
	private String state;   //订单状态
	private double money;    //订单总价
	private User user;    //订单用户
	private Set <OrderItem>orderItems = new HashSet<OrderItem>();   //记住订单所有的订单项
	
	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Orders(String id, Date orderTime, String receiverinfo, String state,
			double money, User user, Set<OrderItem> orderItems) {
		super();
		this.id = id;
		this.orderTime = orderTime;
		this.receiverinfo = receiverinfo;
		this.state = state;
		this.money = money;
		this.user = user;
		this.orderItems = orderItems;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrderTime() {
		return orderTime;
	}
	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}
	public String getReceiverinfo() {
		return receiverinfo;
	}
	public void setReceiverinfo(String receiverinfo) {
		this.receiverinfo = receiverinfo;
	}
	
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	@Override
	public String toString() {
		return "Orders [id=" + id + ", orderTime=" + orderTime
				+ ", receiverinfo=" + receiverinfo + ", state=" + state
				+ ", money=" + money + ", user=" + user + ", orderItems="
				+ orderItems + "]";
	}
	
}
