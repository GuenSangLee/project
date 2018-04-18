package com.pcmanager.gamerank.dao;

import java.util.List;

import com.pcmanager.gamerank.vo.GameRankVO;

public interface GameRankDao {
	public List<GameRankVO> selectGameRank();
}
