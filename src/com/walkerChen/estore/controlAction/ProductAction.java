package com.walkerChen.estore.controlAction;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;

import javax.swing.JOptionPane;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.walkerChen.estore.bean.page.PageBean;
import com.walkerChen.estore.bean.page.QueryPaging;
import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.ActionUtils;
import com.walkerChen.estore.commonUtils.WebUtils;
/**
 * 
 * @author cbh12
 *
 */
@SuppressWarnings("all")
public class ProductAction extends ActionSupport implements ModelDriven<Product>  {
	Product product = new Product ();
	private BusinessService businessService;
	private String verifyCheck;
	//产品图片
	private List<File> fileList;
	private List<String> fileListContentType;
	private List<String> fileListFileName;
	private String removeFiles ;
	
	//产品图文参数
	private List<File> paramFileList;
	private List<String> paramFileListContentType;
	private List<String> paramFileListFileName;
	private String invalidParamFiles ;
	
	private InputStream inputStream;
	private int pageSize;//页面大小
	private String sortCondition;//排序条件
	private String brandType;//分类类型
	private int currentPage;
	private String obscureSearch;//模糊查询搜索
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String getVerifyCheck() {return verifyCheck;}

	public void setVerifyCheck(String verifyCheck) {this.verifyCheck = verifyCheck;}
	
	
	public List<File> getFileList() {return fileList;}
	
	public List<String> getFileListContentType() {return fileListContentType;}
	
	public List<String> getFileListFileName() {return fileListFileName;}
	
	public void setFileList(List<File> fileList) {this.fileList = fileList;}
	
	public void setFileListContentType(List<String> fileListContentType) {this.fileListContentType = fileListContentType;}
	
	public void setFileListFileName(List<String> fileListFileName) {this.fileListFileName = fileListFileName;}
	
	
	public String getRemoveFiles() {return removeFiles;}
	
	public void setRemoveFiles(String removeFiles) {this.removeFiles = removeFiles;}
	
	
	
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
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
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public String getObscureSearch() {
		return obscureSearch;
	}
	public void setObscureSearch(String obscureSearch) {
		this.obscureSearch = obscureSearch;
	}
	//产品图文参数
	public List<File> getParamFileList() {
		return paramFileList;
	}
	public void setParamFileList(List<File> paramFileList) {
		this.paramFileList = paramFileList;
	}
	public List<String> getParamFileListContentType() {
		return paramFileListContentType;
	}
	public void setParamFileListContentType(List<String> paramFileListContentType) {
		this.paramFileListContentType = paramFileListContentType;
	}
	public List<String> getParamFileListFileName() {
		return paramFileListFileName;
	}
	public void setParamFileListFileName(List<String> paramFileListFileName) {
		this.paramFileListFileName = paramFileListFileName;
	}
	public String getInvalidParamFiles() {
		return invalidParamFiles;
	}
	public void setInvalidParamFiles(String invalidParamFiles) {
		this.invalidParamFiles = invalidParamFiles;
	}
	@Override
	public Product getModel() {return product;}
	
	
	public String addProductCheck(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("addProduct"));
		return this.SUCCESS;
	}
	
	public String fetchProductBrand(){
		List<Brand> brandList = businessService.findAllBrand();
		List<Category>categoryList = businessService.findCategoryByLayer(0);
		ServletActionContext.getRequest().setAttribute("brandList", brandList);
		ServletActionContext.getRequest().setAttribute("categoryList", categoryList);
		return this.SUCCESS;
	}
	public String verifyDuplicateName(){
		StringBuilder sBuilder = new StringBuilder("{\"message\":");
		if(!businessService.isDuplicateNameOfProduct(product.getName())){
			sBuilder.append("\"yes\"}");
		}else{
			sBuilder.append("\"no\"}");
		}
		setVerifyCheck(sBuilder.toString());
		return this.SUCCESS;
	}
	public String addProduct(){
		List<String> removeFileList = null;
		List<String> invalidFileList = null;
		if(removeFiles!=null && removeFiles.trim().length()!=0){
			removeFileList= Arrays.asList(removeFiles.split(","));
		}
		if(invalidParamFiles!=null && invalidParamFiles.trim().length()!=0){
			invalidFileList = Arrays.asList(invalidParamFiles.split(","));
		}
		StringBuilder sBuilder = new StringBuilder("{\"message\":");
		WebUtils webUtils = new WebUtils();
		try {
			//产品的介绍图
			for(int i = 0 ; fileList!=null && i<fileList.size();i++){
				if(removeFileList!=null && removeFileList.contains(fileListFileName.get(i))){
					continue;
				}else{
					String fileName = webUtils.generateUniqueFilename(fileListFileName.get(i));
					String filePath = webUtils.generateScatterFilepath("F:/amusementItem/upload", fileName);
					product.getImgUrlList().add(filePath);//出现异常要删除的图片路径
					FileUtils.copyFile(fileList.get(i), new File(filePath));
				}
			}
			StringBuilder sb = new StringBuilder();
			for(int i = 0 ; i<product.getImgUrlList().size();i++){
				sb.append(product.getImgUrlList().get(i)+"&");
			}
			//产品的图文参数图
			//JOptionPane.showMessageDialog(null, paramFileList.size());
			for(int i = 0 ; paramFileList !=null && i<paramFileList.size();i++){
				if(invalidFileList!=null && invalidFileList.contains(paramFileListFileName.get(i))){
					continue;
				}else{
					String fileName = webUtils.generateUniqueFilename(paramFileListFileName.get(i));
					String filePath = webUtils.generateScatterFilepath("F:/amusementItem/upload/parameterFile", fileName);
					product.getImgParamList().add(filePath);//出现异常要删除的图片路径
					FileUtils.copyFile(paramFileList.get(i), new File(filePath));
				}
			}
			StringBuffer sbuffer = new StringBuffer();
			for(int i = 0 ; i<product.getImgParamList().size();i++){
				sbuffer.append(product.getImgParamList().get(i)+"&");
			}
			product.setIconurl(sb.length()!=0?sb.substring(0, sb.length()-1):"");
			product.setParamIconurl(sbuffer.length()!=0?sbuffer.substring(0 , sbuffer.length()-1):"");
			product.setBrand(businessService.findBrand(product.getBrandId()));
			//产品和分类是多对多的关系，因此获取前台传过来的分类Id集
			String categoryIds = product.getCategoryId();
			if(categoryIds!=null && categoryIds.trim().length()!=0){
				String[] arrayCid = categoryIds.split(",");
				Set<Category> categorySet = new HashSet<Category>();
				for(int i = 0 ; i<arrayCid.length ;i++){
					categorySet.add(businessService.findCategory(arrayCid[i]));
				}
				product.setCategorySet(categorySet);
			}
			businessService.addProduct(product);
			sBuilder.append("\"yes\"}");
		} catch (IOException e) {
			List<String> imgUrlList = product.getImgUrlList();
			for(int i =0;i<imgUrlList.size();i++){
				webUtils.deleteFileInfo(imgUrlList.get(i));
			}
			List<String> imgParamList = product.getImgParamList();
			for(int i =0;i<imgParamList.size();i++){
				webUtils.deleteFileInfo(imgParamList.get(i));
			}
			sBuilder.append("\"no\"}");
			e.printStackTrace();
		}
		setVerifyCheck(sBuilder.toString());
		return this.SUCCESS;	
	}
	
	public String findPagingProductCheck(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("findPagingProduct"));
		return this.SUCCESS;
	}
	
	public String findPagingProduct(){
	    QueryPaging queryPaging= new QueryPaging();
		
		PageBean pageBean = businessService.findPagingProduct(queryPaging);
		pageBean.setTotalPage(pageBean.getTotalPage());
		pageBean.setPagination(pageBean.getPagination());
		System.out.println(pageBean +" 我的这行验证代码是在147行");
		List<Brand> brandList = businessService.findAllBrand();
		ServletActionContext.getRequest().setAttribute("brandList", brandList);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		return this.SUCCESS;
	}
	public InputStream getInputStream(){
		synchronized(this){
			String productId = product.getId();
			String iconName = null;
			if(product.getIconurl()!=null){
				iconName = product.getIconurl();
			}else{
				iconName = product.getParamIconurl();
			}
			 
			String iconUrl=null;
			/**
			 * 保存的时候是所有图片的地址，标记符号是&
			 * iconurl是灵活的应用，到网页是图片名字，
			 * 到数据库是名字匹配图片url
			 */
			if(productId!=null && iconName!=null){
				Product myProduct = businessService.findProduct(productId);
				iconUrl=myProduct.getMappingImgUrl().get(iconName);
				if(iconUrl!=null){
					try {
						FileInputStream fileInput = fileInput= new FileInputStream(new File(iconUrl));
						this.inputStream = new BufferedInputStream(fileInput);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			return this.inputStream;
		}
	}
	public void setInputStream(InputStream inputStream) {
			this.inputStream = inputStream;
	}
	public String showProductImgByAjax() throws JsonProcessingException{
		String productId = product.getId();
		if(productId!=null){
			Product product = businessService.findProduct(productId);
			String iconUrl = product.getIconurl();
			/**
			 * 在这里我们要使用产品对象的list集合封装该产品的图片的名字，而不是图片的绝对地址，访问网页不能是对地址的访问，这样不安全要用流读取
			 */
			List<String> imgUrlList = new ArrayList<String>();
			if(iconUrl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
				while(stringTokenizer.hasMoreTokens()){
					String iconPath= stringTokenizer.nextToken();
					int lastSprit = iconPath.lastIndexOf("/");
					String iconName = iconPath.substring(lastSprit+1,iconPath.length());
					imgUrlList.add(iconName);
				}
			}
			product.setImgUrlList(imgUrlList);
			ObjectMapper om = new ObjectMapper();
			this.setVerifyCheck(om.writeValueAsString(product));
		}
		return this.SUCCESS;
	}
	public String showPagingProductBySize(){
		synchronized(this){
			QueryPaging queryPaging= new QueryPaging();
			if(pageSize!=0){
				queryPaging.setPageSize(pageSize);
			}if(currentPage>=1){
				queryPaging.setCurrentPage(currentPage);
			}
			System.out.println(pageSize+","+sortCondition+","+brandType);
			queryPaging.setBrandType(brandType);
			queryPaging.setSortCondition(sortCondition);
			queryPaging.setObscureSearch(obscureSearch);
			System.out.println(queryPaging.getWhereAssociate()+" this is code appear in 214 line !");
			PageBean pageBean = businessService.findPagingProduct(queryPaging);
			pageBean.setTotalPage(pageBean.getTotalPage());
			pageBean.setPagination(pageBean.getPagination());
			ObjectMapper om = new ObjectMapper();
			try {
				System.out.println(pageBean);
				this.setVerifyCheck(om.writeValueAsString(pageBean));
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return this.SUCCESS;
		}
	}
	public String productProfile(){
		String productId = product.getId();
		if(productId!=null){
			Product myProduct = businessService.findProduct(productId);
			System.out.println(myProduct.getCategorySet());
			String iconUrl = myProduct.getIconurl();
			/**
			 * 在这里我们要使用产品对象的list集合封装该产品的图片的名字，而不是图片的绝对地址，访问网页不能是对地址的访问，这样不安全要用流读取
			 */
			List<String> imgUrlList = new ArrayList<String>();
			if(iconUrl!=null){
				StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
				while(stringTokenizer.hasMoreTokens()){
					String iconPath= stringTokenizer.nextToken();
					int lastSprit = iconPath.lastIndexOf("/");
					String iconName = iconPath.substring(lastSprit+1,iconPath.length());
					imgUrlList.add(iconName);
				}
			}
			myProduct.setImgUrlList(imgUrlList);
			ServletActionContext.getRequest().setAttribute("product", myProduct);
			List<Brand> brandList = businessService.findAllBrand();
			ServletActionContext.getRequest().setAttribute("brandList", brandList);
			List<Category>categoryList = businessService.findCategoryByLayer(0);
			ServletActionContext.getRequest().setAttribute("categoryList", categoryList);
		}
		return this.SUCCESS;
	}
	
	public String updateProductImg() throws IOException{
		ProductUpdate update = new ProductUpdate(); 
		if(product.getIconurl()!=null || fileList !=null){
			this.verifyCheck=update.updateProductImg(fileList, fileListFileName, product);
			return this.SUCCESS;
		}else if(product.getParamIconurl()!=null || paramFileList!=null){
			this.verifyCheck=update.updateProductParamImg(paramFileList, paramFileListFileName, product);
			return this.SUCCESS;
		}
		return this.SUCCESS;
	}
	public String updateProductForm(){
		
		if(product.getCategoryId()!=null && product.getCategoryId().trim().length()!=0){
			Category category = businessService.findCategory(product.getCategoryId());
			//产品和分类是多对多的关系，因此获取前台传过来的分类Id集
			String categoryIds = product.getCategoryId();
			if(categoryIds!=null && categoryIds.trim().length()!=0){
				String[] arrayCid = categoryIds.split(",");
				Set<Category> categorySet = new HashSet<Category>();
				for(int i = 0 ; i<arrayCid.length ;i++){
					categorySet.add(businessService.findCategory(arrayCid[i]));
				}
				product.setCategorySet(categorySet);
			}
		}
		if(product.getBrandId()!=null && product.getBrandId().trim().length()!=0){
			Brand brand = businessService.findBrand(product.getBrandId());
			product.setBrand(brand);
		}
		businessService.updateProduct(product);
		this.setVerifyCheck("{\"message\":\"success\"}");
		return this.SUCCESS;
	}
}
