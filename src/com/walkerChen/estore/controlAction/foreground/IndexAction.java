package com.walkerChen.estore.controlAction.foreground;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.AdminPageBean;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.PageInfoOfAdmin;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageBeanOfBrand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageInfoOfBrand;
@SuppressWarnings("all")
public class IndexAction extends ActionSupport{
	private BusinessService businessService;
	private String productId;
	private String jsonData;
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getJsonData() {
		return jsonData;
	}

	public String  indexVisited(){
		List<Category> categoryList = businessService.findCategoryByLayer(0);//根节点分类数据
		Category rootCategory = categoryList.get(0);
		List<Category> rootSubcategory = new ArrayList();
		rootSubcategory.addAll(rootCategory.getSubCategorys());
		
		//根据前台页面布局显示分类产品的信息
		if(rootSubcategory.size()>=2){
			Collections.sort(rootSubcategory, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			//1 导航分类项
			Category navigateCategory =rootSubcategory.get(0);
			List<Category> sortCategory1 = new ArrayList<Category>();
			sortCategory1.addAll(navigateCategory.getSubCategorys());
			Collections.sort(sortCategory1, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			ServletActionContext.getRequest().setAttribute("navigateCategorys", sortCategory1);
			
			//2 新品产品系列项 , 排序的顺序必须是一直的，这样好按序查找产品
			Category seriesCategory = rootSubcategory.get(1);
			List<Category> sortCategory2 = new ArrayList<Category>();
			sortCategory2.addAll(seriesCategory.getSubCategorys());
			Collections.sort(sortCategory2, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			ServletActionContext.getRequest().setAttribute("seriesCategorys", sortCategory2);
			//2.1  包装所有不同分类产品到统一的集合中去
			List unifyProductList = new ArrayList();
			QueryPaging queryPaging = new QueryPaging();
			queryPaging.setPageSize(8);
			for(int i = 0 ; i<sortCategory2.size();i++){
				unifyProductList.add(businessService.findPagingProductByCategory(queryPaging, sortCategory2.get(i).getCid()));//查找某分类下的产品
			}
			ServletActionContext.getRequest().setAttribute("unifyProductList", unifyProductList);
			
			// 3. 首页加载时显示促销榜销售最好的分类产品,销售突出的产品
			Category prominenceSaleCategorys = rootSubcategory.get(1);
			List<Category> sortCategory3 = new ArrayList<Category>();
			sortCategory3.addAll(prominenceSaleCategorys.getSubCategorys());
			Collections.sort(sortCategory3, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			ServletActionContext.getRequest().setAttribute("prominenceSaleCategorys", sortCategory3);
		}
		//2 品牌系列
		PageInfoOfBrand pageInfo = new PageInfoOfBrand();
		pageInfo.setPageSize(5);
		PageBeanOfBrand brandPage = businessService.getPageBeanOfBrand(pageInfo);
		ServletActionContext.getRequest().setAttribute("brandList", brandPage.getBrandList());
		//3 管理员头像
		PageInfoOfAdmin adminPageInfo = new PageInfoOfAdmin();
		adminPageInfo.setPageSize(4);
		AdminPageBean adminPageBean= businessService.queryAdmiPageBean(adminPageInfo);
		ServletActionContext.getRequest().setAttribute("adminList", adminPageBean.getAdminList());
		
		//4 . 背景图片
		Product background = businessService.findProduct("433faae10ea5469ea6f0754f545280bf");
		ServletActionContext.getRequest().setAttribute("background", background);
		//颜色分类
		Set<Category> colorCatevoryList=rootSubcategory().get(3).getSubCategorys();
		ServletActionContext.getRequest().setAttribute("colorCatevoryList", colorCatevoryList);
		//产品型号分类
		Set<Category> modelCategoryList=rootSubcategory().get(4).getSubCategorys();
		ServletActionContext.getRequest().setAttribute("modelCategoryList", modelCategoryList);
		return "indexSuccess";
	}
	// 3. 首页加载时显示促销榜销售最好的分类产品,销售突出的产品,父节点中阶层为第三
	public String saleProminenceProduct() throws Exception{
		Category prominenceSaleCategorys = rootSubcategory().get(2);
		List<Category> sortCategory3 = new ArrayList<Category>();
		sortCategory3.addAll(prominenceSaleCategorys.getSubCategorys());
		Collections.sort(sortCategory3, new Comparator<Category>(){//遍历顺序集合先要排序
			@Override
			public int compare(Category o1, Category o2) {
				return o1.getLayer()>o2.getLayer()?1:-1;
			}
		});
		//System.out.println(sortCategory3+"========================== 124 line");
		//我只要前5个分类下的销售最好产品
		QueryPaging queryInfo = new QueryPaging();
		queryInfo.setPageSize(1);
		queryInfo.setSortCondition("totalSaleNum desc");//升序查找
		List<Product> saleBestList = new LinkedList<Product>();
		for(int i = 0 ; i<5 ; i++){
			Product product=businessService.findPagingProductByCategory(queryInfo, sortCategory3.get(i).getCid()).get(0);
			if(product!=null){
				product.setCategoryId(sortCategory3.get(i).getCid());
				saleBestList.add(product);
			}
		}
		ObjectMapper om = new ObjectMapper();
		this.jsonData=om.writeValueAsString(saleBestList);
		return this.SUCCESS;
	}
	/**
	 * 产品详细信息页
	 * @return
	 */
	public String singleProductProfile(){
		try{
			Product product = businessService.findProduct(productId);
			if(product!=null){
				Category colorCategory = rootSubcategory().get(3);//颜色分类在跟分类中对应的节点就是3,要遍历产品下的颜色
				List<Category> colorList = new ArrayList<Category>();
				if(colorCategory.getSubCategorys()!=null){
					List<Category> auxiliarylistP = new ArrayList<Category>();
					List<Category> auxiliarylistC = new ArrayList<Category>();
					auxiliarylistP.addAll(product.getCategorySet());//产品类
					auxiliarylistC.addAll(colorCategory.getSubCategorys());//颜色的颜色种类
					for(Category color : auxiliarylistC){
						for(Category category:auxiliarylistP){
							if(color.equals(category)){
								colorList.add(color);
								break;
							}
						}
					}
					//产品具备的颜色集合
					ServletActionContext.getRequest().setAttribute("colorList", colorList);
				}
				
				ServletActionContext.getRequest().setAttribute("navigateCategorys", navigateHeadCategory());
				ServletActionContext.getRequest().setAttribute("product", product);
				
				//产品型号分类
				Set<Category> modelCategoryList=rootSubcategory().get(4).getSubCategorys();
				ServletActionContext.getRequest().setAttribute("modelCategoryList", modelCategoryList);
			}
		}catch(Exception e){
			e.printStackTrace();
			indexVisited();
			return "error";
		}
		return this.SUCCESS;
	}
	//关于我们的详细介绍
	public String aboutUsProfile(){
		//1. 导航头
		ServletActionContext.getRequest().setAttribute("navigateCategorys", navigateHeadCategory());
		//2. 背景图片
		Product background = businessService.findProduct("433faae10ea5469ea6f0754f545280bf");
		ServletActionContext.getRequest().setAttribute("background", background);
		//3. 我们的新品集合
		Product containNew = businessService.findProduct("519fcc0a04424001b9694b761ffa166f");
		ServletActionContext.getRequest().setAttribute("containNew", containNew);
		//4. 显示我们的管理员 ， 前四个
		PageInfoOfAdmin adminPageInfo = new PageInfoOfAdmin();
		adminPageInfo.setPageSize(4);
		AdminPageBean adminPageBean= businessService.queryAdmiPageBean(adminPageInfo);
		ServletActionContext.getRequest().setAttribute("adminList", adminPageBean.getAdminList());
		return this.SUCCESS;
	}
	//导航头分类项
	public List<Category> navigateHeadCategory(){
		//businessService 不能依赖spring注入，因为其他的类要使用这个方法
		BusinessService myBusinessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
		List<Category> categoryList = myBusinessService.findCategoryByLayer(0);
		Category rootCategory = categoryList.get(0);
		List<Category> rootSubcategory = new ArrayList();
		rootSubcategory.addAll(rootCategory.getSubCategorys());
		//根据前台页面布局显示分类产品的信息
		if(rootSubcategory.size()>=2){
			Collections.sort(rootSubcategory, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			//1 导航分类项
			Category navigateCategory =rootSubcategory.get(0);
			List<Category> sortCategory = new ArrayList<Category>();
			sortCategory.addAll(navigateCategory.getSubCategorys());
			Collections.sort(sortCategory, new Comparator<Category>(){//遍历顺序集合先要排序
				@Override
				public int compare(Category o1, Category o2) {
					return o1.getLayer()>o2.getLayer()?1:-1;
				}
			});
			return sortCategory;//排完序的分类项
		}else{
			return rootSubcategory;//否则size<1 直接返回第一个分类数据
		}
	}
	//所有分类的祖宗下第一代子节点
	public List<Category> rootSubcategory(){
		BusinessService myBusinessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
		List<Category> categoryList = myBusinessService.findCategoryByLayer(0);
		Category rootCategory = categoryList.get(0);
		List<Category> rootSubcategory = new ArrayList();
		rootSubcategory.addAll(rootCategory.getSubCategorys());
		//根据前台页面布局显示分类产品的信息
		Collections.sort(rootSubcategory, new Comparator<Category>(){//遍历顺序集合先要排序
			@Override
			public int compare(Category o1, Category o2) {
				return o1.getLayer()>o2.getLayer()?1:-1;
			}
		});
		return rootSubcategory;
	}
	
	
}
