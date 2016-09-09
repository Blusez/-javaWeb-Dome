package com.sosee.sys.user.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sosee.sys.user.dao.RoleDao;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.UserRole;

public class RoleServiceImpl implements RoleService {
	RoleDao roleDao;
	UserRoleService userRoleService;

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}

	public Role getValue(String id) {
		return roleDao.queryById(id);
	}

	public List<Role> getRoleList() {
		String hsql = "from Role";
		return roleDao.queryAll(hsql);
	}

	public List<Role> getUserRoleList(String userId) {
		List<UserRole> list = userRoleService.getUserRoleListByUser(userId);
		List<Role> organList = new ArrayList<Role>();
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			UserRole userRole = (UserRole) iterator.next();
			organList.add(this.getValue(userRole.getRole().getId()));
		}
		return organList;
	}

	public void add(Role role) {
		roleDao.create(role);
	}

	public void update(Role role) {
		roleDao.update(role);
	}

	public void delete(String[] idArray) {
		for (String id : idArray) {
			roleDao.delete(roleDao.queryById(id));
		}
	}
}
