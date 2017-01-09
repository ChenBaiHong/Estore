package com.walkerChen.estore.bean.page;


import java.io.Serializable;
import java.math.BigDecimal;

import com.walkerChen.estore.bean.substance.Product;

public class ShoppingItem implements Serializable{
	
	private static final long serialVersionUID = 5194516112114246782L;

	//提交给数据库的数据
	private Product product;
	private Double subtotal; 
	private Integer buyQuantity;
	private String color;
	private String size;
	
	//辅助前台要合理出现的数据需要的属性 ， 并可以对比是否是相同购物项
	private String colorCId;
	private String sizeCId;
	private String productId;
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	public Double getSubtotal() {
		return subtotal;
	}
	
	public Integer getBuyQuantity() {
		return buyQuantity;
	}
	//一个订单项,所买的数量就算出价格
	public void setBuyQuantity(Integer buyQuantity) {
		BigDecimal bigDecimal = new BigDecimal(product.getSalePrice()*buyQuantity);
		bigDecimal = bigDecimal.setScale(3, BigDecimal.ROUND_HALF_UP);//小数点后三位向上取整
		this.subtotal=Double.parseDouble(bigDecimal.toString());
		this.buyQuantity = buyQuantity;
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
	
	public ShoppingItem() {
		super();
	}
	//辅助前台出现的数据
	public String getSizeCId() {
		return sizeCId;
	}
	public void setSizeCId(String sizeCId) {
		this.sizeCId = sizeCId;
	}
	public String getColorCId() {
		return colorCId;
	}
	public void setColorCId(String colorCId) {
		this.colorCId = colorCId;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public ShoppingItem(String productId,String colorCId, String sizeCId) {
		super();
		this.productId = productId;
		this.colorCId = colorCId;
		this.sizeCId = sizeCId;
	}
	//重写该购物项的 hashCode  和 equals 方法 比较是否相同，相同就更新要给前台的数据
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((colorCId == null) ? 0 : colorCId.hashCode());
		result = prime * result
				+ ((productId == null) ? 0 : productId.hashCode());
		result = prime * result + ((sizeCId == null) ? 0 : sizeCId.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ShoppingItem other = (ShoppingItem) obj;
		if (colorCId == null) {
			if (other.colorCId != null)
				return false;
		} else if (!colorCId.equals(other.colorCId))
			return false;
		if (productId == null) {
			if (other.productId != null)
				return false;
		} else if (!productId.equals(other.productId))
			return false;
		if (sizeCId == null) {
			if (other.sizeCId != null)
				return false;
		} else if (!sizeCId.equals(other.sizeCId))
			return false;
		return true;
	}	
}
