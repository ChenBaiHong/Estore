package com.walkerChen.estore.commonUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.Method;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */
public class ReflectUtils {
    public  static <T>void invokeMethodServlet(Class<T> clazz  ,String methodName, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            Method method =clazz.getDeclaredMethod(methodName , HttpServletRequest.class,HttpServletResponse.class);
            method.setAccessible(true);
            method.invoke(clazz.newInstance(),request ,response);
        }catch(Exception e){
            request.setAttribute("message" ,"appear reflect error <font style='color:red'>"+e+"</font>");
            request.getRequestDispatcher("/message.jsp").forward(request,response);
        }
    }
}
