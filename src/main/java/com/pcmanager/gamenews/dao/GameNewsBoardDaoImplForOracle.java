package com.pcmanager.gamenews.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public class GameNewsBoardDaoImplForOracle extends SqlSessionDaoSupport implements GameNewsBoardDao {

	@Override
	public int intsertGameNews(GameNewsBoardVO gameNewsBoardVO) {
		return getSqlSession().insert("GameNewsBoardDao.intsertGameNews", gameNewsBoardVO);
	}

	@Override
	public int updateGameNews(GameNewsBoardVO gameNewsBoardVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeGameNews(int boardId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<GameNewsBoardVO> selectAll() {
		return getSqlSession().selectList("GameNewsBoardDao.selectAll");
	}

	@Override
	public GameNewsBoardVO selectOne(int id) {
		return getSqlSession().selectOne("GameNewsBoardDao.selectOne", id);
	}

	@Override
	public List<GameNewsBoardVO> search(int type, String condition) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<GameNewsBoardVO> selectTop5() {
		return getSqlSession().selectList("GameNewsBoardDao.selectTop5");
	}

	@Override
	public int selectCountAll(GameNewsBoardSearchVO gameNewsBoardSearchVO) {
		return getSqlSession().selectOne("GameNewsBoardDao.selectCountAll", gameNewsBoardSearchVO);
	}

	@Override
	public List<GameNewsBoardVO> selectAll(GameNewsBoardSearchVO gameNewsBoardSearchVO) {
		return getSqlSession().selectList("GameNewsBoardDao.selectAll", gameNewsBoardSearchVO );
	}

}
