package com.pcmanager.reply.service;

import java.util.List;

import com.pcmanager.reply.dao.ReplyDao;
import com.pcmanager.reply.vo.ReplyVO;

public class ReplyServiceImple implements ReplyService {

	private ReplyDao replyDao;
	public void setReplyDao(ReplyDao replyDao) {
		this.replyDao = replyDao;
	}
	
	@Override
	public boolean createReply(ReplyVO replyVO) {
		return replyDao.insertReply(replyVO) > 0;
	}

	@Override
	public boolean deleteReply(int replyId) {
		return replyDao.deleteReply(replyId) > 0;
	}

	@Override
	public List<ReplyVO> readAllReplies(ReplyVO replyVO) {
		return replyDao.selectAllReplies(replyVO);
	}

	@Override
	public ReplyVO readReply(int replyId) {
		return replyDao.selectReply(replyId);
	}

	@Override
	public boolean updateReply() {
		// TODO Auto-generated method stub
		return false;
	}

}
