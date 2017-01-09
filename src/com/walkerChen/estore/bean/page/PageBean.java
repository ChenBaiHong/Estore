package com.walkerChen.estore.bean.page;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;

import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;



public class PageBean {
	private List<Product> listProduct;
	private int totalRecode;
	private int pageSize;
	private int totalPage;
	private  int currentpage ;
	private Integer[] pagination;
	public List<Product> getListProduct() {
		return listProduct;
	}
	public void setListProduct(List<Product> listProduct) {
		this.listProduct = listProduct;
	}
	public int getTotalRecode() {
		return totalRecode;
	}
	public void setTotalRecode(int totalRecode) {
		this.totalRecode = totalRecode;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	//总共几页数据是根据数据库查询的总记录除以用户给定的每页多少条记录
	public int getTotalPage() {
		if(this.totalRecode%this.pageSize!=0){
			return this.totalPage=this.totalRecode/this.pageSize+1;
		}else{
			return this.totalPage=this.totalRecode/this.pageSize;
		}
		
	}

	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public void setPagination(Integer[] pagination) {
		this.pagination = pagination;
	}
	public Integer[] getPagination() {
		int startPage;
		int endPage;
		if(this.totalPage<10){
			startPage=1;
			endPage=this.totalPage;
		}else{
			startPage=this.currentpage-4;
			endPage=this.currentpage+5;
			if(startPage<1){
				startPage=1;
				endPage=10;
			}if(endPage>this.totalPage){
				endPage=this.totalPage;
				startPage=this.totalPage-9;
			}
		}
		System.out.println(startPage+","+endPage);
		this.pagination = new Integer[endPage-startPage+1]; //防止出现空指针异常，10-1+1
		int index=0;
		for(;startPage<=endPage;startPage++){
			this.pagination[index++]=startPage;
		}
		return this.pagination;
	}
	@Override
	public String toString() {
		return "PageBean [listProduct=" + listProduct + ", totalRecode="
				+ totalRecode + ", pageSize=" + pageSize + ", totalPage="
				+ totalPage + ", currentpage=" + currentpage + ", pagination="
				+ Arrays.toString(pagination) + "]";
	}
	@Test
	public void test(){
		BusinessService businessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
		PageBean pageBean = businessService.findPagingProduct(new QueryPaging());
		//System.out.println(pageBean.getPagination()[0]);
		pageBean.setTotalPage(pageBean.getTotalPage());
		pageBean.setPagination(pageBean.getPagination());
		System.out.println(pageBean);
	}
	
}
