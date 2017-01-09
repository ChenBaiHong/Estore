package com.walkerChen.estore.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */

/**
 * Servlet Filter implementation class SensitiveVocabularyFilter
 */
@WebFilter("/SensitiveVocabularyFilter")
public class SensitiveVocabularyFilter implements Filter {
    List<String> bandVocabulary = new ArrayList<String>();  // 安排的对应号是 1 的就是禁止词汇
    List<String>reviewVocabulary = new ArrayList<String>();  //安排的对应号是 2 的就是审核词汇
    List<String>replaceVocabulary = new ArrayList<String>(); //安排的对应号是 3 的就是替换词汇

    //加载初始化，审核词汇，禁止词汇,替换词汇
    public void init(FilterConfig fConfig) throws ServletException {
        String sensitiveVocabularyPath = SensitiveVocabularyFilter.class.getClassLoader().getResource("com/walkerChen/sensitiveVocabulary").getPath();
        File[] fileList = new File(sensitiveVocabularyPath).listFiles();
        for(int i = 0 ; fileList!=null && i<fileList.length;i++){
            File file = fileList[i];
            if(!file.getName().endsWith(".txt")){
                continue;
            }
            try {
                BufferedReader br = new BufferedReader(new FileReader(file));
                String lineVocabulary = null;
                while( (lineVocabulary = br.readLine())!=null){
                    String[] words = lineVocabulary.split("\\|");// | 分割敏感词汇和对应号的分割标识
                    if(words.length==2){
                        if(words[1].trim().equals("1")){
                            bandVocabulary.add(words[0].trim());
                        }if(words[1].trim().equals("2")){
                            reviewVocabulary.add(words[0].trim());
                        }if(words[1].trim().equals("3")){
                            replaceVocabulary.add(words[0].trim());
                        }
                    }
                }
                br.close();
            } catch (Exception e) {
                throw new ExceptionInInitializerError(e);
            }
        }
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        Enumeration<String> enumeration = request.getParameterNames();
        while(enumeration.hasMoreElements()){
            String name = enumeration.nextElement();
            String value = request.getParameter(name);
            value=value.trim().replaceAll(" +", "");//去除参数值的里面包含的空格，正则表达式“ +”（空格+）去除数值里一个或两个空格
            //将禁止词汇形化成正则表达式，以比较获取的参数值中是否存在禁止词汇
            for(String regex : bandVocabulary ){
                Pattern patern = Pattern.compile(regex);
                Matcher matcher = patern.matcher(value);
                if(matcher.find()){
                    request.setAttribute("message", "you input statement include illegality  vocabulary ! please all over again  input");
                    request.getRequestDispatcher("/message.jsp").forward(request, response);
                    return ;
                }else {
                    continue;
                }
            }
        }
        chain.doFilter(new MyRequest(request), response);
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
            if(value == null){
                return null;
            }
            for(String regex : reviewVocabulary){
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(value);
                //匹配request.getParameter(name)获取到的值中是否包含这个正则形态化后的审核词汇
                if(matcher.find()){
                    //一个值里可能有多个相同的敏感词汇，最终归类成组
                    String regexByValue = matcher.group();
                    value = value.replaceAll(regex, "<font style='color:red; front-weight:blod ;'>"+regexByValue+" <font>");
                }
            }
            for(String regex : replaceVocabulary){
                Pattern pattern = Pattern.compile(regex);
                Matcher matcher = pattern.matcher(value);
                if(matcher.find()){
                    String regexByValue = matcher.group();
                    String repalceStar = null;
                    for(int i = 0 ; i<regexByValue.length();i++){
                        repalceStar +="*";
                    }
                    value = value.replaceAll(regexByValue, repalceStar);
                }
            }
            return value;
        }
    }
    public void destroy() {}

}
