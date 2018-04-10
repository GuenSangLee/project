package com.pcmanager.user.vo;


public class UserVO {
	
	private int id;
	
	private String email;
	private String password;
	private String nickname;
	private String phoneNum;
	private String addr;
	private String salt;
	private String mapAddr;
	private String latitude;
	private String longitude;
	
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getSalt() {
		return salt;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	/**
	 * @return the mapAddr
	 */
	public String getMapAddr() {
		return mapAddr;
	}
	/**
	 * @param mapAddr the mapAddr to set
	 */
	public void setMapAddr(String mapAddr) {
		this.mapAddr = mapAddr;
	}



}
