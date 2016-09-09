package com.sosee.sys.base.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.service.CityRegionService;
import com.sosee.util.StringUtils;

public class CityRegionAction extends AbstractAction {

	private CityRegionService cityRegionService;
	private List<CityRegion> cityRegionsList;
	private String pid;
	private CityRegion cityRegions;
	private List<CityRegion> subCityRegionList;
	private CityRegion subCityRegion;
	private boolean editable=false;
	private String messsage;

	

	public String getMesssage() {
		return messsage;
	}
	public void setMesssage(String messsage) {
		this.messsage = messsage;
	}
	public CityRegionService getCityRegionService() {
		return cityRegionService;
	}
	public void setCityRegionService(CityRegionService cityRegionService) {
		this.cityRegionService = cityRegionService;
	}
	public List<CityRegion> getCityRegionsList() {
		return cityRegionsList;
	}
	public void setCityRegionsList(List<CityRegion> cityRegionsList) {
		this.cityRegionsList = cityRegionsList;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public CityRegion getCityRegions() {
		return cityRegions;
	}
	public void setCityRegions(CityRegion cityRegions) {
		this.cityRegions = cityRegions;
	}
	public List<CityRegion> getSubCityRegionList() {
		return subCityRegionList;
	}
	public void setSubCityRegionList(List<CityRegion> subCityRegionList) {
		this.subCityRegionList = subCityRegionList;
	}
	public CityRegion getSubCityRegion() {
		return subCityRegion;
	}
	public void setSubCityRegion(CityRegion subCityRegion) {
		this.subCityRegion = subCityRegion;
	}
	public boolean isEditable() {
		return editable;
	}
	public void setEditable(boolean editable) {
		this.editable = editable;
	}
	/**
	 * 获取行政区树
	 * @return
	 */
	public String getRegionTree(){
		cityRegionsList = cityRegionService.queryAllRegion();
		return "success";
	}
	/**
	 * 跳转到行政区树列表显示界面
	 * @return
	 */
	public String switchToItem(){
		return "switch";
	}
	/**
	 * 获取行政区列表信息
	 * @return
	 */
	public String getRegionList(){
		if(id==null || id.trim().equals("")){
			cityRegionsList=cityRegionService.queryAllRegion();
		}else{
			cityRegions=cityRegionService.queryCityRegionById(id);
			cityRegionsList= cityRegionService.getSubCityRegionListByPid(id);
		}
		return "list";
	}
	/**
	 * 
	 * @return
	 */
	public String getSubRegionListByPId(){
		cityRegions=cityRegionService.queryCityRegionById(id);
		//subCityRegionList = cityRegionService.getSubCityRegionListByPid(pid);
		//cityRegionsList=cityRegionService.queryAllRegion();
		cityRegionsList= cityRegionService.getSubCityRegionListByPid(id);
		//System.out.println(errorMessage);
		return "list";
	}
	/**
	 * 编辑子行政区
	 */
	public String editSubRegion(){
		editable=true;
		cityRegions=cityRegionService.queryCityRegionById(pid);
		subCityRegion = cityRegionService.queryCityRegionById(id);
		//subCityRegionList = cityRegionService.getSubCityRegionListByPid(id);
		//cityRegionsList=cityRegionService.queryAllRegion();
		cityRegionsList= cityRegionService.getSubCityRegionListByPid(pid);
		return "list";
	}
	/**
	 * 添加或者更新子行政区
	 */
	public String save(){
		try{
			if(subCityRegion.getParentId()!=null && !subCityRegion.getParentId().equals("")){
				cityRegionService.updateSql("UPDATE CityRegion set isParent=true where id='"+subCityRegion.getParentId().getId()+"'");
				id=subCityRegion.getParentId().getId();
			}
		}catch(Exception e){}
		if (StringUtils.isNullString(subCityRegion.getId())) {
			cityRegionService.add(subCityRegion);
		} else {
			cityRegionService.update(subCityRegion);
		}
		return "switch";
		//return "refresh";
	}
	/**
	 * 删除行政区，包括子行政区一并删除
	 */
	public String deleteRegionList(){
		List<CityRegion> regionTempList = cityRegionService.getSubCityRegionListByPid(id);
		subCityRegion = cityRegionService.queryCityRegionById(id);
		if(regionTempList!=null && regionTempList.size()>0 ){
			errorMessage="请检查此栏目下是否有子行政区信息";
			return "refresh";
		}
		cityRegionService.delete(subCityRegion);
		return "delete";
	}
	
}
