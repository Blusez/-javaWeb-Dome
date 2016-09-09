package com.sosee.filter;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
public class LoginCheckFilter implements Filter ,Serializable{

	private String redirectURL;
	private FilterConfig config;
	private List<String> notCheckURLList; 
	
	@Override
	public void destroy() {
		this.config=null;
		this.redirectURL=null;
		this.notCheckURLList=null;
	}

	/**
	 * 
	 * @param request
	 * @return
	 */
	private boolean checkRequestURIInNotFilterList(HttpServletRequest request){
		String uri = request.getServletPath();//+(request.getPathInfo()==null?"":request.getPathInfo());
		return notCheckURLList.contains(uri);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest hRequest = (HttpServletRequest)request;
		HttpServletResponse hResponse = (HttpServletResponse)response;
		//判断当前访问的页面是否在不检查列表中 session==null
	
		HttpSession session = hRequest.getSession();
		if(!checkRequestURIInNotFilterList(hRequest) && session.getAttribute("user")==null){
			hResponse.sendRedirect(hRequest.getContextPath()+redirectURL);
			return;
		}
		chain.doFilter(request, response);
	}

	/**
	 * 
	 * @param notCheckURL
	 * @return
	 */
	private List<String> getNotCheckURLList(String notCheckURL){
		List<String> urlList = new ArrayList<String>();
		
		String[] sArray = notCheckURL.split(";");
		for(String s:sArray){
		   urlList.add(s);
		}
		
		return urlList;
	}
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		this.config = config;
		this.redirectURL = config.getInitParameter("redirectURL");
		String notCheckURL = config.getInitParameter("notCheckURL");
		if(notCheckURL!=null){
			this.notCheckURLList = getNotCheckURLList(notCheckURL);
		}
		
	}

}
