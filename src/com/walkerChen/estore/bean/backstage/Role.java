package com.walkerChen.estore.bean.backstage;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */
public class Role {
    private String id;
    private String name;
    private String description;
    private Set<Privilege> privilegeSet = new HashSet<Privilege>();

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<Privilege> getPrivilegeSet() {
        return privilegeSet;
    }

    public void setPrivilegeSet(Set<Privilege> privilegeSet) {
        this.privilegeSet = privilegeSet;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", privilegeSet=" + privilegeSet +
                '}';
    }
}
