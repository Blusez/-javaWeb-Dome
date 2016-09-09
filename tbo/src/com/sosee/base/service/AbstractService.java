package com.sosee.base.service;

import java.sql.Timestamp;

import org.apache.log4j.Logger;

public abstract class AbstractService {
	public final Logger log = Logger.getLogger(getClass());

	public Timestamp getNowTime() {
		Timestamp now = new Timestamp(System.currentTimeMillis());
		return now;
	}
}
