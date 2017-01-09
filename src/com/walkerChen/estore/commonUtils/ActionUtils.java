package com.walkerChen.estore.commonUtils;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.businessFactory.DaoAuthorityFactory;
import com.walkerChen.estore.businessService.BusinessService;

public class ActionUtils {
	
	public String authorityVerfiyCheck(String methodName){
		HttpServletRequest request = ServletActionContext.getRequest();
		Admin admin = (Admin) request.getSession().getAttribute("admin");
		DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory(admin);
		StringBuilder sBuilder = new StringBuilder("{\"authorityMessage\":");
		String isPass = authorityFactory.authorityIdentify(methodName, BusinessService.class);
		sBuilder.append("\""+isPass+"\"}");
		System.out.println(sBuilder.toString()+"  "+admin);
		return sBuilder.toString();
	}
}
