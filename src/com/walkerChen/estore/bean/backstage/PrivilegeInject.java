package com.walkerChen.estore.bean.backstage;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

/**
 * Created by ChenBaiHong on 9/23/2016.
 * 权限
 */
@Retention(RetentionPolicy.RUNTIME)
public @interface PrivilegeInject {
    public String chineseValue();
    public String englishKey();
}
