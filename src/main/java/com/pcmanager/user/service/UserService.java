package com.pcmanager.user.service;

import java.util.List;

import com.pcmanager.user.vo.UserVO;

public interface UserService {
	public List<UserVO> selectAll();
	public boolean createUser(UserVO userVO);
	public int removeData(int id);
	public UserVO readUser(UserVO userVO);
	public boolean updateData(UserVO userVO);
}
