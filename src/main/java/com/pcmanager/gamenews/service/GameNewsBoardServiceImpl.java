package com.pcmanager.gamenews.service;

import java.util.List;

import com.pcmanager.gamenews.dao.GameNewsBoardDao;
import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;

import io.github.seccoding.web.pager.Pager;
import io.github.seccoding.web.pager.PagerFactory;
import io.github.seccoding.web.pager.explorer.ClassicPageExplorer;
import io.github.seccoding.web.pager.explorer.PageExplorer;

public class GameNewsBoardServiceImpl implements GameNewsBoardService {
	private GameNewsBoardDao gameNewsBoardDao;
	
	public void setGameNewsBoardDao(GameNewsBoardDao gameNewsBoardDao) {
		this.gameNewsBoardDao= gameNewsBoardDao;
	}
	
	@Override
	public boolean inputBoard(GameNewsBoardVO gameNewsBoardVO) {
		String body = gameNewsBoardVO.getBody();
		// \n -> <br/>
		body = body.replace("\n", "<br/>");
		gameNewsBoardVO.setBody(body);
		
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
	public List<GameNewsBoardVO> readAll() {
		return gameNewsBoardDao.selectAll();
	}

	@Override
	public GameNewsBoardVO readOne(int id) {
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

	@Override
	public PageExplorer getall(GameNewsBoardSearchVO gameNewsBoardSearchVO) {
		Pager pager= PagerFactory.getPager(Pager.ORACLE,
				gameNewsBoardSearchVO.getPageNo()+"",
				gameNewsBoardDao.selectCountAll(gameNewsBoardSearchVO));

		PageExplorer pageExplorer= pager.makePageExplorer(ClassicPageExplorer.class
				, gameNewsBoardSearchVO);
		
		pageExplorer.setList(gameNewsBoardDao.selectAll(gameNewsBoardSearchVO));
		
		
		return pageExplorer;
	}


}
