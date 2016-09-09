package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.dao.LoginLogDao;
import com.sosee.sys.user.pojo.LoginLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 下午01:39:36
 * 功能:用户serviceImpl
 */
public class LoginLogServiceImpl implements LoginLogService {
	
	LoginLogDao loginLogDao;

	public LoginLogDao getLoginLogDao() {
		return loginLogDao;
	}

	public void setLoginLogDao(LoginLogDao loginLogDao) {
		this.loginLogDao = loginLogDao;
	}

	@Override
	public void add(LoginLog loginLog) {
		loginLogDao.create(loginLog); 
	}

	@Override
	public void delete(String[] idArray) {
		for (String id : idArray) {
			loginLogDao.delete(loginLogDao.queryById(id));
		}
	}
	
	@Override
	public void deleteAll() {
		loginLogDao.executeUpdate("delete from LoginLog", null);
	}

	@Override
	public List<LoginLog> getLoginLogList() {
		String hql="from LoginLog order by loginTime desc";
		return loginLogDao.queryAll(hql);
	}

	@Override
	public List<LoginLog> getLoginLogList(String hql, Page page) {
		String shql="from LoginLog where 1=1 "+hql+" order by loginTime desc";
		if(page!=null && !page.equals("")){
			return loginLogDao.queryForList(shql, page);
		}else{
			return loginLogDao.queryAll(shql);
		}
	}

	@Override
	public LoginLog getValue(String id) {
		return loginLogDao.queryById(id);
	}

	@Override
	public void update(LoginLog loginLog) {
		loginLogDao.update(loginLog);
	}

	
}
