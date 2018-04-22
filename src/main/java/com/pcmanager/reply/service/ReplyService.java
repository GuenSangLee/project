package com.pcmanager.reply.service;

import java.util.List;

import com.pcmanager.reply.vo.ReplyVO;

public interface ReplyService {
	public boolean createReply(ReplyVO replyVO);
	
	public boolean deleteReply(int replyId);
	
	public List<ReplyVO> readAllReplies(ReplyVO replyVO);
	
	public ReplyVO readReply(int replyId);
	
	public boolean updateReply();
	
}
