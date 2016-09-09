package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.dao.CityRegionDao;
import com.sosee.sys.base.pojo.CityRegion;

public class CityRegionServiceImpl implements CityRegionService {

	private CityRegionDao cityRegionDao;

	

	public CityRegionDao getCityRegionDao() {
		return cityRegionDao;
	}

	public void setCityRegionDao(CityRegionDao cityRegionDao) {
		this.cityRegionDao = cityRegionDao;
	}

	@Override
	public List<CityRegion> queryAllRegion() {
		// TODO Auto-generated method stub
		//return cityRegionDao.queryForList("from CityRegion", new Object[]{});
		return cityRegionDao.queryAll("from CityRegion where parentId != null order by code ASC");
	}

	@Override
	public CityRegion queryCityRegionById(Serializable id) {
		// TODO Auto-generated method stub
		return cityRegionDao.queryById(id);
	}

	@Override
	public List<CityRegion> getSubCityRegionListByPid(Serializable id) {
		// TODO Auto-generated method stub
		return cityRegionDao.queryForList("from CityRegion where parentId.id=? order by code ASC", new Object[]{id});
	}

	@Override
	public void add(CityRegion cityRegion) {
		// TODO Auto-generated method stub
		cityRegionDao.create(cityRegion);
	}

	@Override
	public void update(CityRegion cityRegion) {
		// TODO Auto-generated method stub
		cityRegionDao.update(cityRegion);
	}

	@Override
	public void delete(CityRegion cityRegion) {
		// TODO Auto-generated method stub
		cityRegionDao.delete(cityRegion);
	}

	@Override
	public void updateSql(String updateSql) {
		cityRegionDao.executeUpdate(updateSql, null);
	}

	@Override
	public List<CityRegion> queryAllRegion(String strSql) {
		return cityRegionDao.queryAll(strSql);
	}
	
	
}
