package com.walkerChen.estore.bean.backstage;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by ChenHaiHong on 9/23/2016.
 */
public class Admin{
    private String id;
    private String adminname;
    private String password;
    private String imgLocal;
    private String description;
    private Set<Role> roleSet = new HashSet<Role>();
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAdminname() {
        return adminname;
    }

    public void setAdminname(String adminname) {
        this.adminname = adminname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImgLocal() {
		return imgLocal;
	}

	public void setImgLocal(String imgLocal) {
		this.imgLocal = imgLocal;
	}

	public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Role> getRoleSet() {
        return roleSet;
    }

    public void setRoleSet(Set<Role> roleSet) {
        this.roleSet = roleSet;
    }

	@Override
	public String toString() {
		return "Admin [id=" + id + ", adminname=" + adminname + ", password="
				+ password + ", imgLocal=" + imgLocal + ", description="
				+ description + ", roleSet=" + roleSet + "]";
	}

   
}
