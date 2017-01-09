package com.walkerChen.estore.controlAction.foreground;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.walkerChen.estore.bean.substance.TempUser;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.Md5Utils;
import com.walkerChen.estore.commonUtils.ServletUtils;
@SuppressWarnings("all")
public class LogonAction extends ActionSupport {
	private BusinessService businessService;
	private String loginName;
	private String password;
	private String deadline;
	private String jsonData;
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public String getJsonData() {
		return jsonData;
	}
	public String userGoLogon(){
		//新的导航头
		ServletActionContext.getRequest().setAttribute("navigateCategorys", new IndexAction().navigateHeadCategory());
		return this.SUCCESS;
	}
	public String userLogon(){
		StringBuilder sb = new StringBuilder("{\"message\":");
		if(loginName!=null  && password!=null){
			User user = businessService.findUser(loginName, Md5Utils.md5(password));
			if(user!=null){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession(false);
				session.setMaxInactiveInterval(1000*60*60*60*3);//session最大存储时间是3小时
				session.setAttribute("user", user);
				if(deadline!=null && deadline.trim().length()!=0){
					int deadlineTime = Integer.parseInt(deadline);
					ServletUtils servletUtils = new ServletUtils();
					servletUtils.userAutoLogon(user, deadlineTime, request, ServletActionContext.getResponse());
				}
				if((TempUser) ServletActionContext.getRequest().getSession().getAttribute("tempUser") != null){
					ServletActionContext.getRequest().getSession().removeAttribute("tempUser");
				}
				sb.append("\"yes\"}");
			}else{
				sb.append("\"no\"}");
			}
			this.jsonData=sb.toString();
		}
		return this.SUCCESS;
	}
	
	public String userLogout(){
		ServletUtils servletUtils = new ServletUtils();
		servletUtils.userLogout(ServletActionContext.getRequest(),ServletActionContext.getResponse());
		this.jsonData="{\"message\":\"yes\"}";
		return this.SUCCESS;
	}
}
