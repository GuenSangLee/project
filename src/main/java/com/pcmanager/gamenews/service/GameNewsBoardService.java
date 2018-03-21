package com.pcmanager.gamenews.service;

import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public interface GameNewsBoardService {
	public int inputBoard(GameNewsBoardVO gameNewsBoardVO);
	public int updateBoard(GameNewsBoardVO gameNewsBoardVO);
	public int removeBoard(int boardId);
	public List<GameNewsBoardVO> selectAll();
	public GameNewsBoardVO selectOne(int id);
	public List<GameNewsBoardVO> search(int type, String condition);
//	public List<GameNewsBoardVO> lastest5();
}
