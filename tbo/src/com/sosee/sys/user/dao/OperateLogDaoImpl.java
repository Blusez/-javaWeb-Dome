package com.sosee.sys.user.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.OperateLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:11:43
 * 功能:操作日志DaoImpl
 */
@SuppressWarnings("unchecked")
public class OperateLogDaoImpl extends AbstractBaseDao<OperateLog> implements OperateLogDao {

	public OperateLogDaoImpl() {
		super(OperateLog.class);
	}

}
