package com.walkerChen.estore.controlAction.foreground;

import java.util.UUID;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.EmailUtils;
import com.walkerChen.estore.commonUtils.Md5Utils;

@SuppressWarnings("all")
public class RegisterAction extends ActionSupport implements ModelDriven<User>{
	private BusinessService businessService;
	private String jsonData;
	private String token;
	private User user = new User();
	public String getJsonData() {
		return jsonData;
	}
	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
	public String entryRegister(){
		ServletActionContext.getRequest().getSession().setAttribute("token",Md5Utils.generateToken() );
		return "EntrySuccess";
	}
	
	public void setToken(String token) {
		this.token = token;
	}
	public String verifyNameAjax(){
		String username = user.getUsername();
		ValueStack vs = (ValueStack) ServletActionContext.getRequest().getAttribute(ServletActionContext.STRUTS_VALUESTACK_KEY);
		if(username !=null && username.trim().length()!=0){
			String bandVocabulary =(String) vs.findValue("bandVocabulary"); //vs.findString("bandVocabulary");
			String reviewVocabulary = (String) vs.findValue("reviewVocabulary");
			String replaceVocabulary = (String) vs.findValue("replaceVocabulary");
			if(bandVocabulary!=null || reviewVocabulary!=null || replaceVocabulary!=null){
				vs.set("bandVocabulary",null);
				vs.set("reviewVocabulary",null);
				vs.set("replaceVocabulary",null);
				jsonData="{\"message\":\"用户名中包含非法敏感词汇\"}";
				return this.SUCCESS;
			}else{
				boolean isExist = businessService.isExistSimilarUsername(user.getUsername());
				if(isExist){
					jsonData="{\"message\":\"该用户名已被占用\"}";
				}else{
					jsonData="{\"message\":\"yes\"}";
				}
				return this.SUCCESS;
			}
		}
		return this.SUCCESS;
	}
	public String verifyEmailAjax(){
		String email = user.getEmail();
		if(email!=null && email.trim().length()!=0){
			boolean isExist = businessService.isExistSimilarEmail(user.getEmail());
			if(isExist){
				jsonData="{\"message\":\"该电子邮箱已被使用\"}";
			}else{
				jsonData="{\"message\":\"yes\"}";
			}
		}
		return this.SUCCESS;
	}
	public String verifyCellphoneAjax(){
		String  cellphone= user.getCellphone();
		if(cellphone!=null && cellphone.trim().length()!=0){
			boolean isExist = businessService.isExistSimilaCellphone(user.getCellphone());
			if(isExist){
				jsonData="{\"message\":\"该手机已被使用\"}";
			}else{
				jsonData="{\"message\":\"yes\"}";
			}
		}
		return this.SUCCESS;
	}
	public String submitRegister() throws Exception{
		if(token!=null){
			String myToken = (String) ServletActionContext.getRequest().getSession().getAttribute("token");
			
			if(token.equals(myToken)){
				user.setState("0");//0 是未激活 ， 1 是激活的用户
				user.setPassword(Md5Utils.md5(user.getPassword()));//对用用户的密码Md5加密
				String activecode=UUID.randomUUID().toString()+Md5Utils.md5(user.getUsername()+user.getPassword())+UUID.randomUUID().toString();
				user.setActivecode(activecode);
				businessService.addUser(user);
				//向用户发送激活码
				EmailUtils.sendEamil(user.getEmail(), activecode);
				
				jsonData="{\"message\":\"yes\"}";
				ServletActionContext.getRequest().getSession().removeAttribute("token");
				return this.SUCCESS;
			}else{
				jsonData="{\"message\":\"no\"}";
				return this.SUCCESS;
			}
		}else{
			jsonData="{\"message\":\"no\"}";
			return this.SUCCESS;
		}
	}
	public String user_active(){
		if(user.getActivecode()!=null){
			User myUser = businessService.findUserByActivecode(user.getActivecode());
			myUser.setState("1");//激活用户激活
			businessService.UpdateUser(myUser);
		}
		return this.SUCCESS;
	}
	@Override
	public User getModel() {
		return user;
	}
}
