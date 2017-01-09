package com.walkerChen.estore.Test;

import java.util.List;

import org.junit.Test;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.bean.backstage.Role;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.businessService.BusinessServiceImpl;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.Md5Utils;
import com.walkerChen.estore.commonUtils.PrivilegeUtils;
import com.walkerChen.estore.commonUtils.WebUtils;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.AdminPageBean;
import com.walkerChen.estore.dao.pagingBeanOfAdmin.PageInfoOfAdmin;
import com.walkerChen.estore.dao.pagingBeanOfRole.PageInfo;
import com.walkerChen.estore.dao.pagingBeanOfRole.RolePageBean;

/**
 * Created by cbh12 on 9/28/2016.
 */
@SuppressWarnings("all")
public class TestPlayground
{
    public static void main(String[] args){
        BusinessServiceImpl businessService = new BusinessServiceImpl();
        List<String> authoritys = PrivilegeUtils.fetchBusinessAuthorityNameOfChinese(BusinessService.class);
        for(String authority : authoritys){
            System.out.println(authority);
        }
        WebUtils webUtils = new WebUtils();
        String id= webUtils.generateUniqueFilename("authority");
        String id2= webUtils.generateUniqueFilename("authority");
        System.out.println(id2);
        System.out.println(id);
    }
	public void test()throws Exception{
	 BusinessService businessService = DaoFactory.newInstance()
				.createDataAccessibleFactoryByInterface(
						BusinessService.class);
	 PageInfoOfAdmin pageInfo = new PageInfoOfAdmin();
	 pageInfo.setCurrentPage(1);
		AdminPageBean adminPageBean = businessService.
				queryAdmiPageBean(pageInfo);
		ObjectMapper om = new ObjectMapper();
		String pageBean = om.writeValueAsString(adminPageBean);
		System.out.println(pageBean);
	}
@Test
 	public void test2(){
 		System.out.println(Md5Utils.md5("superAdmin"));
 	}
}
