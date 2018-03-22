package com.pcmanager.user.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pcmanager.user.vo.UserVO;

public class UserDaoImplForOracle  extends SqlSessionDaoSupport implements UserDao {

	@Override
	public List<UserVO> selectAll() {
		return getSqlSession().selectList("UserDao.selectAll");
	}

	@Override
	public int insertUser(UserVO userVO) {
		return getSqlSession().insert("UserDao.insertUser", userVO);
	}

	@Override
	public int removeData(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserVO selectOne(UserVO userVO) {
		return getSqlSession().selectOne("UserDao.selectOne", userVO);
	}

	@Override
	public int updateData(UserVO userVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}