package com.pcmanager.user.dao;

import java.util.List;

import com.pcmanager.user.vo.UserVO;

public interface UserDao {
	public List<UserVO> selectAll();
	public int insertUser(UserVO userVO);
	public int removeData(int id);
	public UserVO selectOne(UserVO userVO);
	public int updateData(UserVO userVO);
	public String selectSalt(String userEmail);
	public int selectCountUserEmail(String userEmail);
	public int selectCountUserNickname(String userNickname);
 }
