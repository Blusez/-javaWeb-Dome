package com.sosee.sys.interceptor;

import java.util.Map;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.sosee.util.Constants;

@SuppressWarnings("serial")
public class AuthorityInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		Object user = session.get(Constants.USER);
		if (user != null) {
			return invocation.invoke();
		}
		ctx.put("tip", "您还没有登陆");
		return Action.LOGIN;
	}
}
