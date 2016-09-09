package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.pojo.League;

/**
 * 
 * @author liuang
 *
 */
public interface LeagueService {

	void add(League league);
	
	void update(League league);
	
	void delete(League league);
	
	List<League> queryAllLeagues();
	
	League getLeagueById(Serializable id);
}
