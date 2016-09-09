package com.sosee.sys.user.action;

import java.util.ArrayList;
import java.util.List;

import com.sosee.base.action.AbstractAction;
import com.sosee.sys.user.pojo.LoginLog;
import com.sosee.sys.user.pojo.OperateLog;
import com.sosee.sys.user.service.LoginLogService;
import com.sosee.sys.user.service.OperateLogService;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-31 下午11:56:43
 * 功能:日志管理
 */
@SuppressWarnings("serial")
public class LogAction extends AbstractAction{
	
	private LoginLogService loginLogService;
	private OperateLogService operateLogService;
	private List<LoginLog> loginLogList=new ArrayList<LoginLog>();
	private List<OperateLog> operateLogList=new ArrayList<OperateLog>();
	private LoginLog loginLog;
	private OperateLog operateLog;
	private String dateTime1;
	private String dateTime2;
	private String dateTime3;
	private String dateTime4;
	private String type;

	public String queryLoginLog(){
		String hql="";
		if(loginLog!=null){
			if(loginLog.getAccount()!=null && !loginLog.getAccount().equals("")){
				hql+="and account='"+loginLog.getAccount()+"' ";
			}
		}
		if(dateTime1!=null && !dateTime1.equals("") && dateTime2!=null && !dateTime2.equals("")){
			hql+="and loginTime between '"+dateTime1+" 00:00:00' and '"+dateTime2+" 23:59:59' ";
		}
		if(dateTime3!=null && !dateTime3.equals("") && dateTime4!=null && !dateTime4.equals("")){
			hql+="and logoutTime between '"+dateTime3+" 00:00:00' and '"+dateTime4+" 23:59:59' ";
		}
		loginLogList=loginLogService.getLoginLogList(hql, page);
		return "queryLoginLog";
	}
	
	public String delLoginLog(){
		String[] strId=parseId();
		try{
			if(type!=null && type.equals("delAll"))
			{
				loginLogService.deleteAll();
			}else{
				if(strId!=null && strId.length>0){
					loginLogService.delete(strId);
				}
			}
			errorMessage="删除成功";
		}catch(Exception e){
			errorMessage="删除失败";
		}
		return queryLoginLog();
	}
	
	public String queryOperateLog(){
		String hql="";
		if(operateLog!=null){
			if(operateLog.getAccount()!=null && !operateLog.getAccount().equals("")){
				hql+="and account='"+operateLog.getAccount()+"' ";
			}
			if(operateLog.getContents()!=null && !operateLog.getContents().equals("")){
				hql+="and contents like '%"+operateLog.getContents()+"%' ";
			}
		}
		if(dateTime1!=null && !dateTime1.equals("") && dateTime2!=null && !dateTime2.equals("")){
			hql+="and createTime between '"+dateTime1+" 00:00:00' and '"+dateTime2+" 23:59:59' ";
		}
		operateLogList=operateLogService.getLoginLogList(hql, page);
		return "queryOperateLog";
	}

	public String delOperateLog(){
		String[] strId=parseId();
		try{
			if(type!=null && type.equals("delAll"))
			{
				operateLogService.deleteAll();
			}else{
				if(strId!=null && strId.length>0){
					operateLogService.delete(strId);
				}				
			}
			errorMessage="删除成功";
		}catch(Exception e){
			errorMessage="删除失败";
		}
		return queryOperateLog();
	}

	public LoginLogService getLoginLogService() {
		return loginLogService;
	}

	public void setLoginLogService(LoginLogService loginLogService) {
		this.loginLogService = loginLogService;
	}

	public OperateLogService getOperateLogService() {
		return operateLogService;
	}

	public void setOperateLogService(OperateLogService operateLogService) {
		this.operateLogService = operateLogService;
	}

	public List<LoginLog> getLoginLogList() {
		return loginLogList;
	}

	public void setLoginLogList(List<LoginLog> loginLogList) {
		this.loginLogList = loginLogList;
	}

	public List<OperateLog> getOperateLogList() {
		return operateLogList;
	}

	public void setOperateLogList(List<OperateLog> operateLogList) {
		this.operateLogList = operateLogList;
	}

	public LoginLog getLoginLog() {
		return loginLog;
	}

	public void setLoginLog(LoginLog loginLog) {
		this.loginLog = loginLog;
	}

	public OperateLog getOperateLog() {
		return operateLog;
	}

	public void setOperateLog(OperateLog operateLog) {
		this.operateLog = operateLog;
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

	public String getDateTime3() {
		return dateTime3;
	}

	public void setDateTime3(String dateTime3) {
		this.dateTime3 = dateTime3;
	}

	public String getDateTime4() {
		return dateTime4;
	}

	public void setDateTime4(String dateTime4) {
		this.dateTime4 = dateTime4;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
