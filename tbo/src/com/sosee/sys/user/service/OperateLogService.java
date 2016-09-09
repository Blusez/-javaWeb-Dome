package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.pojo.OperateLog;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:13:45
 * 功能:用户service
 */
public interface OperateLogService {
	OperateLog getValue(String id);
	List<OperateLog> getLoginLogList();
	List<OperateLog> getLoginLogList(String hql,Page page);
	void add(OperateLog operateLog);
	void update(OperateLog operateLog);
	void delete(String[] idArray);
	void deleteAll();
}
