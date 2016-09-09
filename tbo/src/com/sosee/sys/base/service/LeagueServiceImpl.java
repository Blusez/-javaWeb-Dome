package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.sys.base.dao.LeagueDao;
import com.sosee.sys.base.pojo.League;
/**
 * 
 * @author liuang
 *
 */
public class LeagueServiceImpl implements LeagueService {

	private LeagueDao leagueDao;

	public LeagueDao getLeagueDao() {
		return leagueDao;
	}

	public void setLeagueDao(LeagueDao leagueDao) {
		this.leagueDao = leagueDao;
	}

	@Override
	public void add(League league) {
		// TODO Auto-generated method stub
		leagueDao.create(league);
	}

	@Override
	public void delete(League league) {
		// TODO Auto-generated method stub
		leagueDao.delete(league);
	}

	@Override
	public List<League> queryAllLeagues() {
		// TODO Auto-generated method stub
		return leagueDao.queryAll("from League");
	}

	@Override
	public void update(League league) {
		// TODO Auto-generated method stub
		leagueDao.update(league);
	}

	@Override
	public League getLeagueById(Serializable id) {
		// TODO Auto-generated method stub
		return leagueDao.queryById(id);
	}
	
	
}
