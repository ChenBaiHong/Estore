package com.walkerChen.estore.bean.substance;

import java.io.Serializable;

/**
 * 订单项  与之相关联的就是 与用户打交道的购物项
 *
 *  订单项只是一个记录型的一个类， 相当于等待购物项给订单项赋值
 *  			记录买的数量
 *  			记录产品的价格
 *  			记录买的那个产品
 *  			记录买的产品的颜色
 *  			记录买的产品的大小
 *
 * @author  ChenBaiHong
 */
public class OrderItem implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3719271518967700812L;
	private String id;
	private int buyQuantity;
	private double subtotal;//小计 产品价钱
	private Product product;
	private String color;
	private String size;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getBuyQuantity() {
		return buyQuantity;
	}
	public void setBuyQuantity(int buyQuantity) {
		this.buyQuantity = buyQuantity;
	}
	public double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public OrderItem(String id, int buyQuantity, double price, Product product) {
		super();
		this.id = id;
		this.buyQuantity = buyQuantity;
		this.subtotal = price;
		this.product = product;
	
	}
	public OrderItem() {
		super();
	}
	@Override
	public String toString() {
		return "OrderItem [id=" + id + ", buyQuantity=" + buyQuantity
				+ ", price=" + subtotal + ", product=" + product + "]";
	}
	
}
