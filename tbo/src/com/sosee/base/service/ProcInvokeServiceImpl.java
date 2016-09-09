package com.sosee.base.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.base.dao.ProcInvokeDao;

/**
 * 
*@Project  : tianics
*@Author   : outworld
*@Date     : 2011-2-19 下午03:07:20
*@Copyright: 2011 outworld Studio Inc. All rights reserved.
*@Function : 通用过程调用功能
 */
public class ProcInvokeServiceImpl extends AbstractService implements ProcInvokeService{
	private ProcInvokeDao procInvokeDao;//dao

	public ProcInvokeServiceImpl(){}
	
	@Override
	public Object getObjectByProcedure(String procedureName, Object[] params) {
		return procInvokeDao.queryForObject(procedureName, params);
	}

	@Override
	public List<Object> getObjectListByProcedure(String procedureName,
			Object[] params, Page page) {
		return procInvokeDao.queryForList(procedureName, params, page);
	}

	@Override
	public List<Object> getObjectListByProcedure(String procedureName,
			Object[] params) {
		return procInvokeDao.queryForList(procedureName, params);
	}

	public ProcInvokeDao getProcInvokeDao() {
		return procInvokeDao;
	}

	public void setProcInvokeDao(ProcInvokeDao procInvokeDao) {
		this.procInvokeDao = procInvokeDao;
	}

	
}
