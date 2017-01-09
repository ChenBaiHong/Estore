package com.walkerChen.estore.bean.page;

import java.util.ArrayList;
import java.util.List;

import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;

/**
 * 关于这个购物项需要的产品 ， 类型颜色 ， 类型大小
 * @author cbh12
 *
 */
public class ShoppingItemParam {
	private Product product ; 
	private List<Category> colorList = new ArrayList<Category>();
	private List<Category> sizeList = new ArrayList<Category>();
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public List<Category> getColorList() {
		return colorList;
	}
	public void setColorList(List<Category> colorList) {
		this.colorList = colorList;
	}
	public List<Category> getSizeList() {
		return sizeList;
	}
	public void setSizeList(List<Category> sizeList) {
		this.sizeList = sizeList;
	}
	
}
