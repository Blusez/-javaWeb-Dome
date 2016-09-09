package com.sosee.base.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import com.sosee.base.dao.Page;	
import com.sosee.sys.news.pojo.News;	
import com.sosee.util.StringUtils;


/**
 * <pre>
 * &lt;p/&gt;
 * Author : outworld
 * Date   : 2009-06-01
 * Time   : 15:30:00
 * Version: 1.0
 * </pre>
 * 
 * 目前的信息统一设计为用下划线分隔的三部分内容， 第一个是功能子系统，第2个是结果，第3个是操作内容
 */
@SuppressWarnings("serial")
public abstract class AbstractAction extends ActionSupport implements Preparable {

	public final Logger log = Logger.getLogger(getClass());

    public static final String MESSAGE = "message";
    protected String todayNewsCode="ITEM00801";		//今日要闻编码
	protected List<News> todayNewsList = new ArrayList<News>();  		//今日要闻
	protected int pListCount=5;				//普通列表数量

    protected String id;
	private String jsonString;// 返回的json数据
	protected String errorMessage;// 出错信息

	protected Page page;
	
	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public String getJsonString() {
		return jsonString;
	}

	public void setJsonString(String jsonString) {
		this.jsonString = jsonString;
	}

	public String save() throws Exception {
		return SUCCESS;
	}

	public String edit() throws Exception {
		return SUCCESS;
	}

	public String delete() throws Exception {
		return SUCCESS;
	}

	public String list() throws Exception {
		return SUCCESS;
	}

	public void setApplicationAttribute(String key, Object value) {
		ServletActionContext.getServletContext().setAttribute(key, value);
	}

	public Object getApplicationAttribute(String key) {
		return ServletActionContext.getServletContext().getAttribute(key);
	}

	public void setSessionAttribute(String key, Object value) {
		ServletActionContext.getRequest().getSession().setAttribute(key, value);
	}

	public Object getSessionAttribute(String key) {
		return ServletActionContext.getRequest().getSession().getAttribute(key);
	}

	public void setRequestAttribute(String key, Object value) {
		ServletActionContext.getRequest().setAttribute(key, value);
	}

	public Object getRequestAttribute(String key) {
		return ServletActionContext.getRequest().getAttribute(key);
	}

	/**
	 * 
	 * @return
	 * @throws Exception
	 * @Function : 不同子系统切换入口
	 */
	public String switchData() throws Exception {
		return "switch";
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	protected String[] parseId() {
		if (StringUtils.isNullString(id))
			return null;
		else
			return id.split(", |,");
	}

//	protected User getLoginUser() {
//		return (User) this.getSessionAttribute(Constants.USER);
//	}
	
	@Override
	public void prepare() throws Exception {

	}


	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public List<News> getTodayNewsList() {
		return todayNewsList;
	}

	public void setTodayNewsList(List<News> todayNewsList) {
		this.todayNewsList = todayNewsList;
	}
	
	public String getTodayNewsCode(){
		return todayNewsCode;
	}	

}
