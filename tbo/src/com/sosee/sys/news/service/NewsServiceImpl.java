package com.sosee.sys.news.service;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.news.dao.NewsDao;
import com.sosee.sys.news.pojo.News;
import com.sosee.util.Constants;
import com.sosee.util.DateUtil;

/**
 * 
 * @author liuang
 *
 */
public class NewsServiceImpl implements NewsService {

	private NewsDao newsDao;

	public void setNewsDao(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	public NewsDao getNewsDao() {
		return newsDao;
	}

	@Override
	public void addNews(News news) {
		// TODO Auto-generated method stub
		newsDao.create(news);
	}

	@Override
	public void deleteNews(News news) {
		// TODO Auto-generated method stub
		newsDao.delete(news);
	}

	@Override
	public News queryNewsById(Serializable id) {
		// TODO Auto-generated method stub
		return newsDao.queryById(id);
	}

	@Override
	public void updateNews(News news) {
		// TODO Auto-generated method stub
		newsDao.update(news);
	}

	public List<News> queryNews(News news, Page page) {
		// TODO Auto-generated method stub
		if(news==null){
			return newsDao.queryForList("from News order by isTop desc,createTime desc", page);
		}
		StringBuffer hsql = new StringBuffer();
		List<Object> paramList = new ArrayList<Object>();
		hsql.append("from News where 1=1").append("\r\n");
		if(news.getTitle()!=null && !news.getTitle().equals("")){
			hsql.append(" and title like ?");
			paramList.add(news.getTitle());
		}
		if(news.getTradeId()!=null && !news.getTradeId().getId().equals("")){
			hsql.append(" and tradeId.id = ?");
			paramList.add(news.getTradeId().getId());
		}
		if(news.getItemsId()!=null && !news.getItemsId().getId().equals("")){
			hsql.append(" and itemsId.id = ?");
			paramList.add(news.getItemsId().getId());
		}
		if(news.getLeagueId()!=null && !news.getLeagueId().getId().equals("")){
			hsql.append(" and leagueId.id = ?");
			paramList.add(news.getLeagueId().getId());
		}
		if(news.getCityRegionId()!=null && !news.getCityRegionId().getId().equals("")){
			hsql.append(" and cityRegionId.id = ?");
			paramList.add(news.getCityRegionId().getId());
		}
		
		if(news.getCreateTime()!=null){
			hsql.append(" and createTime >= ?");
			paramList.add(news.getCreateTime());
		}
		if(news.getModifyTime()!=null){
			hsql.append(" and createTime <=? ");
			paramList.add(news.getModifyTime());
		}
		if(news.getStatus()!=null && !news.getStatus().equals("")){
			hsql.append(" and status =? ");
			if(news.getStatus().equals("0")){
				paramList.add(Constants.MEMBERNEWS_STATUS_3);
			}else if(news.getStatus().equals("1")){
				paramList.add(Constants.MEMBERNEWS_STATUS_1);
			}else{
				paramList.add(Constants.MEMBERNEWS_STATUS_2);
			}
		}else{
			hsql.append(" and status =? ");
			paramList.add(Constants.MEMBERNEWS_STATUS_3);
		}
		hsql.append(" order by isTop desc,createTime desc ");
		return newsDao.queryForList(hsql.toString(), paramList.toArray(), page);
	}
	@Override
	public List<News> queryNewsBack(News news, Page page,Items items) {
		// TODO Auto-generated method stub
		if(news==null && items==null){
			return newsDao.queryForList("from News order by isTop desc,createTime desc", page);
		}
		StringBuffer hsql = new StringBuffer();
		List<Object> paramList = new ArrayList<Object>();
		hsql.append("from News where 1=1").append("\r\n");
		if(items!=null && !items.getId().equals("")){
			hsql.append(" and itemsId.id = ?");
			paramList.add(items.getId());
		}
		if(news!=null && news.getTradeId()!=null && !news.getTradeId().getId().equals("")){
			hsql.append(" and tradeId.id = ?");
			paramList.add(news.getTradeId().getId());
		}
		if(news!=null && news.getItemsId()!=null && !news.getItemsId().getId().equals("")){
			hsql.append(" and itemsId.id = ?");
			paramList.add(news.getItemsId().getId());
		}
		if(news!=null && news.getLeagueId()!=null && !news.getLeagueId().getId().equals("")){
			hsql.append(" and leagueId.id = ?");
			paramList.add(news.getLeagueId().getId());
		}
		if(news!=null && news.getCityRegionId()!=null && !news.getCityRegionId().getId().equals("")){
			hsql.append(" and cityRegionId.id = ?");
			paramList.add(news.getCityRegionId().getId());
		}
		
		if(news!=null && news.getCreateTime()!=null){
			hsql.append(" and createTime >= ?");
			paramList.add(DateUtil.parseDateTime2(DateUtil.formatDate(news.getCreateTime())+" 00:00:00"));
		}
		if(news!=null && news.getModifyTime()!=null){
			hsql.append(" and createTime <=? ");
			paramList.add(DateUtil.parseDateTime2(DateUtil.formatDate(news.getModifyTime())+" 23:59:59"));
		}
		if(news!=null && news.getTitle()!=null && !news.getTitle().equals("")){
			hsql.append(" and title like '%"+news.getTitle()+"%' ");
			//paramList.add(news.getTitle());
		}
		if(news!=null && news.getStatus()!=null && !news.getStatus().equals("")){
			hsql.append(" and status =? ");
			if(news.getStatus().equals("0")){
				paramList.add(Constants.MEMBERNEWS_STATUS_3);
			}else if(news.getStatus().equals("1")){
				paramList.add(Constants.MEMBERNEWS_STATUS_1);
			}else{
				paramList.add(Constants.MEMBERNEWS_STATUS_2);
			}
		}
		hsql.append(" order by isTop desc,createTime desc ");
		return newsDao.queryForList(hsql.toString(), paramList.toArray(), page);
	}

	@Override
	public List<News> queryNewsByItemCode(String code, Page page) {
		// TODO Auto-generated method stub
		return newsDao.queryForList("from News where itemsId.code like '"+code+"%' and status='"+Constants.STATUS_1+"'  order by isTop desc,createTime desc", page);
	}


	@Override
	public List<News> queryNewsByItems(Items items) {
		// TODO Auto-generated method stub
		return newsDao.queryAll("from News where itemsId.id='"+items.getId()+"'");
	}

	@Override
	public List<News> queryNewsByItemCode(String code, String sql, Page page) {
		// TODO Auto-generated method stub
		String hql = "from News where itemsId.code like '"+code+"%'  and status='"+Constants.STATUS_1+"' "+(sql==null?"":sql)+" order by createTime desc";
		return newsDao.queryForList(hql, page);
	}

	@Override
	public List<News> queryNewsByItemCode(String code, String sql, Page page,String sortSql) {
		// TODO Auto-generated method stub
		String hql = "from News where itemsId.code like '"+code+"%'  and status='"+Constants.STATUS_1+"' "+(sql==null?"":sql)+" "+sortSql;
		return newsDao.queryForList(hql, page);
	}

	@Override
	public int getNewsCount(String sql) {		
		return Integer.parseInt(newsDao.queryForObject(sql, null).toString());
	}

	@Override
	public List<News> queryNewsByHql(String hql,Page page) {
		if(page!=null && !page.equals("")){
			return newsDao.queryForList(hql, page);
		}else{
			return newsDao.queryAll(hql);
		}
	}	
}

