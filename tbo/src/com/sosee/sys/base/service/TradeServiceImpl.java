package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.dao.TradeDao;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.base.pojo.Trade;

public class TradeServiceImpl implements TradeService {

	private TradeDao tradeDao;

	public TradeDao getTradeDao() {
		return tradeDao;
	}

	public void setTradeDao(TradeDao tradeDao) {
		this.tradeDao = tradeDao;
	}

	@Override
	public void delete(Trade trade) {
		// TODO Auto-generated method stub
		tradeDao.delete(trade);
	}

	@Override
	public List<Trade> queryTradeByItem(Items items) {
		// TODO Auto-generated method stub
		return tradeDao.queryForList("from Trade where itemId=?", new Object[]{items});
	}

	@Override
	public List<Trade> queryAllTrades() {
		// TODO Auto-generated method stub
		return tradeDao.queryAll("from Trade");
	}

	@Override
	public void add(Trade trade) {
		// TODO Auto-generated method stub
		tradeDao.create(trade);
	}

	@Override
	public Trade getTradeById(Serializable id) {
		// TODO Auto-generated method stub
		return tradeDao.queryById(id);
	}

	@Override
	public void update(Trade trade) {
		// TODO Auto-generated method stub
		tradeDao.update(trade);
	}
	
	
}
