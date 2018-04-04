package com.pcmanager.gamenews.service;

import java.util.ArrayList;
import java.util.List;

import com.pcmanager.gamenews.dao.GameNewsBoardDao;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public class GameNewsBoardServiceImpl implements GameNewsBoardService {
	private GameNewsBoardDao gameNewsBoardDao;
	
	public void setGameNewsBoardDao(GameNewsBoardDao gameNewsBoardDao) {
		this.gameNewsBoardDao= gameNewsBoardDao;
	}
	
	@Override
	public boolean inputBoard(GameNewsBoardVO gameNewsBoardVO) {
		return gameNewsBoardDao.intsertGameNews(gameNewsBoardVO) >0;
	}

	@Override
	public boolean updateBoard(GameNewsBoardVO gameNewsBoardVO) {
		return gameNewsBoardDao.updateGameNews(gameNewsBoardVO) >0;
	}

	@Override
	public boolean removeBoard(int boardId) {
		return gameNewsBoardDao.removeGameNews(boardId) >0;
	}

	@Override
	public List<GameNewsBoardVO> selectAll() {
		return gameNewsBoardDao.selectAll();
	}

	@Override
	public GameNewsBoardVO selectOne(int id) {
		return gameNewsBoardDao.selectOne(id);
	}

	@Override
	public List<GameNewsBoardVO> search(int type, String condition) {
		return gameNewsBoardDao.search(type, condition);
	}

	@Override
	public List<GameNewsBoardVO> selectTop5() {
		return gameNewsBoardDao.selectTop5();
	}


}
