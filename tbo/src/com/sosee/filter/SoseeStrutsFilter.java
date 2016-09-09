package com.sosee.filter;

import java.util.regex.Pattern;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

public class SoseeStrutsFilter extends StrutsPrepareAndExecuteFilter {

	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) {
		HttpServletRequest request = (HttpServletRequest) req;
		String url = request.getRequestURI();
		String regx="^"+request.getContextPath()+"/ueditor/jsp/.+jsp";
		
		try{
			if (Pattern.compile(regx).matcher(url).find() ) {
				chain.doFilter(req, res);
			} else {
				super.doFilter(req, res, chain);
			}
		}catch(Exception e){
			System.out.println("Exception in SoseeStrutsFilter");
			e.printStackTrace();
		}
	}
}
