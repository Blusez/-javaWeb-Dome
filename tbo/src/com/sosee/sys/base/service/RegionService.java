package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.pojo.Region;

public interface RegionService { 
	
	void add(Region region);
	
	void update(Region region);
	
	List<Region> queryAllRegion();
	
	Region queryRegionById(Serializable id);
	
	List<Region> getSubRegionListByPid(Serializable id);
	
	void delete(Region region);

}
