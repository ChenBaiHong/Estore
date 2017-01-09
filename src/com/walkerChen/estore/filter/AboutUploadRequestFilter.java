package com.walkerChen.estore.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.dispatcher.StrutsRequestWrapper;

import com.walkerChen.estore.commonUtils.WebUtils;

/**
 * Servlet Filter implementation class AboutUploadRequestFilter
 */
@WebFilter("/AboutUploadRequestFilter")
public class AboutUploadRequestFilter implements Filter {
	/**
	 * 初始化是生成本地访问ip地址二维码
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String webPath = fConfig.getServletContext().getContextPath();
		try {
			WebUtils.generateQrCodeImg(webPath, fConfig.getServletContext().getRealPath("/inlineConsultPlug/images"));
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	public void destroy() {
	}

	/**
	 * 解决为甚么servlet中 fileUploadFile(request)取不到jsp form表单的信息
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request  = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		/**
		 * StrutsRequestWrapper对request强转
		 */
		chain.doFilter(new StrutsRequestWrapper(request),response);
	}
}
