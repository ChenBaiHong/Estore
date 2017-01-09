package com.walkerChen.estore.bean.substance;

import java.io.Serializable;

/**
 * 产品种类
 */
@SuppressWarnings("all")
public class Brand implements Serializable {
	private String id;
	private String name;
	private String description;
	private String brandImg;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getBrandImg() {
		return brandImg;
	}
	public void setBrandImg(String brandImg) {
		this.brandImg = brandImg;
	}
	@Override
	public String toString() {
		return "Brand [id=" + id + ", name=" + name + ", description="
				+ description + ", brandImg=" + brandImg + "]";
	}
	public Brand(String id, String name, String description,
			String brandImg) {
		super();
		this.id = id;
		this.name = name;
		this.description = description;
		this.brandImg = brandImg;
	}
	public Brand() {
		super();
	}
}
