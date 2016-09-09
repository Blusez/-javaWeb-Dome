package com.sosee.sys.user.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.dao.UserDao;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.User;
import com.sosee.sys.user.pojo.UserRole;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 下午01:39:36
 * 功能:用户serviceImpl
 */
public class UserServiceImpl implements UserService {
	UserDao userDao;
	RoleService roleService;
	UserRoleService userRoleService;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User getValueByLoginName(String loginName) {
		String hsql = "from User where account=?";
		Object[] params = { loginName };

		return (User) userDao.queryForObject(hsql, params);
	}

	@Override
	public List<User> getUserList() {
		String hsql = "from User ";
		return userDao.queryAll(hsql);
	}
	
	@Override
	public List<User> getUserList(String hql) {
		String hsql = "from User where 1=1 "+hql;
		return userDao.queryAll(hsql);
	}
	
	@Override
	public List<User> getUserList(String hql,Page page) {
		String hsql = "from User where 1=1 "+hql;
		return userDao.queryForList(hsql, page);
	}
	
	@Override
	public List<User> getExceptUserList(String userId) {
		String hsql = "from User where id != ?";
		return userDao.queryForList(hsql,new Object[]{userId});
	}

	@Override
	public List<User> getEnableUserList() {
		String hsql = "from User where alive=1";
		return userDao.queryAll(hsql);
	}

	@Override
	public List<User> getUserRoleList(String roleId) {
		List<UserRole> userToOrganList = userRoleService.getUserRoleListByRole(roleId);
		List<User> userList = new ArrayList<User>();
		for (Iterator iterator = userToOrganList.iterator(); iterator.hasNext();) {
			UserRole userRole = (UserRole) iterator.next();
			userList.add(this.getValue(userRole.getUser().getId()));
		}
		return userList;
	}

	@Override
	public User getValue(String id) {
		return (User) userDao.queryById(id);
	}

	@Override
	public void add(Role role,User user) {
		userDao.create(user);
		if(role!=null){
			UserRole userRole = new UserRole();
			userRole.setUser(user);
			userRole.setRole(role);
			userRoleService.add(userRole);
		}
	}

	@Override
	public void update(User user) {
		userDao.update(user);
	}

	@Override
	public void delete(String[] idArray) {
		for (String id : idArray) {
			userDao.delete(userDao.queryById(id));
		}
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public UserRoleService getUserRoleService() {
		return userRoleService;
	}

	public void setUserRoleService(UserRoleService userRoleService) {
		this.userRoleService = userRoleService;
	}

	public UserDao getUserDao() {
		return userDao;
	}
}
