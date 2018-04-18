package com.pcmanager.gamerank.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.pcmanager.gamerank.vo.GameRankVO;

public class GameRankDaoImplForOracle extends SqlSessionDaoSupport implements GameRankDao {
	
	@Override
	public List<GameRankVO> selectGameRank() {
		return getSqlSession().selectList("GameRankDao.selectGameRank");
	}

}
