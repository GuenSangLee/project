package com.pcmanager.user.service;

import java.util.List;

import com.pcmanager.user.dao.UserDao;
import com.pcmanager.user.vo.UserVO;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao= userDao;
	}
	
	@Override
	public List<UserVO> selectAll() {
		return userDao.selectAll();
	}

	@Override
	public boolean createUser(UserVO userVO) {
		return userDao.insertUser(userVO) > 0;
	}

	@Override
	public int removeData(int id) {
		return userDao.removeData(id);
	}

	@Override
	public UserVO selectOne(UserVO userVO) {
		return userDao.selectOne(userVO);
	}

	@Override
	public int updateData(UserVO userVO) {
		return userDao.updateData(userVO);
	}

}
