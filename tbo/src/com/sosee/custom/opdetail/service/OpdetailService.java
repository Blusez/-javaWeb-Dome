package com.sosee.custom.opdetail.service;

import java.io.Serializable;
import java.util.List;

import com.sosee.custom.opdetail.pojo.Opdetail;

public interface OpdetailService {
	
	public Opdetail getOpdetail(Serializable id);
	List<Opdetail> getOpdetailList();
	void add(Opdetail opdetail);
	void update(Opdetail opdetail);
	void delete(String id);
}
