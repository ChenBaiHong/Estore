package com.walkerChen.estore.controlServlet.customerService;

public class ConsultEntity {
	private String id;
	private String name;
	private String levelType;//判断是管理员还是真是用户，或是临时用户
	private String distinguishToken;//鉴别标记 ，这个鉴别标记为MD5加密鉴别标记
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLevelType() {
		return levelType;
	}
	public void setLevelType(String levelType) {
		this.levelType = levelType;
	}
	public String getDistinguishToken() {
		return distinguishToken;
	}
	public void setDistinguishToken(String distinguishToken) {
		this.distinguishToken = distinguishToken;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime
				* result
				+ ((distinguishToken == null) ? 0 : distinguishToken.hashCode());
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ConsultEntity other = (ConsultEntity) obj;
		if (distinguishToken == null) {
			if (other.distinguishToken != null)
				return false;
		} else if (!distinguishToken.equals(other.distinguishToken))
			return false;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
}
