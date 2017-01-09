package com.walkerChen.estore.bean.substance;

import java.sql.Date;

public class User {
	private String id; // 用户id
	private String username; //用户名
	private String password; // 密码
	private String realname; // 昵称
	private String identicalId;//身份证号码
	private String sex; //性别
	private String birthday;//生日
	private String email; // 邮箱
	private String cellphone;//联系电话
	private String address;//联系地址
	private String state; // 是否激活 0未激活 ， 1 激活
	private String activecode; // 激活码UUID获取
	private String  payCode;
	private Date updatetime; // 更新时间
	private String iconHead;//头像
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getIdenticalId() {
		return identicalId;
	}
	public void setIdenticalId(String identicalId) {
		this.identicalId = identicalId;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getActivecode() {
		return activecode;
	}
	public void setActivecode(String activecode) {
		this.activecode = activecode;
	}
	public String getPayCode() {
		return payCode;
	}
	public void setPayCode(String payCode) {
		this.payCode = payCode;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getIconHead() {
		return iconHead;
	}
	public void setIconHead(String iconHead) {
		this.iconHead = iconHead;
	}
	
	
}
