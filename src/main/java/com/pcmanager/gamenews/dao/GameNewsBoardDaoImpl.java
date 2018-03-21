package com.pcmanager.gamenews.dao;

import java.util.ArrayList;
import java.util.List;

import com.pcmanager.gamenews.vo.GameNewsBoardVO;

public class GameNewsBoardDaoImpl implements GameNewsBoardDao {
	private List<GameNewsBoardVO> gameNewsBoardList;
	
	public GameNewsBoardDaoImpl() {
		gameNewsBoardList= new ArrayList<GameNewsBoardVO>();
	}

	@Override
	public int inputBoard(GameNewsBoardVO gameNewsBoardVO) {

		gameNewsBoardVO.setBoardId(gameNewsBoardList.size()+ 1);
		gameNewsBoardList.add(gameNewsBoardVO);
		return 1;
	}

	@Override
	public int updateBoard(GameNewsBoardVO gameNewsBoardVO) {
		for(GameNewsBoardVO gameNewsBoard : gameNewsBoardList) {
			if(gameNewsBoard.getBoardId() == gameNewsBoard.getBoardId()) {
				gameNewsBoard = gameNewsBoardVO;
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int removeBoard(int boardId) {
		for(GameNewsBoardVO gameNewsBoard : gameNewsBoardList) {
			if(gameNewsBoard.getBoardId() == boardId) {
				gameNewsBoardList.remove(gameNewsBoard);
				return 1;
			}
		}
		return 0;
	}

	@Override
	public List<GameNewsBoardVO> selectAll() {
		return gameNewsBoardList;
	}

	@Override
	public List<GameNewsBoardVO> search(int type, String condition) {
		List<GameNewsBoardVO> searchBoardList= new ArrayList<GameNewsBoardVO>();
		//검색 조건이 제목일 경우.
		if(type == 1) {
			for(GameNewsBoardVO gameNewsBoard : gameNewsBoardList) {
				if(condition == gameNewsBoard.getTitle()) { 
						searchBoardList.add(gameNewsBoard);
				}
			}
		//검색 조건이 작성자일 경우.	
		}else if(type == 2) {
			for(GameNewsBoardVO gameNewsBoard : gameNewsBoardList) {
				if(condition == gameNewsBoard.getUserNickname()) { 
						searchBoardList.add(gameNewsBoard);
				}
			}
		}
		return searchBoardList;
	}

	@Override
	public GameNewsBoardVO selectOne(int id) {
		for(GameNewsBoardVO gameNewsBoard : gameNewsBoardList) {
			if(id == gameNewsBoard.getBoardId()) { 
					return gameNewsBoard;
			}
		}
		return null;
	}
	

}
