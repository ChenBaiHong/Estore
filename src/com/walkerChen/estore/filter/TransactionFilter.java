package com.walkerChen.estore.filter;

import com.walkerChen.estore.commonUtils.JdbcUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */
/**
 * Servlet Filter implementation class TransactionFilter
 */
@WebFilter("/TransactionFilter")
public class TransactionFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        try{
            //拦截下来后：获取连接、开启事务、并把连接绑定到当前线程
            //JdbcUtils.StartTransaction();   //JdbcUtils.getConnection();
            chain.doFilter(request, response);

            //获取当前线程上绑定的连接，提交事务，并关闭链接，释放连接与当前线程的绑定
            JdbcUtils.commitTranscation();
        }finally{
            JdbcUtils.closebleTranscation();
        }

    }
    public void init(FilterConfig fConfig) throws ServletException {

    }

    public void destroy() {

    }
}
