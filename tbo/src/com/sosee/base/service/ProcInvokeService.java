package com.sosee.base.service;

import java.util.List;

import com.sosee.base.dao.Page;
/**
 * 
*@Project  : tianics
*@Author   : outworld
*@Date     : 2011-2-19 下午02:56:56
*@Copyright: 2011 outworld Studio Inc. All rights reserved.
*@Function : 通用过程调用服务层
 */
public interface ProcInvokeService {
	/**
	 * @param procedureName
	 * @param params
	 * @return 调用存储过程，返回单个对象或单个对象数组
	 */
    Object getObjectByProcedure(String procedureName,Object[] params);
    /**
     * @param procedureName
     * @param params
     * @return 调用存储过程，返回对象集合
     */
	List<Object> getObjectListByProcedure(String procedureName,Object[] params); 
	/**
	 * @param procedureName
	 * @param params
	 * @param page
	 * @return 调用存储过程，返回对象集合，并支持分页
	 */
	List<Object> getObjectListByProcedure(String procedureName,Object[] params,Page page); 
	
}
