package com.walkerChen.estore.controlServlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.walkerChen.estore.commonUtils.IdenticalImage;
import com.walkerChen.estore.commonUtils.ReflectUtils;

/**
 * Servlet implementation class VerifyCodeServlet
 */
@SuppressWarnings("all")
@WebServlet("/VerifyCodeServlet.servlet")
public class VerifyCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String method = request.getParameter("method");
        System.out.println(method);
        if(method!=null){
            ReflectUtils.invokeMethodServlet(this.getClass(),method,request,response);
        }
	}
	 private void verifyCodeImage(HttpServletRequest request, HttpServletResponse response) throws IOException{
		//告知浏览器设置响应头
		response.setContentType("image/jpeg");
		//控制浏览器不要缓存
		response.setDateHeader("expries", -1);
		//兼容其它浏览器不要缓存
		response.setHeader("Cache-Control", "no-cache");
		int width = 93 , height=35;
		IdenticalImage identicalImage = new IdenticalImage();
		String verifyCode = identicalImage.generateVerifyCode(4);
		request.getSession().setAttribute("verifyCode", verifyCode);
		identicalImage.outputImage(width , height, response.getOutputStream() , verifyCode);
	 }
	 
	 private void verifyIsCorrect (HttpServletRequest request, HttpServletResponse response) throws IOException{
		String verifyCode =  request.getParameter("verifyCode");
		String verifyCode_ = (String) request.getSession().getAttribute("verifyCode");
		StringBuilder sb = new StringBuilder("{\"message\":");
		System.out.println(verifyCode+"="+verifyCode_);
		if(verifyCode!=null && verifyCode.equalsIgnoreCase(verifyCode_)){
			sb.append("\"yes\"}");
		}else{
			sb.append("\"no\"}");
		}
		response.getWriter().println(sb.toString());
	 }
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request , response);
	}

}
