package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.dao.UserDao;
import com.sosee.sys.user.dao.UserRoleDao;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.RoleMoudle;
import com.sosee.sys.user.pojo.UserRole;

public class UserRoleServiceImpl implements UserRoleService {
	UserDao userDao;
	UserRoleDao userRoleDao;

	public UserRoleDao getUserRoleDao() {
		return userRoleDao;
	}

	public void setUserRoleDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	public UserDao getUserDao() {
		return userDao;
	}

	@Override
	public void add(UserRole userRole) {
		userRoleDao.create(userRole);
	}

	@Override
	public void update(UserRole userRole) {
		userRoleDao.update(userRole);
	}

	@Override
	public void delete(String[] idArray) {
		for (String id : idArray) {
			userRoleDao.delete(userRoleDao.queryById(id));
		}
	}

	@Override
	public void delete(String organid, String userId) {
		String hql = "from UserRole where role.id=? and user.id=?";
		Object[] values = new Object[] { organid, userId };
		List<UserRole> list = userRoleDao.queryForList(hql, values);
		for (UserRole userRole : list)
				userRoleDao.delete(userRole);
	}
	
	@Override
	public void deleteByUser(String[] userId,String roleId) {
		for(String id:userId){
			List<UserRole> list=userRoleDao.queryAll("from UserRole where user.id='"+id+"' and role.id='"+roleId+"'");
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					userRoleDao.delete(list.get(i));
				}
			}
		}
	}
	
	@Override
	public void deleteByRole(String[] roleId) {
		for(String id:roleId){
			List<UserRole> list=userRoleDao.queryAll("from UserRole where role.id='"+id+"'");
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					userRoleDao.delete(list.get(i));
				}
			}
		}
	}
	
	@Override
	public void batchAdd(Role role, String[] userIdArray) {
		for (String userId : userIdArray) {
			UserRole userRole = new UserRole();
			userRole.setUser(userDao.queryById(userId));
			userRole.setRole(role);
			userRoleDao.create(userRole);
		}
	}

	@Override
	public List<UserRole> getUserRoleListByRole(String roleId) {
		String hsql = "from UserRole where role.id=?";
		Object[] params = { roleId };
		return (List<UserRole>) userRoleDao.queryForList(hsql, params);
	}
	
	@Override
	public List<UserRole> getUserRoleListByUser(String userId) {
		String hsql = "from UserRole where user.id=?";
		Object[] params = { userId };
		return (List<UserRole>) userRoleDao.queryForList(hsql, params);
	}

	public void setUserToOrganDao(UserRoleDao userRoleDao) {
		this.userRoleDao = userRoleDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

}
