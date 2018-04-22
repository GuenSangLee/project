package com.pcmanager.reply.dao;

import java.util.List;

import com.pcmanager.reply.vo.ReplyVO;

public interface ReplyDao {
	public int insertReply(ReplyVO replyVO);

	public int updateReply(ReplyVO replyVO);

	public ReplyVO selectReply(int replyId);

	public int deleteReply(int replyId);

	public List<ReplyVO> selectAllReplies(ReplyVO replyVO);
}
