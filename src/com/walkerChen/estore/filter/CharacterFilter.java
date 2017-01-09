package com.walkerChen.estore.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */
/**
 * Servlet Filter implementation class CharacterFilter
 */
@WebFilter("/CharacterFilter")
public class CharacterFilter implements Filter {




    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        response.setHeader("context", "html/text;charset=UTF-8");
        response.setContentType("html/text;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
    class MyRequest extends HttpServletRequestWrapper {
        HttpServletRequest request;
        public MyRequest(HttpServletRequest request) {
            super(request);
            this.request = request;
        }
        @Override
        public String getParameter(String name) {
            String value = request.getParameter(name);
            if(value== null){
                return null;
            }
            //主要解决的是get提交方式的，文本乱码问题
            if(request.getMethod().equalsIgnoreCase("get")){
                try {
                    value = new String( value.getBytes("utf-8"));
                    return value;
                } catch (UnsupportedEncodingException e) {
                    throw new RuntimeException(e);
                }
            }
            return value;
        }
    }
    public void init(FilterConfig fConfig) throws ServletException {}
    public void destroy() {}
}
