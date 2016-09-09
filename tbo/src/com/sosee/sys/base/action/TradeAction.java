package com.sosee.sys.base.action;

import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.base.pojo.League;
import com.sosee.sys.base.pojo.Trade;
import com.sosee.sys.base.service.CityRegionService;
import com.sosee.sys.base.service.ItemsService;
import com.sosee.sys.base.service.LeagueService;
import com.sosee.sys.base.service.TradeService;
import com.sosee.util.StringUtils;
/**
 * 
 * @author liuang
 *
 */
public class TradeAction extends AbstractAction {

	private TradeService tradeService;
	private List<Trade> tradeList;
	private Trade trade;
	private ItemsService itemsService;
	private List<Items> itemList;
	private boolean editable=false;
	private List<CityRegion> cityRegionList;
	private CityRegionService cityRegionService;
	private List<League> leagueList;
	private LeagueService leagueService;
	
	
	
	public List<League> getLeagueList() {
		return leagueList;
	}

	public void setLeagueList(List<League> leagueList) {
		this.leagueList = leagueList;
	}

	public LeagueService getLeagueService() {
		return leagueService;
	}

	public void setLeagueService(LeagueService leagueService) {
		this.leagueService = leagueService;
	}

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

	public boolean isEditable() {
		return editable;
	}

	public void setEditable(boolean editable) {
		this.editable = editable;
	}

	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public List<Items> getItemList() {
		return itemList;
	}

	public void setItemList(List<Items> itemList) {
		this.itemList = itemList;
	}

	public Trade getTrade() {
		return trade;
	}

	public void setTrade(Trade trade) {
		this.trade = trade;
	}

	public TradeService getTradeService() {
		return tradeService;
	}

	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}

	public List<Trade> getTradeList() {
		return tradeList;
	}

	public void setTradeList(List<Trade> tradeList) {
		this.tradeList = tradeList;
	}

	/**
	 * 跳转到行业列表
	 */
	public String transferToList(){
		tradeList = tradeService.queryAllTrades();
		itemList = itemsService.queryAllItems();
		cityRegionList = cityRegionService.queryAllRegion();
		leagueList = leagueService.queryAllLeagues();
		return "list";
	}
	/**
	 * 添加新行业或更新
	 */
	public String save(){
		try{
			if (StringUtils.isNullString(trade.getId())) {
				tradeService.add(trade);
			} else {
				tradeService.update(trade);
			}
			errorMessage = "保存成功！";
		}catch(Exception ex){
			errorMessage = "保存失败！";
		}finally{
			trade = null;
		}
		return transferToList();
	}
	/**
	 * 删除新行业
	 */
	public String deleteTrade(){
		tradeService.delete(tradeService.getTradeById(id));
		return transferToList();
	}
	/**
	 * 获取要编辑行业的信息
	 */
	public String editTrade(){
		editable=true;
		trade = tradeService.getTradeById(id);
		return transferToList();
	}
}
