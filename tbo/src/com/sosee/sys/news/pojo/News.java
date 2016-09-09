package com.sosee.sys.news.pojo;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sosee.base.pojo.BaseObject;
import com.sosee.sys.base.pojo.BaseCode;
import com.sosee.sys.base.pojo.CityRegion;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.base.pojo.League;
import com.sosee.sys.base.pojo.Trade;
import com.sosee.sys.user.pojo.User;
/**
 * @author  :outworld
 * @date    :2012-9-25 下午12:52:59
 *@Copyright:2012 outworld Studio Inc. All rights reserved.
 * @function:
 */
@Entity
@Table(name = "t_news")
public class News extends BaseObject {
	private static final long serialVersionUID = 1L;
	private String title;//标题
	private String subTitle;//副标题
	private NewsContents newsContentsId;//新闻内容
	private String source;//来源
	private User creator;//创建人
	private String author;//作者
	private User modifier;//修改人
	private Date modifyTime;//修改日期
	private String status;//状态
	private int browseSum;//浏览次数
	private NewsType newsTypeId;//新闻类型标识
	private Boolean isTop;//是否置顶
	private CityRegion cityRegionId;//所属区域
	private League leagueId;//所属联合会
	private Items itemsId;//所属栏目
	private Trade tradeId;//所属行业
	private BaseCode showLevelId;//新闻显示级别
	private String imageFile;//图片文件名
	private String videoFile;//视频文件名
	private String commDocFile;//普通文本
	private String summary;//摘要
	private Date publishTime;//新闻产生时间
	private String shenheReason;//审批理由
	private Date createTime;				// 创建时间
	
	public News(){}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FshowLevelId")
	public BaseCode getShowLevelId() {
		return showLevelId;
	}
	public void setShowLevelId(BaseCode showLevelId) {
		this.showLevelId = showLevelId;
	}
	
	@Column(name = "Ftitle", length = 200)
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Column(name = "FcommDocFile", length = 200)
	public String getCommDocFile() {
		return commDocFile;
	}
	public void setCommDocFile(String commDocFile) {
		this.commDocFile = commDocFile;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FnewsContentsId")
	public NewsContents getNewsContentsId() {
		return newsContentsId;
	}
	public void setNewsContentsId(NewsContents newsContentsId) {
		this.newsContentsId = newsContentsId;
	}
	
	@Column(name = "Fauthor", length = 30)
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	
	@Column(name = "FmodifyTime", length = 19)
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	
	@Column(name = "FbrowseSum")
	public int getBrowseSum() {
		return browseSum;
	}
	public void setBrowseSum(int browseSum) {
		this.browseSum = browseSum;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FnewsTypeId")
	public NewsType getNewsTypeId() {
		return newsTypeId;
	}
	public void setNewsTypeId(NewsType newsTypeId) {
		this.newsTypeId = newsTypeId;
	}
	
	@Column(name = "FisTop")
	public Boolean getIsTop() {
		return isTop;
	}
	public void setIsTop(Boolean isTop) {
		this.isTop = isTop;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FcityRegionId")
	public CityRegion getCityRegionId() {
		return cityRegionId;
	}
	public void setCityRegionId(CityRegion cityRegionId) {
		this.cityRegionId = cityRegionId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FleagueId")
	public League getLeagueId() {
		return leagueId;
	}
	public void setLeagueId(League leagueId) {
		this.leagueId = leagueId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FitemsId")
	public Items getItemsId() {
		return itemsId;
	}
	public void setItemsId(Items itemsId) {
		this.itemsId = itemsId;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FtradeId")
	public Trade getTradeId() {
		return tradeId;
	}
	public void setTradeId(Trade tradeId) {
		this.tradeId = tradeId;
	}
	
	@Column(name = "FimageFile", length = 200)
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	
	@Column(name = "FvideoFile", length = 200)
	public String getVideoFile() {
		return videoFile;
	}
	public void setVideoFile(String videoFile) {
		this.videoFile = videoFile;
	}
	
	@Column(name = "Fsource", length = 60)
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Fcreator")
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "Fmodifier")
	public User getModifier() {
		return modifier;
	}
	public void setModifier(User modifier) {
		this.modifier = modifier;
	}
	
	@Column(name = "Fstatus", length = 40)
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Column(name = "Fsummary")
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@Column(name = "FpublishTime", length = 19)
	public Date getPublishTime() {
		return publishTime;
	}
	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}
	
	@Column(name = "FsubTitle", length = 200)
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	@Column(name = "FshenheReason", length = 200)
	public String getShenheReason() {
		return shenheReason;
	}
	public void setShenheReason(String shenheReason) {
		this.shenheReason = shenheReason;
	}
	
	@Column(name = "FcreateTime", length = 19)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
}
