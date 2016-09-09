package com.sosee.sys.user.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.Moudle;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:17:20
 * 功能:模块DaoImpl
 */
@SuppressWarnings("unchecked")
public class ModelDaoImpl extends AbstractBaseDao<Moudle> implements ModelDao{
	
	public ModelDaoImpl(){
		super(Moudle.class);
	}
}
