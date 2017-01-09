package com.walkerChen.estore.controlAction.customerService;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.walkerChen.estore.bean.substance.TempUser;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.ActionUtils;
import com.walkerChen.estore.commonUtils.Md5Utils;

@SuppressWarnings("all")
public class CustomerServiceAction extends ActionSupport{
	private BusinessService businessService;
	private String jsonData;
	private String verifyCheck;
	private String userName;
	private String userId;
	public String getJsonData() {
		return jsonData;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String getVerifyCheck() {
		return this.verifyCheck;
	}
	public void setVerifyCheck(String verifyCheck) {
		this.verifyCheck = verifyCheck;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * background 后台
	 * 		管理员是否具有进入后台客服的权利
	 * @return
	 */
	public String entryCustmerService(){
		setVerifyCheck(new ActionUtils().authorityVerfiyCheck("entryCustmerService"));
		return this.SUCCESS;
	}
	/**
	 * foreground 前台
	 * 		客服的咨询 代码
	 * @return
	 */
	public String customerServiceConsult(){
		//如果userName和userId是空的那就说明访问的用户是游客访问我的网站
		if(userName!=null && userId!=null){
			//如果用户是被登陆状态，那个么就说明临时用户的信息就不应被存在
			if((TempUser) ServletActionContext.getRequest().getSession().getAttribute("tempUser") != null){
				ServletActionContext.getRequest().getSession().removeAttribute("tempUser");
			}
		}else{
			//否则就说明是临时用户
			TempUser tempUser = new TempUser();
			tempUser.setTempId(Md5Utils.generateToken());
			tempUser.setTempName("游客登陆");
			ServletActionContext.getRequest().getSession().removeAttribute("tempUser");
		}
		return this.SUCCESS;
	}
	/**
	 * foreground 前台
	 * 		退出浏览器
	 * @return
	 */
	public String quitBrowser(){
		if((TempUser) ServletActionContext.getRequest().getSession().getAttribute("tempUser") != null){
			ServletActionContext.getRequest().getSession().removeAttribute("tempUser");
		}
		System.out.println();
		if((User) ServletActionContext.getRequest().getSession().getAttribute("user") != null){
			ServletActionContext.getRequest().getSession().removeAttribute("user");
		}
		this.jsonData = "{\"message\":\"true\"}";
		return this.SUCCESS;
	}
}
