package com.sosee.sys.user.dao;

import com.sosee.base.dao.BaseDao;
import com.sosee.sys.user.pojo.User;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:12:16
 * 功能:用户Dao
 */
public interface UserDao extends BaseDao<User>  {

	User getValueByLoginName(String loginName);
}
