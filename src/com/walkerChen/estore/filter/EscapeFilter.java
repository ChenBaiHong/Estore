package com.walkerChen.estore.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by ChenBaiHong on 9/23/2016.
 */
@WebFilter("/EscapeFilter")
public class EscapeFilter implements Filter {

    public EscapeFilter() {
    }
    public void destroy() {
    }
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        MyRequest myRequest = new MyRequest(request);
        chain.doFilter(myRequest , response);
    }
    class MyRequest extends HttpServletRequestWrapper {
        private HttpServletRequest request;
        public MyRequest(HttpServletRequest request) {
            super(request);
            this.request=request;
        }

        @Override
        public String getParameter(String name) {
            String value =request.getParameter(name);
            return filter(value) ;
        }
        //Tomcat 8.0/webapps/examples/WEB-INF/classes/util 。  该方法过滤网页特殊字符现成代码位置
        public String filter(String message) {

            if (message == null)
                return (null);

            char content[] = new char[message.length()];
            message.getChars(0, message.length(), content, 0);
            StringBuilder result = new StringBuilder(content.length + 50);
            for (int i = 0; i < content.length; i++) {
                switch (content[i]) {
                    case '<':
                        result.append("&lt;");
                        break;
                    case '>':
                        result.append("&gt;");
                        break;
                    case '&':
                        result.append("&amp;");
                        break;
                    case '"':
                        result.append("&quot;");
                        break;
                    default:
                        result.append(content[i]);
                }
            }
            return (result.toString());
        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}