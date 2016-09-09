package com.sosee.sys.base.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.pojo.League;
import com.sosee.sys.base.service.CityRegionService;
import com.sosee.sys.base.service.LeagueService;
import com.sosee.util.StringUtils;
/**
 * 
 * @author liuang
 *
 */
public class LeagueAction extends AbstractAction {

	private LeagueService leagueService;
	private boolean editable=false;
	private League league;
	private List<League> leagueList;
	private List<CityRegion> cityRegionList;
	private CityRegionService cityRegionService;
	
	
	
	public List<CityRegion> getCityRegionList() {
		return cityRegionList;
	}

	public void setCityRegionList(List<CityRegion> cityRegionList) {
		this.cityRegionList = cityRegionList;
	}

	public CityRegionService getCityRegionService() {
		return cityRegionService;
	}

	public void setCityRegionService(CityRegionService cityRegionService) {
		this.cityRegionService = cityRegionService;
	}

	public List<League> getLeagueList() {
		return leagueList;
	}

	public void setLeagueList(List<League> leagueList) {
		this.leagueList = leagueList;
	}

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public League getLeague() {
		return league;
	}

	public void setLeague(League league) {
		this.league = league;
	}

	public LeagueService getLeagueService() {
		return leagueService;
	}

	public void setLeagueService(LeagueService leagueService) {
		this.leagueService = leagueService;
	}
	/**
	 * 
	 * @return
	 */
	public String transferToLeagueList(){
		cityRegionList = cityRegionService.queryAllRegion();
		leagueList = leagueService.queryAllLeagues();
		return "list";
	}
	/**
	 * 
	 */
	public String save(){
		if (StringUtils.isNullString(league.getId())) {
			leagueService.add(league);
		} else {
			leagueService.update(league);
		}
		errorMessage = "保存成功！";
		league = null;
		return transferToLeagueList();
	}
	/**
	 * 
	 */
	public String editLeague(){
		editable=true;
		league = leagueService.getLeagueById(id);
		return transferToLeagueList();
	}
	/**
	 * 
	 */
	public String deleteLeague(){
		leagueService.delete(leagueService.getLeagueById(id));
		return transferToLeagueList();
	}
}
