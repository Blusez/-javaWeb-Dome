package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.dao.OperateLogDao;
import com.sosee.sys.user.pojo.OperateLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 下午01:39:36
 * 功能:用户serviceImpl
 */
public class OperateLogServiceImpl implements OperateLogService {

	OperateLogDao operateLogDao;
	
	public OperateLogDao getOperateLogDao() {
		return operateLogDao;
	}

	public void setOperateLogDao(OperateLogDao operateLogDao) {
		this.operateLogDao = operateLogDao;
	}

	@Override
	public void add(OperateLog operateLog) {
		operateLogDao.create(operateLog);
	}

	@Override
	public void delete(String[] idArray) {
		for(String id:idArray){
			operateLogDao.delete(operateLogDao.queryById(id));
		}
	}
	
	@Override
	public void deleteAll() {
		operateLogDao.executeUpdate("delete from OperateLog",null);
	}

	@Override
	public List<OperateLog> getLoginLogList() {
		String hql="from OperateLog order by createTime desc";
		return operateLogDao.queryAll(hql);
	}

	@Override
	public List<OperateLog> getLoginLogList(String hql, Page page) {
		String shql="from OperateLog where 1=1 "+hql+" order by createTime desc";
		if(page!=null && !page.equals("")){
			return operateLogDao.queryForList(shql,page);
		}else{
			return operateLogDao.queryAll(shql);
		}
	}

	@Override
	public OperateLog getValue(String id) {
		return operateLogDao.queryById(id);
	}

	@Override
	public void update(OperateLog operateLog) {
		operateLogDao.update(operateLog);
	}
	
}
