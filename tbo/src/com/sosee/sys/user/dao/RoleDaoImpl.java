package com.sosee.sys.user.dao;

import java.util.List;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.Role;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:19:28
 * 功能:角色DaoImpl
 */
@SuppressWarnings("unchecked")
public class RoleDaoImpl extends AbstractBaseDao<Role> implements RoleDao {

	public RoleDaoImpl() {
		super(Role.class);
	}

	@Override
	public List<Role> getSubOrgan(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
