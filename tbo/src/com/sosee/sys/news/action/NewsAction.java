package com.sosee.sys.news.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.rmi.dgc.Lease;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.directwebremoting.WebContextFactory;

import com.sosee.base.action.AbstractAction;
import com.sosee.base.dao.Page;
import com.sosee.sys.base.pojo.BaseCode;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.base.pojo.League;
import com.sosee.sys.base.pojo.Trade;
import com.sosee.sys.base.service.BaseCodeService;
import com.sosee.sys.base.service.CityRegionService;
import com.sosee.sys.base.service.ItemsService;
import com.sosee.sys.base.service.LeagueService;
import com.sosee.sys.base.service.TradeService;
import com.sosee.sys.news.pojo.News;
import com.sosee.sys.news.pojo.NewsContents;
import com.sosee.sys.news.pojo.NewsType;
import com.sosee.sys.news.service.NewsContentsService;
import com.sosee.sys.news.service.NewsService;
import com.sosee.sys.news.service.NewsTypeService;
import com.sosee.sys.user.pojo.User;
import com.sosee.sys.user.pojo.UserRole;
import com.sosee.sys.user.service.UserRoleService;
import com.sosee.util.Constants;
import com.sosee.util.StringUtils;
/**
 * 
 * @author liuang
 *
 */
@SuppressWarnings("serial")
public class NewsAction extends AbstractAction {

	private NewsService newsService;
	private NewsTypeService newsTypeService;
	private NewsContentsService newsContentsService;
	private NewsContents newsContents;
	private List<News> newsList;
	private News news;
	private List<NewsType> newsTypeList;
	private List<Trade> tradeList;
	private TradeService tradeService;
	private List<League> leagueList;
	private LeagueService leagueService;
	private List<Items> itemsList;
	private Items items;
	private ItemsService itemsService;
	private List<CityRegion> cityRegionList;
	private CityRegionService cityRegionService;
	private BaseCodeService baseCodeService;
	private List<BaseCode> newsStateList;
	private List<BaseCode> showLevelList;
	private UserRoleService userRoleService;
	private List<UserRole> userRoleList;
	private boolean boolNewsShenHe = false;
	private String newsId;
	private News queryNews;
	private String treeStyle = "0";//判断是否是乡镇管理员，0显示全部，1只显示乡镇服务业通用栏目
	//专题code
	private String specSubjectCode;
	/*
	 * 多文件上传
	 */
	private File[] upload;//上传文件
	private String[] uploadContentType;//上传文件类型
	private String[] uploadFileName;//上传文件名
	private String savePath;//上传路径
	/*
	 * 单文件上传
	 */
	 private String path;
	 private File myFile;//上传文件
     private String myFileType;//上传文件类型
     private String myFileFileName;//上传文件名
	/**
	 * 下载
	 * @return
	 */
	private String inputPath;
	
	/**
	 * 转向新闻框界面
	 */
	public String switchNewsItemsListFrame(){
		return "switch";
	}
	/**
	 *获取栏目树 
	 */
	public String getNewsItemsTree(){
		User user=(User)this.getSessionAttribute(Constants.USER);
		if(user==null){
			return "login";
		}
		if(user.getAccountType().equals(Constants.USER_TYPE_3)){
			itemsList = itemsService.queryItemsByCode("ITEM01201",new Page(1,100));
			treeStyle="1";
		}else{
			itemsList = itemsService.queryAllItems();
		}
		return "itemtree";
	}
	/**
	 * 转到新闻列表
	 */
	public String getNewsItemsList(){
		User user = (User)getSessionAttribute(Constants.USER);
		if(user==null){
			return "login";
		}
		userRoleList = userRoleService.getUserRoleListByUser(user.getId());
		for(int i=0;i<userRoleList.size();i++){
			if(userRoleList.get(i).getRole().getRoleName().equals(Constants.NEWS_SHENHE)){
				boolNewsShenHe=true;
				break;
			}
		}
		if(id!=null && !id.equals("")){
			items = itemsService.queryItemsById(id);
		}
		leagueList = leagueService.queryAllLeagues();
		tradeList = tradeService.queryAllTrades();
		cityRegionList = cityRegionService.queryAllRegion();
		page.setPageSize(9);
		if(user.getAccountType().equals(Constants.USER_TYPE_3)){	
			treeStyle="1";
			newsList = newsService.queryNewsByHql("from News where "+(items!=null && !items.equals("")?"itemsId.id='"+items.getId()+"'":"itemsId.code like 'ITEM01201%'")
						+" and cityRegionId.id='"+user.getRegion().getId()+"' order by createTime desc", page);
		}else{
			newsList = newsService.queryNewsBack(queryNews, page,items);
		}
		return "list";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String newsadd(){
		User user = (User)getSessionAttribute(Constants.USER);
		if(user==null){
			return "login";
		}
		if(user.getAccountType().equals(Constants.USER_TYPE_3)){
			treeStyle="1";
		}
		news=new News();
		news.setCreateTime(new Date());
		showLevelList = baseCodeService.getBaseCodeByType(Constants.NEWSSHOW_LEVEL);
		newsStateList = baseCodeService.getBaseCodeByType(Constants.NEWSSTATE_CATID);
		items = itemsService.queryItemsById(id);
		if(items.getCode().startsWith("TOPIC")){
			specSubjectCode = items.getCode();
		}
		leagueList = leagueService.queryAllLeagues();
		tradeList = tradeService.queryAllTrades();
		//cityRegionList = cityRegionService.queryAllRegion();
		newsTypeList = newsTypeService.queryAllNewsType();
		return "add";
	}
	

	/**
	 * 添加或更新新闻
	 */
	public String save(){
		User user = (User)getSessionAttribute(Constants.USER);
		if(user==null){
			return "login";
		}
		if(user.getAccountType().equals(Constants.USER_TYPE_3)){
			news.setCityRegionId(user.getRegion());
		}else{
			Items items = itemsService.queryItemsById(news.getItemsId().getId());
			if(items==null || items.equals("") || (items.getCode().length()<9 && !items.getCode().equals("ITEM012")) || (items.getCode().length()>=9 && !items.getCode().substring(0,9).equals("ITEM01201") && !items.getCode().equals("ITEM01204"))){
				CityRegion city=new CityRegion();
				city.setId(Constants.CHINA_CIYT_ID);
				news.setCityRegionId(city);
			}
		}
		if(news==null || news.getId()==null ||StringUtils.isEmptyString(news.getId())){
			if(!StringUtils.isEmptyString(newsContents.getContents())){
				newsContentsService.add(newsContents);
				news.setNewsContentsId(newsContents);
			}else{
				news.setNewsContentsId(null);
			}			
			if(upload!=null){
				try {
					this.upload();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(upload.length==1){
					news.setImageFile("upload/news/"+uploadFileName[0]);
				}
				if(upload.length==2){
					news.setImageFile("upload/news/"+uploadFileName[0]);
					news.setVideoFile("upload/news/"+uploadFileName[1]);
				}
				
			}
			if(myFile!=null){
				try {
					news.setCommDocFile("upload/news/"+this.uploadSingleFile());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(news.getCreateTime()==null || news.getCreateTime().equals("")){
				news.setCreateTime(new Date());
			}
			news.setCreator(((User)getSessionAttribute(Constants.USER)));
			news.setStatus(Constants.MEMBERNEWS_STATUS_1);//未审核的状态
			newsService.addNews(news);
		}else{
			if(news.getNewsContentsId()==null || news.getNewsContentsId().equals("") || news.getNewsContentsId().getId().equals("")){
				if(!StringUtils.isEmptyString(newsContents.getContents())){
					newsContentsService.add(newsContents);
					news.setNewsContentsId(newsContents);
				}else{
					news.setNewsContentsId(null);
				}
			}else{
				NewsContents tempNewsContents = newsContentsService.queryNewsContentById(news.getNewsContentsId().getId());
				tempNewsContents.setContents(newsContents.getContents());
				newsContentsService.update(tempNewsContents);
			}
			if(upload!=null){
				try {
					this.upload();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				if(upload.length==1){
					news.setImageFile("upload/news/"+uploadFileName[0]);
				}
				if(upload.length==2){
					news.setImageFile("upload/news/"+uploadFileName[0]);
					news.setVideoFile("upload/news/"+uploadFileName[1]);
				}
				
			}
			if(myFile!=null){
				try {
					news.setCommDocFile("upload/news/"+this.uploadSingleFile());
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(news.getCreateTime()==null || news.getCreateTime().equals("")){
				news.setCreateTime(new Date());
			}
			news.setModifyTime(new Date());
			news.setStatus(Constants.MEMBERNEWS_STATUS_1);
			news.setModifier(((User)getSessionAttribute(Constants.USER)));
			newsService.updateNews(news);
		}
		news = null;
		errorMessage = "保存成功！";
		return getNewsItemsList();
	}
	/**
	 * 删除
	 * @return
	 */
	public String newsdelete(){
		News newsTemp = newsService.queryNewsById(newsId);
		newsContents = newsTemp.getNewsContentsId();
		if(newsTemp.getImageFile()!=null && !newsTemp.getImageFile().equals("")){
			String imagefile = getSavePath()+"\\"+newsTemp.getImageFile().substring(newsTemp.getImageFile().lastIndexOf("/")+1);
			File file = new File(imagefile);
			
		    if(file.exists()){
		      file.delete();
		    }
		}
		if(newsTemp.getVideoFile()!=null && !newsTemp.getVideoFile().equals("")){
			String videoFile = getSavePath()+"\\"+newsTemp.getVideoFile().substring(newsTemp.getVideoFile().lastIndexOf("/")+1);
			File file = new File(videoFile);
		    if(file.exists()){
		      file.delete();
		    }
		   
		}
		if(newsTemp.getCommDocFile()!=null && !newsTemp.getCommDocFile().equals("")){
			File file = new File(getSavePath()+"\\"+newsTemp.getCommDocFile().substring(newsTemp.getCommDocFile().lastIndexOf("/")+1));
		    if(file.exists()){
		      file.delete();
		    }
		   
		}
		newsService.deleteNews(newsTemp);
		if(newsContents!=null){
			newsContentsService.delete(newsContents);
		}
		errorMessage = "删除成功！";
		return getNewsItemsList();
	} 
	/**
	 * 跳转到编辑页面
	 */
	public String newsedit(){
		User user = (User)getSessionAttribute(Constants.USER);
		if(user==null){
			return "login";
		}
		if(user.getAccountType().equals(Constants.USER_TYPE_3)){
			treeStyle="1";
		}
		showLevelList = baseCodeService.getBaseCodeByType(Constants.NEWSSHOW_LEVEL);
		news = newsService.queryNewsById(newsId);
		if(news.getItemsId().getCode().startsWith("TOPIC")){
			specSubjectCode = news.getItemsId().getCode();
		}
		newsService.updateNews(news);
		newsStateList = baseCodeService.getBaseCodeByType(Constants.NEWSSTATE_CATID);
		leagueList = leagueService.queryAllLeagues();
		tradeList = tradeService.queryAllTrades();
		//cityRegionList = cityRegionService.queryAllRegion();
		newsTypeList = newsTypeService.queryAllNewsType();
		return "edit";
	}
	/**
	 * 跳转到审核页面
	 */
	public String transferToShenHe(){
	
		news  = newsService.queryNewsById(newsId);
		return "shenhe";
	}
	/**
	 * 审核通过
	 */
	public String shenhePass(){
		news.setStatus(Constants.MEMBERNEWS_STATUS_3);
		newsService.updateNews(news);
		return getNewsItemsList();
	}
	/**
	 * 审核未通过
	 */
	public String shenheBack(){
		news.setStatus(Constants.MEMBERNEWS_STATUS_2);
		newsService.updateNews(news);
		return getNewsItemsList();
	}
	/**
	 * 上传
	 * @throws Exception
	 */
	
	 public void  upload() throws Exception
    {
		 FileInputStream fis = null;
		 FileOutputStream fos = null;
    	 String targetDirectory = getSavePath();
    	 File targetFoldFile = new File(targetDirectory);
    	 if (!targetFoldFile.isFile()&&!targetFoldFile.exists()) {
			targetFoldFile.mkdir();
		 }
    	 if (upload!=null) {
	    	File []files = getUpload();
	    	for(int i=0;i<files.length;i++)
	    	{
	    		//以服务器的文件保存地址和原文件名建立上传文件输出流
				String exten = getExtention(uploadFileName[i]);
				String tempfilename = "news" + "_"+i+ new Date().getTime() + exten;
				uploadFileName[i]=tempfilename;
				//path = this.getSavePath() + "\\" + this.getMyFileName();
				fis = new FileInputStream(files[i]);
				fos = new FileOutputStream(this.getSavePath() + "\\" + tempfilename);
				byte[] buffer = new byte[1024];
				int len = 0;
				while ((len = fis.read(buffer)) > 0) {
					fos.write(buffer, 0, len);
				}
	    	}
		}
    	 if(fis!=null){
    		 fis.close();
    		 fis=null;
    	 }
    	if(fos!=null){
    		fos.close();
    		fos=null;
    	}
    	
    }
	   /**
		 * 单文件上传
		 * @throws Exception
		 */
		
		 public String  uploadSingleFile() throws Exception
	    {
			 File files = this.getMyFile();
				String filenames="";
				if (files == null){
					return null;	
				}else{
					if(this.getMyFileFileName()==null){
						return null;
					}
					String exten = getExtention(this.getMyFileFileName());
					filenames = "news_doc" + "_" + new Date().getTime() + exten;
					//path = this.getSavePath() + "\\" + this.getMyFileName();
					FileInputStream fis = new FileInputStream(files);
					FileOutputStream fos = new FileOutputStream(this.getSavePath() + "\\" + filenames);
					byte[] buffer = new byte[1024];
					int len = 0;
					while ((len = fis.read(buffer)) > 0) {
						fos.write(buffer, 0, len);
					}
					if(fis!=null){
						fis.close();
						fis = null;
					}
					if(fos!=null){
						fos.close();
						fos = null;
					}
					return filenames;
				}
	    }
		 
		 private static String getExtention(String fileName) {
				int pos = fileName.lastIndexOf(".");
				return fileName.substring(pos);
			}
		 /*
		  * ajax删除附件
		  */
	public String deleteFile(String newsid,String type){
		try{
		News newsTemp = newsService.queryNewsById(newsid);
			if(type.equals("2")){
				if(newsTemp.getCommDocFile()!=null && !newsTemp.getCommDocFile().equals("")){
					String commDocFile = WebContextFactory.get().getServletContext().getRealPath("/upload/news")+"\\"+newsTemp.getCommDocFile().substring(newsTemp.getCommDocFile().lastIndexOf("/")+1);
					File file = new File(commDocFile);
				    if(file.exists()){
				      file.delete();
				    }
				}
				newsTemp.setCommDocFile(null);
				newsService.updateNews(newsTemp);
				return "success";
			}else if(type.equals("1")){
				if(newsTemp.getVideoFile()!=null && !newsTemp.getVideoFile().equals("")){
					File file = new File(WebContextFactory.get().getServletContext().getRealPath("/upload/news")+"\\"+newsTemp.getVideoFile().substring(newsTemp.getVideoFile().lastIndexOf("/")+1));
				    if(file.exists()){
				      file.delete();
				    }
				}
				newsTemp.setVideoFile(null);
				newsService.updateNews(newsTemp);
				return "success";
			}else{
				
				if(newsTemp.getImageFile()!=null && !newsTemp.getImageFile().equals("")){
					File file = new File(WebContextFactory.get().getServletContext().getRealPath("/upload/news")+"\\"+newsTemp.getImageFile().substring(newsTemp.getImageFile().lastIndexOf("/")+1));
				    if(file.exists()){
				      file.delete();
				    }
				}
				newsTemp.setImageFile(null);
				newsService.updateNews(newsTemp);
				return "success";
			}
		}catch(Exception e){
			return "error";
		}
		
		
	}
	 /**
	  * 下载
	  */
	 public String downloadNews(){
		 news = newsService.queryNewsById(id);
		 inputPath = inputPath+news.getCommDocFile().substring(news.getCommDocFile().lastIndexOf("/"));
		 return "success";
	 }
	 
	 public NewsTypeService getNewsTypeService() {
			return newsTypeService;
		}

		public void setNewsTypeService(NewsTypeService newsTypeService) {
			this.newsTypeService = newsTypeService;
		}

		public List<NewsType> getNewsTypeList() {
			return newsTypeList;
		}

		public void setNewsTypeList(List<NewsType> newsTypeList) {
			this.newsTypeList = newsTypeList;
		}
		public void setInputPath(String value){
			inputPath = value;
		}
		
		/*
		下载用的Action应该返回一个InputStream实例，
		该方法对应在result里的inputName属性值为targetFile
		*/
		public InputStream getTargetFile() throws Exception
		{
			return ServletActionContext.getServletContext().getResourceAsStream(inputPath);
		}
		
		public File[] getUpload() {
			return upload;
		}

		public void setUpload(File[] upload) {
			this.upload = upload;
		}

		public String[] getUploadContentType() {
			return uploadContentType;
		}

		public void setUploadContentType(String[] uploadContentType) {
			this.uploadContentType = uploadContentType;
		}

		public String[] getUploadFileName() {
			return uploadFileName;
		}

		public void setUploadFileName(String[] uploadFileName) {
			this.uploadFileName = uploadFileName;
		}

		public String getSavePath() {
			return ServletActionContext.getServletContext().getRealPath(savePath);
		}

		public void setSavePath(String savePath) {
			this.savePath = savePath;
		}

		public List<BaseCode> getShowLevelList() {
			return showLevelList;
		}

		public void setShowLevelList(List<BaseCode> showLevelList) {
			this.showLevelList = showLevelList;
		}

		public BaseCodeService getBaseCodeService() {
			return baseCodeService;
		}

		public void setBaseCodeService(BaseCodeService baseCodeService) {
			this.baseCodeService = baseCodeService;
		}

		public List<BaseCode> getNewsStateList() {
			return newsStateList;
		}

		public void setNewsStateList(List<BaseCode> newsStateList) {
			this.newsStateList = newsStateList;
		}

		public Items getItems() {
			return items;
		}

		public void setItems(Items items) {
			this.items = items;
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

		public List<Items> getItemsList() {
			return itemsList;
		}

		public void setItemsList(List<Items> itemsList) {
			this.itemsList = itemsList;
		}

		public ItemsService getItemsService() {
			return itemsService;
		}

		public void setItemsService(ItemsService itemsService) {
			this.itemsService = itemsService;
		}

		public List<Trade> getTradeList() {
			return tradeList;
		}

		public void setTradeList(List<Trade> tradeList) {
			this.tradeList = tradeList;
		}

		public TradeService getTradeService() {
			return tradeService;
		}

		public void setTradeService(TradeService tradeService) {
			this.tradeService = tradeService;
		}

		public NewsContents getNewsContents() {
			return newsContents;
		}

		public void setNewsContents(NewsContents newsContents) {
			this.newsContents = newsContents;
		}

		public News getNews() {
			return news;
		}

		public void setNews(News news) {
			this.news = news;
		}

		public List<News> getNewsList() {
			return newsList;
		}

		public void setNewsList(List<News> newsList) {
			this.newsList = newsList;
		}

		public NewsContentsService getNewsContentsService() {
			return newsContentsService;
		}

		public void setNewsContentsService(NewsContentsService newsContentsService) {
			this.newsContentsService = newsContentsService;
		}

		public void setNewsService(NewsService newsService) {
			this.newsService = newsService;
		}

		public NewsService getNewsService() {
			return newsService;
		}
		public UserRoleService getUserRoleService() {
			return userRoleService;
		}
		public void setUserRoleService(UserRoleService userRoleService) {
			this.userRoleService = userRoleService;
		}
		public List<UserRole> getUserRoleList() {
			return userRoleList;
		}
		public void setUserRoleList(List<UserRole> userRoleList) {
			this.userRoleList = userRoleList;
		}
		public String getInputPath() {
			return inputPath;
		}
		public boolean isBoolNewsShenHe() {
			return boolNewsShenHe;
		}
		public void setBoolNewsShenHe(boolean boolNewsShenHe) {
			this.boolNewsShenHe = boolNewsShenHe;
		}
		public String getNewsId() {
			return newsId;
		}
		public void setNewsId(String newsId) {
			this.newsId = newsId;
		}
		public News getQueryNews() {
			return queryNews;
		}
		public void setQueryNews(News queryNews) {
			this.queryNews = queryNews;
		}
		public File getMyFile() {
			return myFile;
		}
		public void setMyFile(File myFile) {
			this.myFile = myFile;
		}
		public String getMyFileType() {
			return myFileType;
		}
		public void setMyFileType(String myFileType) {
			this.myFileType = myFileType;
		}
		
		public String getMyFileFileName() {
			return myFileFileName;
		}
		public void setMyFileFileName(String myFileFileName) {
			this.myFileFileName = myFileFileName;
		}
	
		public String getPath() {
			return path;
		}
		public void setPath(String path) {
			this.path = path;
		}
		public String getSpecSubjectCode() {
			return specSubjectCode;
		}
		public void setSpecSubjectCode(String specSubjectCode) {
			this.specSubjectCode = specSubjectCode;
		}
		public String getTreeStyle() {
			return treeStyle;
		}
		public void setTreeStyle(String treeStyle) {
			this.treeStyle = treeStyle;
		}		
}
