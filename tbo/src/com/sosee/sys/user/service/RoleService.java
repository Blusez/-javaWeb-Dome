package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.pojo.Role;

public interface RoleService {
	Role getValue(String id);
	List<Role> getRoleList();
	List<Role> getUserRoleList(String userId);
	void add(Role role);
	void update(Role role);
	void delete(String[] idArray);
}
