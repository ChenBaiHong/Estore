package com.walkerChen.estore.bean.substance;

public class TempUser {
	String tempId;
	String tempName;
	String address;
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	public String getTempName() {
		return tempName;
	}
	public void setTempName(String tempName) {
		this.tempName = tempName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public TempUser(String tempId, String tempName, String address) {
		super();
		this.tempId = tempId;
		this.tempName = tempName;
		this.address = address;
	}
	public TempUser() {
		super();
	}
	@Override
	public String toString() {
		return "TempUser [tempId=" + tempId + ", tempName=" + tempName
				+ ", address=" + address + "]";
	}
	
}
