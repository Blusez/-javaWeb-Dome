package com.sosee.sys.base.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.base.pojo.Region;
import com.sosee.sys.base.service.RegionService;
import com.sosee.util.StringUtils;

public class RegionAction extends AbstractAction {

	private RegionService regionsService;
	private List<Region> regionsList;
	private String pid;
	private Region regions;
	private List<Region> subRegionList;
	private Region subRegion;
	private boolean editable=false;

	
	
	public RegionService getRegionsService() {
		return regionsService;
	}
	public void setRegionsService(RegionService regionsService) {
		this.regionsService = regionsService;
	}
	public List<Region> getRegionsList() {
		return regionsList;
	}
	public void setRegionsList(List<Region> regionsList) {
		this.regionsList = regionsList;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public Region getRegions() {
		return regions;
	}
	public void setRegions(Region regions) {
		this.regions = regions;
	}
	public List<Region> getSubRegionList() {
		return subRegionList;
	}
	public void setSubRegionList(List<Region> subRegionList) {
		this.subRegionList = subRegionList;
	}
	public Region getSubRegion() {
		return subRegion;
	}
	public void setSubRegion(Region subRegion) {
		this.subRegion = subRegion;
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
		regionsList = regionsService.queryAllRegion();
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
		regionsList=regionsService.queryAllRegion();
		return "list";
	}
	/**
	 * 
	 * @return
	 */
	public String getSubRegionListByPId(){
		regions=regionsService.queryRegionById(id);
		subRegionList = regionsService.getSubRegionListByPid(pid);
		regionsList=regionsService.queryAllRegion();
		System.out.println(errorMessage);
		return "list";
	}
	/**
	 * 编辑子行政区
	 */
	public String editSubRegion(){
		editable=true;
		subRegion = regionsService.queryRegionById(id);
		subRegionList = regionsService.getSubRegionListByPid(pid);
		return "list";
	}
	/**
	 * 添加或者更新子行政区
	 */
	public String save(){
		if (StringUtils.isNullString(subRegion.getId())) {
			regionsService.add(subRegion);
		} else {
			regionsService.update(subRegion);
		}
		return "refresh";
	}
	/**
	 * 删除行政区，包括子行政区一并删除
	 */
	public String deleteRegionList(){
		List<Region> regionTempList = regionsService.getSubRegionListByPid(id);
		subRegion = regionsService.queryRegionById(id);
		if(regionTempList!=null && regionTempList.size()>0 ){
			errorMessage="请检查此栏目下是否有子行政区信息";
			return "refresh";
		}
		regionsService.delete(subRegion);
		return "delete";
	}
	
}
