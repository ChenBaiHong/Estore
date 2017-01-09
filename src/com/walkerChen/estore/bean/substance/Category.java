package com.walkerChen.estore.bean.substance;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Category implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1582258190023710424L;
	private String cid;
	private String name;
	private String profile;
	private String profileImg;
	private int layer;//阶层默认是1
	private Set<Category> subCategorys = new HashSet<Category>();
	private Set<Product> productSet = new HashSet<Product>();//分类和产品是多对多的关系
	
	/**  开始辅助字段  */
	private String parentId;//不和数据库打交道，分类添加节点树默认是从父类下添加当前子类
	/**  结束辅助类  */

	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getLayer() {
		return layer;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public void setLayer(int layer) {
		this.layer = layer;
	}

	public Set<Category> getSubCategorys() {
		return subCategorys;
	}

	public void setSubCategorys(Set<Category> subCategorys) {
		this.subCategorys = subCategorys;
	}

	public Set<Product> getProductSet() {
		return productSet;
	}

	public void setProductSet(Set<Product> productSet) {
		this.productSet = productSet;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Category(String name, int layer) {
		super();
		this.name = name;
		this.layer = layer;
	}

	public Category() {
		super();
	}
	
	/**
	 * 重写Id做hasCode 分类比较是否相等
	 */
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cid == null) ? 0 : cid.hashCode());
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
		Category other = (Category) obj;
		if (cid == null) {
			if (other.cid != null)
				return false;
		} else if (!cid.equals(other.cid))
			return false;
		return true;
	}
	@Override
	public String toString() {
		return "Category [cid=" + cid + ", name=" + name + ", profile="
				+ profile + ", layer=" + layer + ", subCategorys="
				+ subCategorys + ", productSet=" + productSet + ", parentId="
				+ parentId + "]";
	}
}
