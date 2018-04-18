package com.pcmanager.gamerank.service;

import java.util.List;

import com.pcmanager.gamerank.dao.GameRankDao;
import com.pcmanager.gamerank.vo.GameRankVO;

public class GameRankServiceImpl implements GameRankService{
	private GameRankDao gameRankDao;
	
	public void setGameRankDao(GameRankDao gameRankDao) {
		this.gameRankDao = gameRankDao;
	}
	
	@Override
	public List<GameRankVO> readGameRank() {
		return gameRankDao.selectGameRank();
	}
	
}
