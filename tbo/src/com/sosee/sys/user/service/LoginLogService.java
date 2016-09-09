package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.pojo.LoginLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:13:45
 * 功能:登录日志service
 */
public interface LoginLogService {
	LoginLog getValue(String id);
	List<LoginLog> getLoginLogList();
	List<LoginLog> getLoginLogList(String hql,Page page);
	void add(LoginLog loginLog);
	void update(LoginLog loginLog);
	void delete(String[] idArray);
	void deleteAll();
}
