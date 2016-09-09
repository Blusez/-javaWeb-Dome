package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.pojo.Moudle;
import com.sosee.sys.user.pojo.RoleMoudle;

public interface RoleModelService {
	RoleMoudle getValue(String id);
	List<RoleMoudle> getValueByRole(String roleId);
	List<RoleMoudle> getRoleModelList();
	void add(RoleMoudle roleMoudle);
	void update(RoleMoudle roleMoudle);
	void delete(String[] id);
	void deleteByModel(String[] modelId,String roleId);
	void deleteByRole(String[] roleId);
}
