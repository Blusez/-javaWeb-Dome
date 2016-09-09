package com.sosee.sys.user.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.LoginLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:11:43
 * 功能:登录日志DaoImpl
 */
@SuppressWarnings("unchecked")
public class LoginLogDaoImpl extends AbstractBaseDao<LoginLog> implements LoginLogDao {

	public LoginLogDaoImpl() {
		super(LoginLog.class);
	}
}
