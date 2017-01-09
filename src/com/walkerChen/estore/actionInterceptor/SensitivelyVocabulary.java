package com.walkerChen.estore.actionInterceptor;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import com.opensymphony.xwork2.util.ValueStack;
import com.walkerChen.estore.filter.SensitiveVocabularyFilter;

@SuppressWarnings("serial")
public class SensitivelyVocabulary extends MethodFilterInterceptor {
	List<String> bandVocabulary = new ArrayList<String>();  // 安排的对应号是 1 的就是禁止词汇
    List<String>reviewVocabulary = new ArrayList<String>();  //安排的对应号是 2 的就是审核词汇
    List<String>replaceVocabulary = new ArrayList<String>(); //安排的对应号是 3 的就是替换词汇
	@Override
	public void init() {
		String sensitiveVocabularyPath = SensitiveVocabularyFilter.class.getClassLoader().getResource("com/walkerChen/sensitiveVocabulary").getPath();
		sensitiveVocabularyPath = sensitiveVocabularyPath.replaceAll("%20", " ");
		File[] fileList = new File(sensitiveVocabularyPath).listFiles();
        for(int i = 0 ; fileList!=null && i<fileList.length;i++){
            File file = fileList[i];
            if(!file.getName().endsWith(".txt")){
                continue;
            }
            try {
                BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));//解决乱码问题
                String line = null;
                while( (line = br.readLine())!=null){
                	String lineVocabulary = new String(line);
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

	@Override
	protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
		 HttpServletRequest request = ServletActionContext.getRequest();//获取请求到的参数
		ValueStack valueStack = (ValueStack) request.getAttribute(ServletActionContext.STRUTS_VALUESTACK_KEY);
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
	                	valueStack.set("bandVocabulary",value);
	                    return actionInvocation.invoke();
	                }else {
	                    continue;
	                }
	            }
	            //审视词汇
	            for(String regex : reviewVocabulary){
	                Pattern pattern = Pattern.compile(regex);
	                Matcher matcher = pattern.matcher(value);
	                //匹配request.getParameter(name)获取到的值中是否包含这个正则形态化后的审核词汇
	                if(matcher.find()){
	                    //一个值里可能有多个相同的敏感词汇，最终归类成组
	                    String regexByValue = matcher.group();
	                    value = value.replaceAll(regex, "<font style='color:red; front-weight:blod ;'>"+regexByValue+" <font>");
	                    valueStack.set("reviewVocabulary",value);
	                    return actionInvocation.invoke();
	                }
	            }
	            //替换词汇
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
	                    valueStack.set("replaceVocabulary",value);
	                    return actionInvocation.invoke();
	                }
	            }
	        }
		return actionInvocation.invoke();
	}
	
}
