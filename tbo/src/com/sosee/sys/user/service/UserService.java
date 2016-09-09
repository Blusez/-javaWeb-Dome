package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.User;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:13:45
 * 功能:用户service
 */
public interface UserService {
	User getValue(String id);
	User getValueByLoginName(String loginName);
	List<User> getUserList();
	List<User> getExceptUserList(String userId);
	List<User> getEnableUserList();
	List<User> getUserRoleList(String organid);
	List<User> getUserList(String hql);
	List<User> getUserList(String hql,Page page);
	void add(Role role,User user);
	void update(User user);
	void delete(String[] idArray);
}
