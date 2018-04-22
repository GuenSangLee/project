package com.pcmanager.reply.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pcmanager.reply.vo.ReplyVO;

public class ReplyDaoImplForOracle extends SqlSessionDaoSupport implements ReplyDao {

	@Override
	public int insertReply(ReplyVO replyVO) {
		return getSqlSession().insert("ReplyDao.insertReply", replyVO);
	}

	@Override
	public int updateReply(ReplyVO replyVO) {
		return getSqlSession().update("ReplyDao.updateReply", replyVO);
	}

	@Override
	public ReplyVO selectReply(int replyId) {
		return getSqlSession().selectOne("ReplyDao.selectReply", replyId);
	}

	@Override
	public int deleteReply(int replyId) {
		return getSqlSession().update("ReplyDao.deleteReply", replyId);
	}

	@Override
	public List<ReplyVO> selectAllReplies(ReplyVO replyVO) {
		return getSqlSession().selectList("ReplyDao.selectAllReplies", replyVO);
	}

}
