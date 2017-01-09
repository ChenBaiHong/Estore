package com.walkerChen.estore.controlServlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.commonUtils.ReflectUtils;

import java.io.IOException;

/**
 * Created by cbh12 on 9/27/2016.
 */
@WebServlet("/UserServlet.servlet")
@SuppressWarnings("all")
public class UserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	String method = request.getParameter("method");
        System.out.println(method);
        if(method!=null){
            ReflectUtils.invokeMethodServlet(this.getClass(),method,request,response);
        }
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request , response);
    }
}
