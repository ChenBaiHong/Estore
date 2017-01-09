package com.walkerChen.estore.commonUtils;

import java.security.MessageDigest;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sun.misc.BASE64Encoder;

import com.walkerChen.estore.bean.substance.User;

/**
 * Created by cbh12 on 9/26/2016.
 */
public class ServletUtils {
    public void userAutoLogon(User user , int deadline ,HttpServletRequest request, HttpServletResponse response){
		 response.setHeader("content-type", "text/html;charset=UTF-8"); 
		 response.setContentType("text/html;charset=UTF-8");
         Cookie cookie = makeCookie(user,deadline);
         cookie.setMaxAge(deadline);//设置最大缓存时间
         cookie.setPath(request.getContextPath());//路径就是当前web工程
        // JOptionPane.showMessageDialog(null, cookie.getValue()+"================================>怀抱九州，拦明月！");
         response.addCookie(cookie);
    }
    public void userLogout(HttpServletRequest request , HttpServletResponse response){
    	request.getSession(false).removeAttribute("user");
    	request.removeAttribute("shoppingCart");
    	response.setHeader("content-type", "text/html;charset=UTF-8"); 
		response.setContentType("text/html;charset=UTF-8");
		Cookie cookie = new Cookie("autoLogon","");
		cookie.setMaxAge(1000);//设置最大缓存时间
        cookie.setPath(request.getContextPath());//路径就是当前web工程
        response.addCookie(cookie);
    }
    private Cookie makeCookie(User user , int deadline){
        Long currentTime = System.currentTimeMillis();
        String finalCookieEncipherValue = user.getId()+":"+(currentTime+deadline)+":"+
                                          encipherValue(currentTime+deadline,user.getUsername(),user.getPassword());
        return new Cookie("autoLogon",finalCookieEncipherValue);
    }
    //提高加密方法的复用性
    public String encipherValue(Long deadline,String...arguments){
        try{
            StringBuilder stringBuilder = new StringBuilder();
            for(int i = 0 ; arguments!=null && i<arguments.length;i++){
                stringBuilder.append(arguments[i]+":");
            }
            if(deadline==null){
                stringBuilder.deleteCharAt(stringBuilder.length()-1);
            }else{
                stringBuilder.append(deadline);
            }
            MessageDigest messageDigest = MessageDigest.getInstance("md5");
            byte[] md5Encipher = messageDigest.digest(stringBuilder.toString().getBytes());
            BASE64Encoder base64Encoder = new BASE64Encoder();
            return base64Encoder.encode(md5Encipher);
        }catch(Exception e){
            throw new RuntimeException(e);
        }
    }
}
