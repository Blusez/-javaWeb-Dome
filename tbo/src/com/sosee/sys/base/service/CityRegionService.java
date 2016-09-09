package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.pojo.CityRegion;

public interface CityRegionService { 
	
	void add(CityRegion cityRegion);
	
	void update(CityRegion cityRegion);
	
	List<CityRegion> queryAllRegion();
	
	List<CityRegion> queryAllRegion(String strSql);
	
	CityRegion queryCityRegionById(Serializable id);
	
	List<CityRegion> getSubCityRegionListByPid(Serializable id);
	
	void delete(CityRegion cityRegion);
	
	void updateSql(String updateSql);
}
