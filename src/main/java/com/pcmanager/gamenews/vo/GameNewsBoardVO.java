package com.pcmanager.gamenews.vo;

import java.util.List;

import com.pcmanager.reply.vo.ReplyVO;
import com.pcmanager.user.vo.UserVO;

public class GameNewsBoardVO {
	private UserVO userVO;
	
	public UserVO getUserVO() {
		return userVO;
	}

	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}
	
	

	private int boardId;
	private int userId;
	private String title;
	private String body;
	private int viewCount;
	private String writeDate;
	private List<ReplyVO> replyVO;
	

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the replyVO
	 */
	public List<ReplyVO> getReplyVO() {
		return replyVO;
	}

	/**
	 * @param replyVO the replyVO to set
	 */
	public void setReplyVO(List<ReplyVO> replyVO) {
		this.replyVO = replyVO;
	}

}
