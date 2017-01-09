package com.walkerChen.estore.controlServlet;

import com.walkerChen.estore.businessService.BusinessServiceImpl;
import com.walkerChen.estore.commonUtils.PrivilegeUtils;
import com.walkerChen.estore.commonUtils.ReflectUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Created by cbh12 on 9/26/2016.
 */
@WebServlet("/BackstageLogonServlet.servlet")
@SuppressWarnings("all")
public class BackstageLogonServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String method = request.getParameter("method");
        if(method!=null){
            ReflectUtils.invokeMethodServlet(this.getClass(),method,request,response);
        }
    }
    public void defaultMain(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        request.getRequestDispatcher("/WEB-INF/backstage/defaultMain.jsp").forward(request,response);
    }
    public void adminLogon(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        request.getRequestDispatcher("/WEB-INF/backstage/admin/adminLogon.jsp").forward(request,response);
    }
    public void allocationPrivilege(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        List<String> authorityNames= PrivilegeUtils.fetchBusinessAuthorityNameOfChinese(BusinessServiceImpl.class);
        request.setAttribute("authorityNames",authorityNames);
        request.getRequestDispatcher("/WEB-INF/backstage/privilege/allocationPrivilege.jsp").forward(request,response);
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request , response);
    }
}
