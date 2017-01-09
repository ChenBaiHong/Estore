package com.walkerChen.estore.controlAction;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.walkerChen.estore.bean.substance.Category;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.ActionUtils;
import com.walkerChen.estore.commonUtils.WebUtils;
@SuppressWarnings("all")
public class CategoryAction extends ActionSupport implements ModelDriven<Category>{
	Category category = new Category();
	private BusinessService businessService;
	private String verifyCheck;
	
	private File fileImg;
	private String fileImgContentType;
	private String fileImgFileName;
	
	private InputStream inputStream;
	public String getVerifyCheck() {
		return verifyCheck;
	}
	public void setVerifyCheck(String verifyCheck) {
		this.verifyCheck = verifyCheck;
	}
	
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String addCategoryCheck(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("addCategory"));
		return this.SUCCESS;
	}
	
	public File getFileImg() {
		return fileImg;
	}
	public void setFileImg(File fileImg) {
		this.fileImg = fileImg;
	}
	public String getFileImgContentType() {
		return fileImgContentType;
	}
	public void setFileImgContentType(String fileImgContentType) {
		this.fileImgContentType = fileImgContentType;
	}
	public String getFileImgFileName() {
		return fileImgFileName;
	}
	public void setFileImgFileName(String fileImgFileName) {
		this.fileImgFileName = fileImgFileName;
	}
	public String handlerCategory(){
		List<Category> categoryList = businessService.findCategoryByLayer(0);
		ServletActionContext.getRequest().setAttribute("categoryList", categoryList);
		return this.SUCCESS;
	}
	
	public String fetchSubcategory() throws Exception{
		if(category.getCid()!=null){
			Category mycategory = businessService.findCategory(category.getCid());
			Set<Category> subCategorys =mycategory.getSubCategorys();
			ObjectMapper om = new ObjectMapper();
			this.setVerifyCheck(om.writeValueAsString(subCategorys));
		}
		return this.SUCCESS;
	}
	/**
	 * 在这里保存的分类节点如果有父类，
	 * 那么就在该父类下做节点更新
	 * @return
	 */
	public String saveCategoryForm(){
		//如果父节点不为空，在父节点下做更新添加新创的节点为孩子节点
		if(category.getParentId()!=null && category.getParentId().trim().length()!=0){
			Category parentCategory = businessService.findCategory(category.getParentId());
			if(parentCategory.getSubCategorys()!=null && parentCategory.getSubCategorys().size()!=0){
				parentCategory.getSubCategorys().add(category);
			}else{
				Set<Category> subCategorys = new HashSet<Category>();
				subCategorys.add(category);
				parentCategory.setSubCategorys(subCategorys);
			}
			businessService.updateCategory(parentCategory);
		//否则没有父节点按一级节点做处理	
		}else{
			businessService.addCategory(category);
		}
		this.setVerifyCheck("{\"message\":\"success\",\"categoryId\":\""+category.getCid()+"\"}");
		//System.out.println("THIS IS CATEGORY CADE SEVETY LINE ==> "+category);
		return this.SUCCESS;	
	}
	
	public String updateCategoryForm(){
		if(category.getCid()!=null && category.getCid().trim().length()!=0 && category.getLayer()!=0){
			Category updateCategory = businessService.findCategory(category.getCid());
			category.getSubCategorys().addAll(updateCategory.getSubCategorys());
			businessService.updateCategory(category);
			this.setVerifyCheck("{\"message\":\"success\"}");
		}
		return this.SUCCESS;
	}
	/**
	 * 
	 * 父节点删除会级联子类
	 * @return
	 */
	public String deleteCategoryForm(){
		if(category.getCid()!=null && category.getCid().trim().length()!=0){
			businessService.deleteCategory(category.getCid());
			this.setVerifyCheck("{\"message\":\"success\"}");
		}
		return this.SUCCESS;
	}
	/**
	 * 更新分类的图片信息参数
	 * @return
	 * @throws IOException
	 */
	public String updateCategoryImg() throws IOException{
		String categoryId = category.getCid();
		if(fileImg!=null && categoryId!=null && categoryId.trim().length()!=0){
			WebUtils webUtils = new WebUtils();
			
			String fileName = webUtils.generateUniqueFilename(fileImgFileName);
			String filePath = webUtils.generateScatterFilepath("F:/amusementItem/upload", fileName);
			FileUtils.copyFile(fileImg , new File(filePath));
			Category mycategory = businessService.findCategory(categoryId);
			if(mycategory.getProfileImg()!=null && mycategory.getProfileImg().trim().length()!=0){
				webUtils.deleteFileInfo(mycategory.getProfileImg());
			};
			mycategory.setProfileImg(filePath);
			businessService.updateCategory(mycategory);
			this.verifyCheck="{\"message\":\"success\"}";
		}else{
			this.verifyCheck="{\"message\":\"field\"}";
		}
		return this.SUCCESS;
	}
	/**
	 * 读取分类下的图片文件
	 * @return
	 * @throws FileNotFoundException 
	 */
	public InputStream getInputStream() throws FileNotFoundException {
		String categoryId = category.getCid();
		if(categoryId!=null && categoryId.trim().length()!=0){
			Category mycategory = businessService.findCategory(categoryId);
			String fileImgPath = mycategory.getProfileImg();
			if(fileImgPath!=null && fileImgPath.trim().length()!=0){
				
				FileInputStream fileInput = fileInput= new FileInputStream(new File(fileImgPath));
				this.inputStream = new BufferedInputStream(fileInput);
			}
		}
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	@Override
	public Category getModel() {
		return category;
	}

}
