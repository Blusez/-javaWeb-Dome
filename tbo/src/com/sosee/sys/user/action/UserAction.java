package com.sosee.sys.user.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.service.CityRegionService;
import com.sosee.sys.user.pojo.User;
import com.sosee.sys.user.service.UserService;
import com.sosee.util.Constants;
import com.sosee.util.StringUtils;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-31 下午11:56:43
 * 功能:
 */
@SuppressWarnings("serial")
public class UserAction extends AbstractAction{
	
	private UserService userService;
	private CityRegionService cityRegionService;
	private User user;
	private List<User> userList=new ArrayList<User>();
	private Map<String,String> uMap=new HashMap<String,String>();
	private Map<Integer,String> sMap=new HashMap<Integer,String>();
	private String account;
	private String name;
	private String accountType;
	private String status;
	private String dateTime1;
	private String dateTime2;	

	public String query(){
		String hql="";
		if(account!=null && !account.equals("")){
			hql+="and account like '%"+account+"%' ";
		}
		if(name!=null && !name.equals("")){
			hql+="and name like '%"+account+"%' ";
		}
		if(accountType!=null && !accountType.equals("") && !accountType.equals("-1")){
			hql+="and accountType='"+accountType+"' ";
		}
		if(status!=null && !status.equals("") && !status.equals("0")){
			hql+="and status='"+status+"' ";
		}
		if(dateTime1!=null && !dateTime1.equals("") && dateTime2!=null && !dateTime2.equals("")){
			hql+="and createTime between '"+dateTime1+" 00:00:00' and '"+dateTime2+" 23:59:59' ";
		}
		try{
			userList=userService.getUserList(hql, page);
		}catch(Exception e){
			errorMessage="查询出错！";
		}
		return "query";
	}
	
	public String userAdd(){
		return "add";
	}
	
	public String userEdit(){
		if(user!=null && user.getId()!=null && !user.getId().equals("")){
			try{
				user=userService.getValue(user.getId());
			}catch(Exception e){
				errorMessage="查询出错！";
			}
		}
		return "edit";
	}
	
	public String userSave(){
		if(user!=null){
			try{
				if(user.getId()!=null && !user.getId().equals("")){
					userService.update(user);
				}else{
					User u=userService.getValueByLoginName(user.getAccount());
					if(u!=null && u.getId()!=null && !u.getId().equals("")){
						errorMessage="用户账号已经存在！";
						return "check";
					}
					user.setStatus(Constants.USER_STATE_1);
					if(user.getAccountType().equals(Constants.USER_TYPE_1)){
						user.setIsAdmin(true);
					}else{
						user.setIsAdmin(false);
					}
					if(!user.getAccountType().equals(Constants.USER_TYPE_3)){
						user.setRegion(null);
					}
					user.setPassword(StringUtils.encodeBase64("123456"));
					user.setLoginSum(0);
					user.setCreateTime(new Date());
					userService.add(null,user);
				}
				errorMessage="用户保存成功！";
			}catch(Exception e){
				errorMessage="用户保存失败！";
			}
		}
		return query();
	}
	
	public String userEnable(){
		if(user!=null && user.getId()!=null && !user.getId().equals("")){
			String str="";
			try{
				User u=userService.getValue(user.getId());
				
				if(u.getStatus().equals(Constants.USER_STATE_1)){
					u.setStatus(Constants.USER_STATE_2);
					str="禁用";
				}else{
					u.setStatus(Constants.USER_STATE_1);
					str="启用";
				}
				userService.update(u);
				errorMessage="用户"+str+"成功！";
			}catch(Exception eue){
				errorMessage="用户"+str+"失败！";
			}
		}
		return query();
	}
	
	public String userPwd(){
		if(user!=null && user.getId()!=null && !user.getId().equals("")){
			try{
				User u=userService.getValue(user.getId());
				u.setPassword(StringUtils.encodeBase64("123456"));
				userService.update(u);
				errorMessage="用户密码初始化成功！";
			}catch(Exception eue){
				errorMessage="用户密码初始化失败！";
			}
		}
		return query();
	}
	
	public String getCity(){
		if(id==null || id.trim().equals("")){
			this.setJsonString("[]");
		}else{
			List<CityRegion> listCity=cityRegionService.getSubCityRegionListByPid(id.trim());
			if(listCity!=null && listCity.size()>0){
				String jsonStrTemp="[";
				int iCityCount=1;
				for(CityRegion cr : listCity){
					jsonStrTemp+="{ id:'"+cr.getId()+"', pId:'"+id.trim()+"', name:'"+cr.getName()+"'"
					+(cr.getIsParent()?",isParent:true":",isParent:false")+"}";
					if(iCityCount!=listCity.size()){
						jsonStrTemp+=",";
					}
					iCityCount++;
				}
				jsonStrTemp+="]";
				this.setJsonString(jsonStrTemp);
			}else{
				this.setJsonString("[]");
			}
		}
		return "getCity";
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public Map<String, String> getUMap() {
		uMap.put("-1", "请选择");
		User u=(User)getSessionAttribute(Constants.USER);
		if(u!=null && u.getAccountType().equals(Constants.USER_TYPE_1)){
			uMap.put(Constants.USER_TYPE_1, "超级管理员");
		}
		uMap.put(Constants.USER_TYPE_2, "管理员");
		uMap.put(Constants.USER_TYPE_3, "普通用户");
		return uMap;
	}

	public Map<Integer, String> getSMap() {
		sMap.put(Constants.SEX_M, "男");
		sMap.put(Constants.SEX_F, "女");
		return sMap;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDateTime1() {
		return dateTime1;
	}

	public void setDateTime1(String dateTime1) {
		this.dateTime1 = dateTime1;
	}

	public String getDateTime2() {
		return dateTime2;
	}

	public void setDateTime2(String dateTime2) {
		this.dateTime2 = dateTime2;
	}

	public CityRegionService getCityRegionService() {
		return cityRegionService;
	}

	public void setCityRegionService(CityRegionService cityRegionService) {
		this.cityRegionService = cityRegionService;
	}
}
