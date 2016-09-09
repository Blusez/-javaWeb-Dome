package com.sosee.sys.user.dao;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.UserRole;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:21:32
 * 功能:用户角色关系DaoImpl
 */
@SuppressWarnings("unchecked")
public class UserRoleDaoImpl extends AbstractBaseDao<UserRole> implements UserRoleDao {

	public UserRoleDaoImpl() {
		super(UserRole.class);
	}
}
