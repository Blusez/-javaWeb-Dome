package com.sosee.sys.user.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.RoleMoudle;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:19:28
 * 功能:角色DaoImpl
 */
@SuppressWarnings("unchecked")
public class RoleModelDaoImpl extends AbstractBaseDao<RoleMoudle> implements RoleModelDao {

	public RoleModelDaoImpl() {
		super(RoleMoudle.class);
	}
}
