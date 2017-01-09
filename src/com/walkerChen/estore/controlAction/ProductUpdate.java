package com.walkerChen.estore.controlAction;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.commons.io.FileUtils;

import com.walkerChen.estore.bean.substance.Product;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.WebUtils;

public class ProductUpdate {
	
	public String updateProductImg(List<File> fileList,
			List<String> fileListFileName, Product product) throws IOException {
		BusinessService businessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class); 
		String newFilePath=null;
		WebUtils webUtils = new WebUtils();
		//更新图片，换上新的图片
			if(fileList!=null && product.getIconurl()!=null && product.getId()!=null ){
				String fileName = webUtils.generateUniqueFilename(fileListFileName.get(0));
				newFilePath = webUtils.generateScatterFilepath("F:/amusementItem/upload", fileName);
				FileUtils.copyFile(fileList.get(0), new File(newFilePath));
				if(newFilePath!=null){
					Product myProduct = businessService.findProduct(product.
							getId());
					////根据网页带过来的图片名字 ,就是map集合的key，获取绝对路径
					String oldFilePath = myProduct.getMappingImgUrl().get(product.getIconurl());
					webUtils.deleteFileInfo(oldFilePath);//删除原始图片
					
					StringBuilder sb = new StringBuilder();//封装新的图片地址
					String iconUrl = myProduct.getIconurl();
					if(iconUrl!=null){
						StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
						while(stringTokenizer.hasMoreTokens()){
							String iconPath= stringTokenizer.nextToken();
							if(oldFilePath.equals(iconPath)){
								sb.append(newFilePath+"&");
							}else{
								sb.append(iconPath+"&");
							}
						}
					}
					myProduct.setIconurl(sb.length()!=0?sb.substring(0, sb.length()-1):"");
					businessService.updateProduct(myProduct);
					return "{\"message\":\"success\",\"fileName\":\""+fileName+"\",\"mapping\":\""+myProduct.getIconurl()+"\"}";
				}
			}
			//删除图片
			if(product.getIconurl()!=null && product.getId()!=null){
				if(product.getId()!=null && product.getIconurl()!=null){
					Product myProduct = businessService.findProduct(product.getId());
					////根据网页带过来的图片名字 ,就是map集合的key，获取绝对路径
					String deleteFilePath = myProduct.getMappingImgUrl().get(product.getIconurl());
					webUtils.deleteFileInfo(deleteFilePath);//删除原始图片
					StringBuilder sb = new StringBuilder();//封装新的图片地址
					String iconUrl = myProduct.getIconurl();
					if(iconUrl!=null){
						StringTokenizer stringTokenizer = new StringTokenizer(iconUrl,"&");
						while(stringTokenizer.hasMoreTokens()){
							String iconPath= stringTokenizer.nextToken();
							if(deleteFilePath.equals(iconPath)){
								continue;
							}else{
								sb.append(iconPath+"&");
							}
						}
					}
					myProduct.setIconurl(sb.length()!=0?sb.substring(0, sb.length()-1):"");
					businessService.updateProduct(myProduct);
					return "{\"message\":\"success\",\"mapping\":\""+myProduct.getIconurl()+"\"}";
				}
			}
			//添加图片
			if(fileList!=null && product.getId()!=null ){
				String fileName = webUtils.generateUniqueFilename(fileListFileName.get(0));
				newFilePath = webUtils.generateScatterFilepath("F:/amusementItem/upload", fileName);
				FileUtils.copyFile(fileList.get(0), new File(newFilePath));
				if(newFilePath!=null){
					Product myProduct = businessService.findProduct(product.getId());
					String iconUrl = myProduct.getIconurl();
					myProduct.setIconurl(iconUrl+"&"+newFilePath);//老规矩，图片路径的分割标记就用&符号
					businessService.updateProduct(myProduct);
					return "{\"message\":\"success\",\"fileName\":\""+fileName+"\",\"mapping\":\""+myProduct.getIconurl()+"\"}";
				}
			}
			return "{\"message\":\"error\"}";
	}
	
	
	public String updateProductParamImg(List<File> paramFileList , List<String> paramFileListFileName, Product product)
			throws IOException {
			BusinessService businessService = DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class); 
			String newFilePath=null;
			WebUtils webUtils = new WebUtils();
			//更换参数图片
				if(paramFileList!=null && product.getParamIconurl()!=null && product.getId()!=null ){
					String fileName = webUtils.generateUniqueFilename(paramFileListFileName.get(0));
					newFilePath = webUtils.generateScatterFilepath("F:/amusementItem/upload/parameterFile", fileName);
					FileUtils.copyFile(paramFileList.get(0), new File(newFilePath));
					
					if(newFilePath!=null){
						Product myProduct = businessService.findProduct(product.
								getId());
						//获取更新参数图片的地址,product.getParamIconurl() ,存储来自的图片名字
						String oldFilePath = myProduct.getMappingImgUrl().get(product.getParamIconurl());
						webUtils.deleteFileInfo(oldFilePath);//删除原始参数图片
						
						StringBuilder sb = new StringBuilder();//封装新的图片地址
						String paramIconurl = myProduct.getParamIconurl();
						if(paramIconurl!=null){
							StringTokenizer stringTokenizer = new StringTokenizer(paramIconurl,"&");
							while(stringTokenizer.hasMoreTokens()){
								String pramImgPath= stringTokenizer.nextToken();
								if(oldFilePath.equals(pramImgPath)){
									sb.append(newFilePath+"&");
								}else{
									sb.append(pramImgPath+"&");
								}
							}
						}
						myProduct.setParamIconurl(sb.length()!=0?sb.substring(0, sb.length()-1):"");
						businessService.updateProduct(myProduct);
						return "{\"message\":\"success\",\"fileName\":\""+fileName+"\",\"mapping\":\""+myProduct.getParamIconurl()+"\"}";
					}
				}
				//删除图片
				if(product.getParamIconurl()!=null && product.getId()!=null){
					if(product.getId()!=null && product.getParamIconurl()!=null){
						Product myProduct = businessService.findProduct(product.getId());
						////根据网页带过来的图片名字 ,就是map集合的key，获取绝对路径
						String deleteFilePath = myProduct.getMappingImgUrl().get(product.getParamIconurl());
						
						webUtils.deleteFileInfo(deleteFilePath);//删除原始图片
						StringBuilder sb = new StringBuilder();//封装新的图片地址
						String paramIconurl = myProduct.getParamIconurl();
						if(paramIconurl!=null){
							StringTokenizer stringTokenizer = new StringTokenizer(paramIconurl,"&");
							while(stringTokenizer.hasMoreTokens()){
								String pramImgPath= stringTokenizer.nextToken();
								if(deleteFilePath.equals(pramImgPath)){
									continue;
								}else{
									sb.append(pramImgPath+"&");
								}
							}
						}
						myProduct.setParamIconurl(sb.length()!=0?sb.substring(0, sb.length()-1):"");
						businessService.updateProduct(myProduct);
						return "{\"message\":\"success\",\"mapping\":\""+myProduct.getParamIconurl()+"\"}";
					}
				}
				//添加图片
				if(paramFileList!=null && product.getId()!=null ){
					String fileName = webUtils.generateUniqueFilename(paramFileListFileName.get(0));
					newFilePath = webUtils.generateScatterFilepath("F:/amusementItem/upload/parameterFile", fileName);
					FileUtils.copyFile(paramFileList.get(0), new File(newFilePath));
					if(newFilePath!=null){
						Product myProduct = businessService.findProduct(product.getId());
						String iconUrl = myProduct.getParamIconurl();
						myProduct.setParamIconurl(iconUrl+"&"+newFilePath);//老规矩，图片路径的分割标记就用&符号
						businessService.updateProduct(myProduct);
						return "{\"message\":\"success\",\"fileName\":\""+fileName+"\",\"mapping\":\""+myProduct.getParamIconurl()+"\"}";
					}
				}
				return "{\"message\":\"error\"}";
	}
	
}
