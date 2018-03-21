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
	public int inputBoard(GameNewsBoardVO gameNewsBoardVO) {
		return gameNewsBoardDao.inputBoard(gameNewsBoardVO);
	}

	@Override
	public int updateBoard(GameNewsBoardVO gameNewsBoardVO) {
		return gameNewsBoardDao.updateBoard(gameNewsBoardVO);
	}

	@Override
	public int removeBoard(int boardId) {
		return gameNewsBoardDao.removeBoard(boardId);
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


}
