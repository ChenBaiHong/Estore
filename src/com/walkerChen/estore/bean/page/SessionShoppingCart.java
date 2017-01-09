package com.walkerChen.estore.bean.page;

import java.util.LinkedList;
import java.util.List;

import com.walkerChen.estore.bean.substance.Product;

/**
 * 关于这个产品的所有订单项
 * @author cbh12
 *
 */
public class SessionShoppingCart {
	private Product product; 
	private List<ShoppingItem> shoppingItemList = new LinkedList<ShoppingItem>();
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public List<ShoppingItem> getShoppingItemList() {
		return shoppingItemList;
	}
	public void setShoppingItemList(List<ShoppingItem> shoppingItemList) {
		this.shoppingItemList = shoppingItemList;
	}
	
}
