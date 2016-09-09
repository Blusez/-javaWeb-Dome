package com.sosee.util;

import java.math.BigDecimal;

/**
 * <pre>
 * 常量类
 * <p/>
 * Author : outworld
 * Date   : 2009-06-02
 * Time   : 09:06:00
 * Version: 1.0
 * </pre>
 */
public final class Constants {
	public static final String USER = "user";//登录用户
	public static final String MEMBER = "member";//登录用户
	public static final String MEMBER_LOGID = "member_log_id";//登录用户
	public static final String MOUDEL = "moudle";//登录用户模块信息
	public static final String LOGINLOG = "loginLog";//登录对象
	
	public static final String JS = "ITEM00201";			//江苏服务业
	public static final String ZG = "ITEM00202";			//中国服务业
	public static final String MANA="ITEM00501";			//会员动态
	public static final String ITEM_CODE_HYYJ="ITEM006"; 	//行业研究编码
	public static final String ITEM_CODE_ZXGG="ITEM00802"; 	//最新公告编码
	public static final String ITEM_CODE_FWYDT="ITEM002"; 	//服务业动态编码
	public static final String ITEM_CODE_FWYJOB="ITEM007"; 	//服务业工作编码
	public static final String ITEM_CODE_DDXX="ITEM00701";	//动态消息
	public static final String ITEM_CODE_JJQ="ITEM00702";	//集聚区
	public static final String ITEM_CODE_ZDXM="ITEM00703";	//重大项目
	public static final String ITEM_CODE_BQQY="ITEM00704";	//百强企业
	public static final String ITEM_CODE_ZCFG="ITEM00705";	//政策法规
	public static final String ITEM_CODE_FWYGH="ITEM00706";	//服务业规划
	public static final String ITEM_CODE_YDZJ="ITEM00707";	//引导资金
	public static final String ITEM_CODE_BZH="ITEM00708";	//标准化
	public static final String ITEM_CODE_XZZQ="ITEM00709";	//下载专区
	
	
	public static final int DEFAULTPAGESIZE=7;//前台模块显示信息条数
	public static final BigDecimal BIGDECIMAL_ZERO = new BigDecimal(0).setScale(2);
	
	//性别
	public static final int SEX_M = 1;// 男
	public static final int SEX_F = 2;// 女
	//权限树session对象
	public static final String USER_AUTHORITY_TREE = "authorityTree";
		
	public static final int GL_INIT_VALUE_0 = 0;//初始化值0	
	//用户状态
	public static final String USER_STATE_1 = "s1";// 启用
	public static final String USER_STATE_2= "s2";// 禁用
	//用户类型
	public static final String USER_TYPE_1="adm";//超级管理员
	public static final String USER_TYPE_2="mana";//管理员
	public static final String USER_TYPE_3="emp";//普通用户
	
	//用户帐目类型
	public static final String MEM_ACCTITEM_TYPE="T_memberAcctItem_FitemId";//用户帐目类型
	//十大行业编码
	public static final String TENTRADECODE="ITEM008";
	//新闻状态
	public static final String NEWSSTATE_CATID="NEWS_STATE";
	//政策法规状态
	public static final String LAWSTATE_CATID="LAW_STATE";
	//新闻显示级别
	public static final String NEWSSHOW_LEVEL="NEWS_SHOWLEVEL";
	//会员类型
	public static final String MEMBERTYPE_CATID="MEMBER_TYPE";
	//会员状态
	public static final String MEMBERSTATE_NORMAL="0"; //正常
	public static final String MEMBERSTATE_FORBID="1"; //禁用
	//会员留言状态
	public static final String MEMBERMESSAGE_STATUS_1 = "未回复";
	public static final String MEMBERMESSAGE_STATUS_2 = "已回复";
	
	//会员新闻状态
	public static final String MEMBERNEWS_STATUS_1 = "未审核";
	public static final String MEMBERNEWS_STATUS_2 = "已退回";
	public static final String MEMBERNEWS_STATUS_3 = "已审核";
	//会员新闻是否已读状态
	public static final String MEMBERNEWS_READSTATUS_1 = "readed";
	public static final String MEMBERNEWS_READSTATUS_2 = "toread";
	//会员新闻分类
	public static final String MEMNEWSTYPEMESS = "MEMNEWSTYPE01";
	public static final String MEMNEWSTYPENOTI = "MEMNEWSTYPE02";
	public static final String MEMNEWSTYPEACTI = "MEMNEWSTYPE03";
	public static final String MEMNEWSTYPE4 = "MEMNEWSTYPE04";
	public static final String MEMNEWSTYPE5 = "MEMNEWSTYPE05";
	//新闻和政策法规状态
	public static final String STATUS_1 = "已审核";
	//新闻审核者
	public static final String NEWS_SHENHE = "新闻审核者";
	

	public static final String ITEM_ID_FWYJOB="1eee82f9308e2fe732113112315ab123"; 
	public static final String ITEM_ID_JJQ="1eee821f34186d34013418d58e51000f";						//集聚区
	public static final String ITEM_ID_ZCFG="1eee821f34186d34013418d58e511301";						//政策法规
	public static final String ITEM_ID_FWYGH="1eee821f34186d34013418d58e511201";					//服务业规划
	public static final String ITEM_ID_YDZJ="1eee821f34186d34013418d58e511203";						//引导资金
	public static final String ITEM_ID_ZDXM="1eee821f34186d34013418d58e511204";						//重大项目
	public static final String ITEM_ID_BZH="1eee821f34186d34013418d58e511205";						//标准化
	public static final String ITEM_ID_XZZQ="1eee821f34186d34013418d58e511206";						//下载专区
	
	//在线调查试卷状态
	public static final String EXAM_STATE_1="s1";//草稿
	public static final String EXAM_STATE_2="s2";//已发布
	public static final String EXAM_STATE_3="s3";//已归档
	
	//江苏现代服务业联合会
	public static final String JSFWY_ID="bd1b29bc358670f30135a39d026e0243";//江苏服务业ID 用于会员新闻的新闻的显示
	
	// 行政区中国ID
	public static final String CHINA_CIYT_ID="7CA766E7-26E0-4FF5-B876-84DEA53F6412"; 
}
