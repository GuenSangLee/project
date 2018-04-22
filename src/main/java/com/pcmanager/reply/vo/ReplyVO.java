package com.pcmanager.reply.vo;

import com.pcmanager.user.vo.UserVO;

public class ReplyVO {
	private int level;
	
	private int Id;
	private int userId;
	private int boardId;
	private int boardType;
	private String body;
	private String registDate;
	private String modifyDate;
	private int secret;
	private int show;
	private int parentReplyId;
	
	private UserVO userVO;
	
	
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getParentReplyId() {
		return parentReplyId;
	}
	public void setParentReplyId(int parentReplyId) {
		this.parentReplyId = parentReplyId;
	}
	public int getId() {
		return Id;
	}
	public void setId(int replyId) {
		this.Id = replyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String writeDate) {
		this.registDate = writeDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public int getShow() {
		return show;
	}
	public void setShow(int show) {
		this.show = show;
	}
	/**
	 * @return the boardType
	 */
	public int getBoardType() {
		return boardType;
	}
	/**
	 * @param boardType the boardType to set
	 */
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	/**
	 * @return the userVO
	 */
	public UserVO getUserVO() {
		return userVO;
	}
	/**
	 * @param userVO the userVO to set
	 */
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	
	
}
