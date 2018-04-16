package com.pcmanager.user.service;

import java.util.List;

import com.pcmanager.user.vo.UserVO;

public interface UserService {
	public List<UserVO> readAll();
	public boolean createUser(UserVO userVO);
	public int removeData(int id);
	public UserVO readUser(UserVO userVO, String mode);
	public boolean updateData(UserVO userVO);
	public String readSalt(String email);
	public boolean readCountUserEmail(String userEmail);
	public boolean readCountUserNickname(String userNickname);
}
