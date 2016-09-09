package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.dao.RegionDao;
import com.sosee.sys.base.pojo.Region;

public class RegionServiceImpl implements RegionService {

	private RegionDao regionDao;

	public RegionDao getRegionDao() {
		return regionDao;
	}

	public void setRegionDao(RegionDao regionDao) {
		this.regionDao = regionDao;
	}

	@Override
	public List<Region> queryAllRegion() {
		// TODO Auto-generated method stub
		return regionDao.queryForList("from Region", new Object[]{});
	}

	@Override
	public Region queryRegionById(Serializable id) {
		// TODO Auto-generated method stub
		return regionDao.queryById(id);
	}

	@Override
	public List<Region> getSubRegionListByPid(Serializable id) {
		// TODO Auto-generated method stub
		return regionDao.queryForList("from Region where parentId.id=?", new Object[]{id});
	}

	@Override
	public void add(Region region) {
		// TODO Auto-generated method stub
		regionDao.create(region);
	}

	@Override
	public void update(Region region) {
		// TODO Auto-generated method stub
		regionDao.update(region);
	}

	@Override
	public void delete(Region region) {
		// TODO Auto-generated method stub
		regionDao.delete(region);
	}
	
	
}
