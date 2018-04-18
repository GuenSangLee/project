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
		return getSqlSession().update("UserDao.updateData", userVO);
	}

	@Override
	public String selectSalt(String email) {
		return getSqlSession().selectOne("UserDao.selectSalt", email);
	}

	@Override
	public int selectCountUserEmail(String userEmail) {
		return getSqlSession().selectOne("UserDao.selectCountUserEmail", userEmail);
	}

	@Override
	public int selectCountUserNickname(String userNickname) {
		return getSqlSession().selectOne("UserDao.selectCountUserNickname", userNickname);
	}

	@Override
	public int insertLoginLocation(UserVO userVO) {
		return getSqlSession().insert("UserDao.insertLoginLocation", userVO);
	}

	@Override
	public String selectLastLoginLocation(int userId) {
		return getSqlSession().selectOne("UserDao.selectLastLoginLocation", userId);
	}

}
