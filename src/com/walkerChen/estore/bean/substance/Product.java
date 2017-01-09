package com.walkerChen.estore.bean.substance;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

@SuppressWarnings("all")
public class Product implements Serializable{
	private String id; //产品编号
	private String name;//产品名字
	private Double salePrice;//零售价格
	private Double inletPrice;//进口价格
	private String inletDate;//进口日期
	private String putawayDate;//上架日期
	private String produceLocal;//产品出产地
	private String productCompany;//产品公司
	private String iconurl;//产品图片保存路径
	private String paramIconurl;//产品参数图片保存路径
	private Integer quantity;//产品数量
	private Integer totalSaleNum;//产品销售数量
	private String description;//产品描述
	private Brand brand;//产品品牌和产品是多对一的关系
	private Set<Category> categorySet = new HashSet<Category>();//分类和产品是多对多的关系
	/** 开始辅助参数给前台界面 */
	//遍历产品图片
	private List<String> imgUrlList = new ArrayList<String>();//图片的名字
	//遍历产品参数图片
	private List<String> imgParamList = new ArrayList<String>();//参数图片的名字
	//更新图片或添加图片的辅助map集合
	private Map<String , String> mappingImgUrl = new HashMap<String , String>();//图片名字，和绝对访问地址图片地址
	
	private String brandId;
	
	private String categoryId;
	//前台显示第一张图片
	private String firstImgUrl;
	/** 结束辅助参数给前台界面 */
	

	public Product(String name, Integer quantity) {
		super();
		this.name = name;
		this.quantity = quantity;
	}
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
	public Double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}
	public Double getInletPrice() {
		return inletPrice;
	}
	public void setInletPrice(Double inletPrice) {
		this.inletPrice = inletPrice;
	}
	public String getInletDate() {
		return inletDate;
	}
	public void setInletDate(String inletDate) {
		this.inletDate = inletDate;
	}
	public String getPutawayDate() {
		return putawayDate;
	}
	public void setPutawayDate(String putawayDate) {
		this.putawayDate = putawayDate;
	}
	public String getProduceLocal() {
		return produceLocal;
	}
	public void setProduceLocal(String produceLocal) {
		this.produceLocal = produceLocal;
	}
	public String getProductCompany() {
		return productCompany;
	}
	public void setProductCompany(String productCompany) {
		this.productCompany = productCompany;
	}
	public String getIconurl() {
		return iconurl;
	}
	public void setIconurl(String iconurl) {
		this.iconurl = iconurl;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Integer getTotalSaleNum() {
		return totalSaleNum;
	}
	public void setTotalSaleNum(Integer totalSaleNum) {
		this.totalSaleNum = totalSaleNum;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Set<Category> getCategorySet() {
		return categorySet;
	}
	public void setCategorySet(Set<Category> categorySet) {
		this.categorySet = categorySet;
	}
	public List<String> getImgUrlList() {
		return imgUrlList;
	}
	public void setImgUrlList(List<String> imgUrlList) {
		this.imgUrlList = imgUrlList;
	}
	public Map<String, String> getMappingImgUrl() {
		return mappingImgUrl;
	}
	public void setMappingImgUrl(Map<String, String> mappingImgUrl) {
		this.mappingImgUrl = mappingImgUrl;
	}
	public String getBrandId() {
		return brandId;
	}
	public void setBrandId(String brandId) {
		this.brandId = brandId;
	}
	public String getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getFirstImgUrl() {
		return firstImgUrl;
	}
	public void setFirstImgUrl(String firstImgUrl) {
		this.firstImgUrl = firstImgUrl;
	}
	
	public String getParamIconurl() {
		return paramIconurl;
	}
	public void setParamIconurl(String paramIconurl) {
		this.paramIconurl = paramIconurl;
	}
	public List<String> getImgParamList() {
		return imgParamList;
	}
	public void setImgParamList(List<String> imgParamList) {
		this.imgParamList = imgParamList;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", salePrice="
				+ salePrice + ", inletPrice=" + inletPrice + ", inletDate="
				+ inletDate + ", putawayDate=" + putawayDate
				+ ", produceLocal=" + produceLocal + ", productCompany="
				+ productCompany + ", iconurl=" + iconurl + ", quantity="
				+ quantity + ", totalSaleNum=" + totalSaleNum
				+ ", description=" + description + ", brand=" + brand
				+ ", categorySet=" + categorySet + ", imgUrlList=" + imgUrlList
				+ ", mappingImgUrl=" + mappingImgUrl + ", brandId=" + brandId
				+ ", categoryId=" + categoryId + ", firstImgUrl=" + firstImgUrl
				+ "]";
	}
	
}
