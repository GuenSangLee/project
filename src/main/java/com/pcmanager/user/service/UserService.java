package com.pcmanager.user.service;

import java.util.List;

import com.pcmanager.user.vo.UserVO;

public interface UserService {
	public boolean createUser(UserVO userVO);
	
	public boolean createLoginLocation(UserVO userVO);

	public List<UserVO> readAll();

	public UserVO readUser(UserVO userVO, String mode);

	public String readSalt(String email);

	public boolean readCountUserEmail(String userEmail);

	public boolean readCountUserNickname(String userNickname);
	
	public String readLastLoginLocation(int userId);

	public boolean updateData(UserVO userVO);

	public int deleteData(int id);

}
