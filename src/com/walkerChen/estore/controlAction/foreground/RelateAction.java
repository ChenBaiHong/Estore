package com.walkerChen.estore.controlAction.foreground;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessService.BusinessService;
@SuppressWarnings("all")
public class RelateAction extends ActionSupport implements ModelDriven<Product>{
	Product product = new Product();
	BusinessService businessService;
	@Override
	public Product getModel() {
		return product;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	//导航头一级展现某分类下的产品
	public String showCategoryRelateProduct (){
		try{
			String categoryId = product.getCategoryId();
			if(categoryId!=null && categoryId.trim().length()!=0){
			QueryPaging queryInfo  = new QueryPaging();
			queryInfo.setPageSize(25);
			List<Product> productList = businessService.findPagingProductByCategory(queryInfo, categoryId);
			ServletActionContext.getRequest().setAttribute("productList", productList);
			//该分类具备的图片参数 ， 也是预期的过滤产品参数之一
			ServletActionContext.getRequest().setAttribute("categoryId", categoryId);
			//该分类关联的细分的子分类列表
			List<Category> subdivisCatevoryList= new ArrayList<Category>();
			subdivisCatevoryList.addAll(businessService.findCategory(categoryId).getSubCategorys());
			ServletActionContext.getRequest().setAttribute("subdivisCatevoryList", subdivisCatevoryList);
			//页面需要的参数
			publicPageMethod();
			}
		}catch(Exception e){
			publicPageMethod();
			return "error";
		}
		
		return this.SUCCESS;
	}
	//主页一级展现该分类下销售最好的产品
	public String saleProminenceProduct(){
		try{
			String categoryId = product.getCategoryId();
			if(categoryId!=null && categoryId.trim().length()!=0){
			QueryPaging queryInfo  = new QueryPaging();
			queryInfo.setPageSize(25);
			queryInfo.setSortCondition("totalSaleNum desc");//升序查找
			List<Product> productList = businessService.findPagingProductByCategory(queryInfo, categoryId);
			ServletActionContext.getRequest().setAttribute("productList", productList);
			//该分类具备的图片参数
			ServletActionContext.getRequest().setAttribute("categoryId", categoryId);
			//该分类关联的细分的子分类列表
			List<Category> modelCategorylist= new ArrayList<Category>();
			modelCategorylist.addAll(businessService.findCategory(categoryId).getSubCategorys());
			ServletActionContext.getRequest().setAttribute("subdivisCatevoryList", modelCategorylist);
			//页面需要的参数
			publicPageMethod();
			}
		}catch(Exception e){
			publicPageMethod();
			return "error";
		}
		
		return this.SUCCESS;
	}
	//页面常带参数的公用方法体
	public void  publicPageMethod(){
		IndexAction indexAction = new IndexAction();
		//新的导航头
		ServletActionContext.getRequest().setAttribute("navigateCategorys", indexAction.navigateHeadCategory());
		//颜色分类
		Set<Category> colorCatevoryList=indexAction.rootSubcategory().get(3).getSubCategorys();
		ServletActionContext.getRequest().setAttribute("colorCatevoryList", colorCatevoryList);
		//产品型号分类
		Set<Category> modelCategoryList=indexAction.rootSubcategory().get(4).getSubCategorys();
		ServletActionContext.getRequest().setAttribute("modelCategoryList", modelCategoryList);
	}
}
