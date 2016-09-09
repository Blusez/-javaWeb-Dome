package com.sosee.sys.user.dao;

import org.springframework.stereotype.Repository;

import com.sosee.base.dao.AbstractBaseDao;
import com.sosee.sys.user.pojo.User;

/**
 * 
 * 作者： qiangle
 * 创建时间：2011-5-30 上午11:11:43
 * 功能:用户DaoImpl
 */
@SuppressWarnings("unchecked")
@Repository
public class UserDaoImpl extends AbstractBaseDao<User> implements UserDao {

	public UserDaoImpl() {
		super(User.class);
	}

	@Override
	public User getValueByLoginName(String loginName) {
		String hsql="from User where loginName = ?";
		return (User)queryForObject(hsql, new Object[]{loginName});
	}
}
