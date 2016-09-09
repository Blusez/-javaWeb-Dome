package com.sosee.sys.base.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.base.dao.Page;
import com.sosee.sys.base.pojo.Items;
import com.sosee.sys.base.pojo.Trade;
/**
 * 
 * @author liuang
 *
 */
public interface TradeService {

	void delete(Trade trade);
	
	List<Trade> queryTradeByItem(Items items);
	
	List<Trade> queryAllTrades();
	
	Trade getTradeById(Serializable id);
	
	void add(Trade trade);
	
	void update(Trade trade);
	
}
