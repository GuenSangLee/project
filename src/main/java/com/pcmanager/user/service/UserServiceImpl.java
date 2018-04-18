package com.pcmanager.user.service;

import java.util.List;

import com.pcmanager.user.dao.UserDao;
import com.pcmanager.user.util.SHA256Util;
import com.pcmanager.user.vo.UserVO;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao= userDao;
	}
	
	@Override
	public List<UserVO> readAll() {
		return userDao.selectAll();
	}

	@Override
	public boolean createUser(UserVO userVO) {
		//비밀번호 암호화.
		String salt = SHA256Util.generateSalt();
		String password = SHA256Util.getEncrypt(userVO.getPassword(), salt);
		userVO.setPassword(password);
		userVO.setSalt(salt);
		return userDao.insertUser(userVO) > 0;
	}

	@Override
	public int deleteData(int id) {
		return userDao.removeData(id);
	}	
			
	@Override
	public UserVO readUser(UserVO userVO, String mode) {
		UserVO checkUser= null;
		String salt = userDao.selectSalt(userVO.getEmail());
		if (salt == null) {
			salt = "";
		}

		if(mode.equals("signIn")) {
			String password = userVO.getPassword();
			String checkPassword= SHA256Util.getEncrypt(password, salt);
			userVO.setPassword(checkPassword);

			checkUser= userDao.selectOne(userVO);
			return checkUser;
		}
		checkUser= userDao.selectOne(userVO);
		return checkUser;
	}

	@Override
	public boolean updateData(UserVO userVO) {
		//비밀번호 암호화.
		if(userVO.getPassword() != null) {
			String salt = SHA256Util.generateSalt();
			String password = SHA256Util.getEncrypt(userVO.getPassword(), salt);
			userVO.setPassword(password);
			userVO.setSalt(salt);
		}
		return userDao.updateData(userVO) > 0;
	}

	@Override
	public String readSalt(String email) {
		return userDao.selectSalt(email); 
	}

	@Override
	public boolean readCountUserEmail(String userEmail) {
		return userDao.selectCountUserEmail(userEmail) > 0;
	}

	@Override
	public boolean readCountUserNickname(String userNickname) {
		return userDao.selectCountUserNickname(userNickname) > 0;
	}

	@Override
	public boolean createLoginLocation(UserVO userVO) {
		return userDao.insertLoginLocation(userVO) > 0;
	}

	@Override
	public String readLastLoginLocation(int userId) {
		String lastLoginLocation = userDao.selectLastLoginLocation(userId);
//		if( lastLoginLocation == null || lastLoginLocation == "" ) {
//			return "최근 접속 기록이 없습니다.";
//		}
		return lastLoginLocation;
	}

}
