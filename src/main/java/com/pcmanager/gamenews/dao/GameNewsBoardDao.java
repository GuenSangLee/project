package com.pcmanager.gamenews.dao;

import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public interface GameNewsBoardDao {
	public int inputBoard(GameNewsBoardVO gameNewsBoardVO);
	public int updateBoard(GameNewsBoardVO gameNewsBoardVO);
	public int removeBoard(int boardId);
	public List<GameNewsBoardVO> selectAll();
	public GameNewsBoardVO selectOne(int id);
	public List<GameNewsBoardVO> search(int type, String condition);
}
