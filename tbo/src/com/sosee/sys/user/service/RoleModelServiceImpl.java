package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.dao.RoleModelDao;
import com.sosee.sys.user.pojo.RoleMoudle;

public class RoleModelServiceImpl implements RoleModelService {
	
	public RoleModelDao roleModelDao;
	
	public void setRoleModelDao(RoleModelDao roleModelDao) {
		this.roleModelDao = roleModelDao;
	}

	@Override
	public void add(RoleMoudle roleMoudle) {
		roleModelDao.create(roleMoudle);
	}

	@Override
	public void delete(String[] idArray) {
		for(String id:idArray){
			roleModelDao.delete(roleModelDao.queryById(id));
		}
	}
	
	@Override
	public void deleteByModel(String[] modelId,String roleId) {
		for(String id:modelId){
			List<RoleMoudle> list=roleModelDao.queryAll("from RoleMoudle where moudle.id='"+id+"' and role.id='"+roleId+"'");
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					roleModelDao.delete(list.get(i));
				}
			}
		}
	}
	
	@Override
	public void deleteByRole(String[] roleId) {
		for(String id:roleId){
			List<RoleMoudle> list=roleModelDao.queryAll("from RoleMoudle where role.id='"+id+"'");
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					roleModelDao.delete(list.get(i));
				}
			}
		}
	}

	@Override
	public List<RoleMoudle> getRoleModelList() {
		String hsql="from RoleMoudle";
		return roleModelDao.queryAll(hsql);
	}

	@Override
	public RoleMoudle getValue(String id) {
		return roleModelDao.queryById(id);
	}

	@Override
	public List<RoleMoudle> getValueByRole(String roleId) {
		String hsql="from RoleMoudle where role.id=? order by moudle.grade,moudle.code";
		Object[] params={roleId};
		return roleModelDao.queryForList(hsql,params);
	}

	@Override
	public void update(RoleMoudle roleMoudle) {
		roleModelDao.update(roleMoudle);
	}

}
