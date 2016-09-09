package com.sosee.sys.user.service;

import java.util.List;

import com.sosee.sys.user.dao.ModelDao;
import com.sosee.sys.user.dao.RoleModelDao;
import com.sosee.sys.user.pojo.Moudle;

public class ModelServiceImpl implements ModelService {
	
	public ModelDao modelDao;
	public RoleModelDao roleModelDao;
	
	public void setModelDao(ModelDao moudleDao) {
		this.modelDao = moudleDao;
	}

	@Override
	public void add(Moudle moudle) {
		modelDao.create(moudle);
	}

	@Override
	public void delete(String[] idArray) {
		for(String id:idArray){
			roleModelDao.executeUpdate("delete from RoleMoudle where moudle.id='"+id+"'", null);
			modelDao.delete(modelDao.queryById(id));
		}
	}

	@Override
	public List<Moudle> getModelList() {
		String hsql="from Moudle order by code,grade";
		return modelDao.queryAll(hsql);
	}
	
	@Override
	public List<Moudle> getModelList(String hql) {
		String hsql="from Moudle where 1=1 "+hql+" order by code,grade";
		return modelDao.queryAll(hsql);
	}
	
	@Override
	public List<Moudle> getModeParentlList() {
		String hsql="from Moudle where parentId is null or parentId='' order by code,grade";
		return modelDao.queryAll(hsql);
	}

	@Override
	public Moudle getValue(String id) {
		return modelDao.queryById(id);
	}

	@Override
	public Moudle getValueByNumber(String number) {
		String hsql="from Moudle where code=?";
		Object[] params={number};
		return (Moudle)modelDao.queryForObject(hsql,params);
	}

	@Override
	public void update(Moudle moudle) {
		modelDao.update(moudle);
	}

	public RoleModelDao getRoleModelDao() {
		return roleModelDao;
	}

	public void setRoleModelDao(RoleModelDao roleModelDao) {
		this.roleModelDao = roleModelDao;
	}

	public ModelDao getModelDao() {
		return modelDao;
	}	
}
