package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.pojo.Role;
import com.sosee.sys.user.pojo.UserRole;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 下午12:02:01
 * 功能:用户角色service
 */
public interface UserRoleService {
	void add(UserRole userRole);
	void update(UserRole userRole);
	void delete(String[] idArray);
	void delete(String organid,String userId);
	void deleteByUser(String[] modelId,String roleId);
	void deleteByRole(String[] roleId);
	void batchAdd(Role role,String[] userIdArray);
	List<UserRole> getUserRoleListByRole(String roleId);
	List<UserRole> getUserRoleListByUser(String userId);
}
