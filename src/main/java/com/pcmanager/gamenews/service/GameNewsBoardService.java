package com.pcmanager.gamenews.service;

import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

public interface GameNewsBoardService {
	public PageExplorer getall(GameNewsBoardSearchVO gameNewsBoardSearchVO);
	
	public boolean inputBoard(GameNewsBoardVO gameNewsBoardVO);

	public boolean updateBoard(GameNewsBoardVO gameNewsBoardVO);

	public boolean removeBoard(int boardId);

	public List<GameNewsBoardVO> readAll();

	public GameNewsBoardVO readOne(int id);

	public List<GameNewsBoardVO> search(int type, String condition);

	public List<GameNewsBoardVO> selectTop5();
}
