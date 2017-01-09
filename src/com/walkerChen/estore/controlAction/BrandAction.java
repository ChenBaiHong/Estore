package com.walkerChen.estore.controlAction;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.walkerChen.estore.bean.substance.Brand;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.ActionUtils;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageBeanOfBrand;
import com.walkerChen.estore.dao.pagingBeanOfBrand.PageInfoOfBrand;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

import java.io.*;
import java.util.List;

/**
 * Created by cbh12 on 9/27/2016.
 */

@SuppressWarnings("all")
public class BrandAction extends  ActionSupport implements ModelDriven<Brand>{
	Brand brand = new Brand();
	private String pageBeanJSON;
	private String verifyCheck;
	private BusinessService businessService;
	private String targetPage;
	private String conditionParam;
	
	private File fileImg;
	private String fileImgContentType;
	private String fileImgFileName;
	
	private InputStream inputStream;
	
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
	public File getFileImg() {
		return fileImg;
	}
	public void setFileImg(File fileImg) {
		this.fileImg = fileImg;
	}
	
	public String getConditionParam() {
		return conditionParam;
	}
	public void setConditionParam(String conditionParam) {
		this.conditionParam = conditionParam;
	}
	public String getTargetPage() {
		return targetPage;
	}
	public void setTargetPage(String targetPage) {
		this.targetPage = targetPage;
	}
	public BusinessService getBusinessService() {
		return businessService;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String getVerifyCheck() {
		return verifyCheck;
	}
	public void setVerifyCheck(String verifyCheck) {
		this.verifyCheck = verifyCheck;
	}
	
	public String getPageBeanJSON() {
		return pageBeanJSON;
	}
	public void setPageBeanJSON(String pageBeanJSON) {
		this.pageBeanJSON = pageBeanJSON;
	}
	public String addBrandCheck(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("addBrand"));
		return this.SUCCESS;
	}
	public String findAllBrandCheck(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("findAllBrand"));
		return this.SUCCESS;
	}
	public String saveBrand(){
		System.out.println(brand);
		StringBuilder sBuilder = new StringBuilder("{\"message\":");
		if(!businessService.isDuplicateName(brand.getName())){
			businessService.addBrand(brand);
			sBuilder.append("\"yes\"}");
		}else{
			sBuilder.append("\"no\"}");
		}
		setVerifyCheck(sBuilder.toString());
		return this.SUCCESS;
	}
	public String findAllBrand(){
		PageInfoOfBrand pageInfo = new PageInfoOfBrand();
		PageBeanOfBrand pageBean = businessService.getPageBeanOfBrand(pageInfo);
		System.out.println(pageBean);
		pageBean.setPageBar(pageBean.getPageBar());
		pageBean.setTotalPage(pageBean.getTotalPage());
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		return this.SUCCESS;
	}
	public String pagingFindBrand(){
		System.out.println(targetPage);
		PageInfoOfBrand pageInfo = new PageInfoOfBrand();
		pageInfo.setCurrentPage(Integer.parseInt(targetPage));
		PageBeanOfBrand pageBean = businessService.getPageBeanOfBrand(pageInfo);
		pageBean.setPageBar(pageBean.getPageBar());
		pageBean.setTotalPage(pageBean.getTotalPage());
		ObjectMapper om = new ObjectMapper();
		try {
			this.setPageBeanJSON(om.writeValueAsString(pageBean));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return this.SUCCESS;
	}
	
	public String likeBlurredSearchBrand(){
		List<Brand> BrandList = businessService.likeBlurredSearchBrand(conditionParam);
		ObjectMapper om = new ObjectMapper();
		try {
			this.setConditionParam(om.writeValueAsString(BrandList));
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return this.SUCCESS;
	}
	
	public String updateBrand(){
		System.out.println(brand);
		StringBuilder message = new StringBuilder("{\"message\":");
		try {
			if(fileImg!=null){
				System.out.println(fileImgFileName);
				FileUtils.copyFile(fileImg , new File("F:/amusementItem/upload",fileImgFileName));
				String BrandImg = "F:/amusementItem/upload/"+fileImgFileName;
				brand.setBrandImg(BrandImg);
				System.out.println(brand);
			}
			businessService.updateBrand(brand);
			message.append("\"success\"}");
		} catch (IOException e) {
			message.append("\"failed\"}");
		}
		this.setVerifyCheck(message.toString());
		return this.SUCCESS;
	}
	public InputStream getInputStream() throws IOException {
		String BrandId = brand.getId();
		System.out.println(brand);
		if(BrandId!=null && BrandId.length()!=0){
			Brand brand = businessService.findBrand(BrandId);
			String BrandImg = brand.getBrandImg();
			if(BrandImg!=null && BrandImg.length()!=0){
				File file = new File(BrandImg);
				FileInputStream  fileInStream = new FileInputStream(file);
				BufferedInputStream bufferedInput = new BufferedInputStream(fileInStream);
				this.inputStream=bufferedInput;
			}
		}
		return this.inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		
		this.inputStream = inputStream;
	}
	@Override
	public Brand getModel() {
		return brand;
	}
}
