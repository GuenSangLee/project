package com.pcmanager.user.dao;

import java.util.List;

import com.pcmanager.user.vo.UserVO;

public interface UserDao {
	public List<UserVO> selectAll();
	public int insertUser(UserVO userVO);
	public int removeData(int id);
	public UserVO selectOne(String name);
	public int updateData(UserVO userVO);
 }
