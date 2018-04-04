package com.pcmanager.gamenews.service;

import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public interface GameNewsBoardService {
	public boolean inputBoard(GameNewsBoardVO gameNewsBoardVO);
	public boolean updateBoard(GameNewsBoardVO gameNewsBoardVO);
	public boolean removeBoard(int boardId);
	public List<GameNewsBoardVO> selectAll();
	public GameNewsBoardVO selectOne(int id);
	public List<GameNewsBoardVO> search(int type, String condition);
	public List<GameNewsBoardVO> selectTop5();
}
