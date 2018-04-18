package com.pcmanager.gamenews.dao;

import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public interface GameNewsBoardDao {
	
	public int selectCountAll(GameNewsBoardSearchVO gameNewsBoardSearchVO);
	
	public List<GameNewsBoardVO> selectAll(GameNewsBoardSearchVO gameNewsBoardSearchVO);
	
	public int intsertGameNews(GameNewsBoardVO gameNewsBoardVO);

	public int updateGameNews(GameNewsBoardVO gameNewsBoardVO);

	public int removeGameNews(int boardId);

	public List<GameNewsBoardVO> selectAll();

	public GameNewsBoardVO selectOne(int id);

	public List<GameNewsBoardVO> search(int type, String condition);

	public List<GameNewsBoardVO> selectTop5();

}
