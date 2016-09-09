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
import com.sosee.sys.news.pojo.News;
import com.sosee.sys.news.service.NewsService;
import com.sosee.util.StringUtils;
/**
 * 
 * @author liuang
 *
 */
public class ItemsAction extends AbstractAction {

	private static final long serialVersionUID = 1L;
	private ItemsService itemsService;
	private TradeService tradeService;
	private List<Items> itemsList;
	private String pid;
	private Items items;
	private List<Items> subItemList;
	private Items subItem;
	private boolean editable=false;
	private List<CityRegion> cityRegionList;
	private CityRegionService cityRegionService;
	private List<League> leagueList;
	private LeagueService leagueService;
	private NewsService newsService;
	
	
	public NewsService getNewsService() {
		return newsService;
	}


	public void setNewsService(NewsService newsService) {
		this.newsService = newsService;
	}



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


	public TradeService getTradeService() {
		return tradeService;
	}


	public void setTradeService(TradeService tradeService) {
		this.tradeService = tradeService;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public Items getSubItem() {
		return subItem;
	}


	public void setSubItem(Items subItem) {
		this.subItem = subItem;
	}
	
	
	public List<Items> getSubItemList() {
		return subItemList;
	}


	public void setSubItemList(List<Items> subItemList) {
		this.subItemList = subItemList;
	}


	public boolean isEditable() {
		return editable;
	}


	public void setEditable(boolean editable) {
		this.editable = editable;
	}


	public void setItems(Items items) {
		this.items = items;
	}

	
	public Items getItems() {
		return items;
	}


	public ItemsService getItemsService() {
		return itemsService;
	}

	public void setItemsService(ItemsService itemsService) {
		this.itemsService = itemsService;
	}

	public List<Items> getItemsList() {
		return itemsList;
	}

	public void setItemsList(List<Items> itemsList) {
		this.itemsList = itemsList;
	}
	
	/**
	 * 获取栏目树
	 * @return
	 */
	public String getItemsTree(){
		itemsList = itemsService.queryAllItems();
		return "success";
	}
	/**
	 * 跳转到栏目树列表显示界面
	 * @return
	 */
	public String switchToItem(){
		return "switch";
	}
	/**
	 * 获取栏目列表信息
	 * @return
	 */
	public String getItemsTradeList(){
		cityRegionList = cityRegionService.queryAllRegion();
		leagueList = leagueService.queryAllLeagues();
		return "list";
	}
	/**
	 * 
	 * @return
	 */
	public String getSubItemsListByPId(){
		cityRegionList = cityRegionService.queryAllRegion();
		leagueList = leagueService.queryAllLeagues();
		try{
			items = itemsService.queryItemsById(id);
			subItemList = itemsService.getSubItemListByPid(id);
		}catch(Exception ex){
			errorMessage="queryfail";
		}
		
		return "list";
	}
	/**
	 * 编辑子栏目
	 */
	public String editSubItem(){
		editable=true;
		subItem = itemsService.queryItemsById(id);
		subItemList = itemsService.getSubItemListByPid(pid);
		cityRegionList = cityRegionService.queryAllRegion();
		leagueList = leagueService.queryAllLeagues();
		return "list";
	}
	/**
	 * 添加或者更新子栏目
	 */
	public String save(){
		if (StringUtils.isNullString(subItem.getId())) {
			itemsService.add(subItem);
		} else {
			itemsService.update(subItem);
		}
		return "refresh";
	}
	/**
	 * 删除栏目，包括子栏目和行业一并删除
	 */
	public String deleteItemList(){
		List<Items> itemsTempList = itemsService.getSubItemListByPid(id);
		subItem = itemsService.queryItemsById(id);
		List<Trade> tradeTempList = tradeService.queryTradeByItem(subItem);
		List<News> newsList = newsService.queryNewsByItems(subItem);
		if(itemsTempList!=null && itemsTempList.size()>0 || tradeTempList!=null &&tradeTempList.size()>0){
			errorMessage="hasdata";
			return "refresh";
		}
		if(newsList!=null && newsList.size()>0){
			errorMessage="hasdata";
			return "refresh";
		}
	
		try{
			itemsService.delete(subItem);
			errorMessage="deleted";
		}catch(Exception ex){
			errorMessage="error";
		}
		getItemsTree();
		return "delete";
	}
	
}
