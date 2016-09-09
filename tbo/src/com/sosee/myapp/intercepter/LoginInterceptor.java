package com.sosee.myapp.intercepter;

import org.apache.commons.lang3.StringUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LoginInterceptor extends AbstractInterceptor{

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		String comname=(String)invocation.getInvocationContext().getSession().get("comname");
		if(StringUtils.isEmpty(comname)){
			return "loginin";
		}
		return invocation.invoke();
	}
      
}
