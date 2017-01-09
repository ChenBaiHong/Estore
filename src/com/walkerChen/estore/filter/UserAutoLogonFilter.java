package com.walkerChen.estore.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.ServletResponseWrapper;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.struts2.dispatcher.StrutsRequestWrapper;

import com.walkerChen.estore.bean.substance.User;
import com.walkerChen.estore.businessFactory.DaoFactory;
import com.walkerChen.estore.businessService.BusinessService;
import com.walkerChen.estore.commonUtils.JdbcUtils;
import com.walkerChen.estore.commonUtils.ServletUtils;

/**
 * Created by cbh12 on 9/26/2016.
 */
@WebFilter("/UserAutoLogonFilter")
@SuppressWarnings("all")
public class UserAutoLogonFilter implements Filter {
   private BusinessService businessService=null;
    public void init(FilterConfig config)
            throws ServletException {
    	businessService=DaoFactory.newInstance().createDataAccessibleFactoryByInterface(BusinessService.class);
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
            throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //1. 先检查用户是否已登陆，没登陆才自动登陆
        User user  = (User)request.getSession().getAttribute("user");
        if(user != null){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return;
        }
        //2. 没登陆，再执行自动登陆逻辑
        Cookie cookie=null;
        Cookie[] cookies = request.getCookies();
        for(int i = 0 ;cookies!=null && i<cookies.length;i++){
            if(cookies[i].getName().equals("autoLogon")){
                cookie=cookies[i];
                break;
            }
        }
        //2.1 看用户有没有带自动登陆的cookie
        if(cookie==null){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        String encipherCookieValue = cookie.getValue();
        if(encipherCookieValue==null){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        //2.2 用户带了自动登陆的cookie，检查cookie的有效性
        String[] arraysValue = encipherCookieValue.split(":");
        if(arraysValue.length!=3){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        String id = arraysValue[0].trim();
        User myUser = businessService.findUser(id);
        if(myUser==null){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        //2.3 cookie有效，检查cookie的时间有效性
        String deadlineStr = arraysValue[1];
        long deadline = Long.parseLong(deadlineStr);
        if(System.currentTimeMillis()>deadline){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        //2.4 检查是否与加密的cookie值相同， 以防cookie的时间被更改过
        String encipherValue = arraysValue[2].trim();
        String compareValue = new ServletUtils().encipherValue(deadline,myUser.getUsername(),myUser.getPassword());
        //JOptionPane.showMessageDialog(null, (encipherCookieValue.equals(compareValue))+"怀抱九州，拦明月！");
        if(!encipherValue.equals(compareValue)){
            chain.doFilter(new StrutsRequestWrapper(request), response);
            return ;
        }
        //3 执行登陆
        request.getSession().setAttribute("user", myUser);//用户是否已登陆，没登陆才自动登陆,因此session的user有的还回去！
        //JOptionPane.showMessageDialog(null, myUser+"怀抱九州，拦明月！");
        chain.doFilter(new StrutsRequestWrapper(request), response);
    }
    public void destroy() {
    }
}
