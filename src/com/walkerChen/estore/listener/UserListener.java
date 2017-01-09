package com.walkerChen.estore.listener;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;

import com.walkerChen.estore.bean.backstage.Admin;
import com.walkerChen.estore.bean.substance.TempUser;
import com.walkerChen.estore.bean.substance.User;
@SuppressWarnings("all")
@WebListener
public class UserListener implements HttpSessionAttributeListener {
	/**
	 * 添加session属性值监听
	 */
	 public void attributeAdded(HttpSessionBindingEvent sessionEvent)  { 
		Object object = sessionEvent.getValue();
		Map<String , HttpSession> logonSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("logonSessioinMap");
		
		//创建登录用户所依赖的session
		if(logonSessioinMap==null){
    		logonSessioinMap = new LinkedHashMap<String , HttpSession>();
    	}
    	if(object instanceof User){
    		User user = (User) object;
    		logonSessioinMap.put(user.getId(), sessionEvent.getSession());
    		sessionEvent.getSession().getServletContext().setAttribute("logonSessioinMap", logonSessioinMap);
    	}
    	Map<String , HttpSession> tempSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("tempSessioinMap");
    	// 创建临时用户的所依赖的session
    	if(tempSessioinMap==null){
    		tempSessioinMap = new LinkedHashMap<String , HttpSession>();
    	}
    	if(object instanceof TempUser){
    		TempUser tempUser = (TempUser) object;
    		tempSessioinMap.put(tempUser.getTempId(), sessionEvent.getSession());
    		sessionEvent.getSession().getServletContext().setAttribute("tempSessioinMap", tempSessioinMap);
    	}
    	//在线管理员的人数
    	Map<String , HttpSession> adminSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("adminSessioinMap");
    	// 创建管理员的所依赖的session
    	if(adminSessioinMap==null){
    		adminSessioinMap = new LinkedHashMap<String , HttpSession>();
    	}
    	if(object instanceof Admin){
    		Admin admin = (Admin) object;
    		adminSessioinMap.put(admin.getId(), sessionEvent.getSession());
    		sessionEvent.getSession().getServletContext().setAttribute("adminSessioinMap", adminSessioinMap);
    	}
    }
	 /**
	  * session 属性值移除监听
	  */
    public void attributeRemoved(HttpSessionBindingEvent sessionEvent)  { 
    	Object object = sessionEvent.getValue();
		Map<String , HttpSession> logonSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("logonSessioinMap");
		Map<String , HttpSession> tempSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("tempSessioinMap");
		Map<String , HttpSession> adminSessioinMap = (Map<String, HttpSession>) sessionEvent.getSession().getServletContext().getAttribute("adminSessioinMap");
    	
		//创建登录用户所依赖的session
		if(logonSessioinMap!=null && object instanceof User){
    		User user = (User) object;
    		if(user!= null){
    			logonSessioinMap.remove(user.getId());
        		sessionEvent.getSession().getServletContext().setAttribute("logonSessioinMap", logonSessioinMap);
    		}
    	}
    	// 创建临时用户的所依赖的session
    	if(tempSessioinMap!=null && object instanceof TempUser){
    		TempUser tempUser = (TempUser) object;
    		if(tempUser!=null){
    			tempSessioinMap.remove(tempUser.getTempId());
        		sessionEvent.getSession().getServletContext().setAttribute("tempSessioinMap", tempSessioinMap);
    		}
    	}
    	// 创建管理员的所依赖的session
    	if(adminSessioinMap!=null && object instanceof Admin){
    		Admin admin = (Admin) object;
    		if(admin!=null){
    			adminSessioinMap.remove(admin.getId());
    			sessionEvent.getSession().getServletContext().setAttribute("adminSessioinMap", adminSessioinMap);
    		}
    	}
    }
    /**
     * session 属性值替换监听
     */
    public void attributeReplaced(HttpSessionBindingEvent sessionEvent)  { 
    }
	
}
