package com.walkerChen.estore.controlServlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.backstage.Privilege;
import com.walkerChen.estore.businessFactory.DaoAuthorityFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.ReflectUtils;
import com.walkerChen.estore.commonUtils.WebUtils;

/**
 * Created by cbh12 on 9/27/2016.
 */
@WebServlet("/PrivilegeServlet.servlet")
@SuppressWarnings("all")
public class PrivilegeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method=request.getParameter("method");
        System.out.println(method);
        if(method !=null){
            ReflectUtils.invokeMethodServlet(this.getClass(),method , request , response);
        }
    }

    /**
     * 侦察到如果是超级管理员直接放行
     *      针对数据库分配权限
     *      ajax操作方法体
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void detectionPrivilege(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        response.setContentType("text/javascript");
        try{
           Admin admin = (Admin) request.getSession().getAttribute("admin");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("{\"authorityMessage\":");
            if(admin!=null){
            	if("superAdmin".equals(admin.getAdminname())){
                    stringBuilder.append("\"yes\"}");
                }else{
                    stringBuilder.append("\"no\"}");
                }
            }else{
            	stringBuilder.append("\"noIdentity\"}");
            }
            System.out.println(admin+" "+stringBuilder.toString());
            response.getWriter().print(stringBuilder.toString());
        }catch(Exception e){
        	e.printStackTrace();
            String handlerError = "{\"authorityMessage\":\"error\"}";
            response.getWriter().print(handlerError);
        }
    }

    /**
     *  侦察到如果是超级管理员直接放行
     *      针对是否相数据添库加定义的权限
     *      ajax操作方法体
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void additionalPrivilege(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory((Admin) request.getSession().getAttribute("admin"));
            BusinessService businessService = authorityFactory.createDaoAuthorityFactoryByInterface(BusinessService.class);
            String authority = request.getParameter("authority");
            String description = request.getParameter("description");
            Privilege privilege= businessService.searchPrivilege(authority);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.append("{\"authorityMessage\":");
            if(privilege!=null){
               // throw new SecurityException("不要重复添加权限！");
                stringBuilder.append("\"addRepeatAuthority\"}");
            }else{
                WebUtils webUtils = new WebUtils();
                String id= webUtils.generateUnique();
                Privilege privilegel = new Privilege(authority);
                privilegel.setId(id);
                privilegel.setDescription(description);
                businessService.addPrivilege(privilegel);
                stringBuilder.append("\"addAuthority\"}");
            }
            JdbcUtils.commitTranscation();
            response.getWriter().print(stringBuilder.toString());
        }catch(Exception e){
            e.printStackTrace();
            String builderStatement = "{\"authorityMessage\":\"insufficientPrivilege\"}";
            response.getWriter().print(builderStatement);
        }finally{
            JdbcUtils.closebleTranscation();
        }
    }

    /**
     * 检查管理员是否具备查看数据库权利的权限
     *          ajax操作方法体
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void findAllPrivilegeCheck(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        WebUtils webUtils = new WebUtils();
        webUtils.fromWebAuthorityCheck(request, response);
    }

    /**
     *  普通方法体
     *      ergodicPrivilege
     *      遍历出所有的权限到jsp页面
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void searchPrivilege(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try{
            DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory((Admin) request.getSession().getAttribute("admin"));
            BusinessService businessService = authorityFactory.createDaoAuthorityFactoryByInterface(BusinessService.class);
            List<Privilege> privilegeList= businessService.findAllPrivilege();
            JdbcUtils.commitTranscation();
            request.setAttribute("privilegeList",privilegeList);
            request.getRequestDispatcher("/WEB-INF/backstage/privilege/ergodicPrivilege.jsp").forward(request , response);
        }catch(Exception e){
        	e.printStackTrace();
            request.getRequestDispatcher("/500.jsp").forward(request , response);
        }finally{
            JdbcUtils.closebleTranscation();
        }
    }

    /**
     * ajax操作方法体
     *      只针对权限的描述
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void editDescription(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/javascript");
        try{
            DaoAuthorityFactory authorityFactory = new DaoAuthorityFactory((Admin) request.getSession().getAttribute("admin"));
            BusinessService businessService = authorityFactory.createDaoAuthorityFactoryByInterface(BusinessService.class);
            String privilegeId = request.getParameter("privilegeId");
            String description = request.getParameter("description");
            Privilege privilege = businessService.findPrivilege(privilegeId);
            privilege.setDescription(description);
            businessService.updatePrivilege(privilege);
            JdbcUtils.commitTranscation();
            String builderStatement = "{\"authorityMessage\":\"yes\"}";
            response.getWriter().print(builderStatement);
        }catch(Exception e){
        	e.printStackTrace();
            String builderStatement = "{\"authorityMessage\":\"no\"}";
            response.getWriter().print(builderStatement);
        }finally{
            JdbcUtils.closebleTranscation();
        }
    }
    /**
     * ajax操作方法体
     *      只针对权限的从数据库删除
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    private void deletePrivilege(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
    	String privilegeId = request.getParameter("privilegeId");
    	WebUtils webUtils = new WebUtils();
        webUtils.fromWebAuthorityDeleteCheck(request, response, "deletePrivilege", privilegeId);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request ,response);
    }
}
