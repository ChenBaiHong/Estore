package com.walkerChen.estore.bean.page;

import java.util.List;

import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.commonUtils.JdbcUtils;

/**
 * 查询分页
 */
public class QueryPaging {
	private int currentPage=1;
	private int pageSize=12;//当前页面的大小
	private int startIndex;//开始查询下标，默认是0
	private String[] conditionVariable;
	private String sortCondition;//排序条件
	private String brandType;//分类类型
	private String whereAssociate;//数据库查询的条件和查询参数的联系条件 where brand_id=?
	
	private String obscureSearch;//模糊搜索数据
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	//数据库的查询的开始下表是用户根据当前网页的查询的结果
	public int getStartIndex() {
		startIndex=(this.currentPage-1)*this.pageSize;
		return startIndex;
	}
	
	public String getSortCondition() {
		return sortCondition;
	}
	public void setSortCondition(String sortCondition) {
		this.sortCondition = sortCondition;
	}
	public String getBrandType() {
		return brandType;
	}
	public void setBrandType(String brandType) {
		this.brandType = brandType;
	}
	public void setWhereAssociate(String whereAssociate) {
		this.whereAssociate = whereAssociate;
	}
	//设置检索数据，开始where关联查询
	public void setObscureSearch(String obscureSearch) {
		this.obscureSearch = obscureSearch;
	}
	public String getObscureSearch() {
		return obscureSearch;
	}
	
	public String[] getConditionVariable() {
		return conditionVariable;
	}
	public String getWhereAssociate() {
		if(sortCondition!=null && brandType!=null 
				&& !sortCondition.trim().equals("") && !brandType.trim().equals("")){
			return this.whereAssociate = "where brand_id=\""+brandType+"\" order by "+sortCondition;
		}
		if(sortCondition!=null && obscureSearch!=null 
				&& !sortCondition.trim().equals("") && !obscureSearch.trim().equals("")){
			List<String> fieldNames = JdbcUtils.tableField(Product.class);
			StringBuilder sBuilder = new StringBuilder(" where ");
			for(String fieldName : fieldNames){
				sBuilder.append(fieldName+" like \"%"+obscureSearch+"%\" or ");
			}
			sBuilder.trimToSize();
			whereAssociate = sBuilder.substring(0, sBuilder.lastIndexOf("or"));
			return this.whereAssociate = whereAssociate+" order by "+sortCondition+" ";
		}
		if(obscureSearch!=null && !obscureSearch.trim().equals("")){
			List<String> fieldNames = JdbcUtils.tableField(Product.class);
			StringBuilder sBuilder = new StringBuilder(" where ");
			for(String fieldName : fieldNames){
				sBuilder.append(fieldName+" like \"%"+obscureSearch+"%\" or ");
			}
			sBuilder.trimToSize();
			this.whereAssociate = sBuilder.substring(0, sBuilder.lastIndexOf("or"));
			return this.whereAssociate+" ";
		}
		if(sortCondition!=null && !sortCondition.trim().equals("")){
			return this.whereAssociate =" order by "+sortCondition;
		}
		if(brandType!=null && !brandType.trim().equals("")){
			return this.whereAssociate =" where brand_id=\""+brandType+"\"";
		}
		return this.whereAssociate;
	}
}
