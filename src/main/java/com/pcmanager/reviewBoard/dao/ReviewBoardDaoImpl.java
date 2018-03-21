package com.pcmanager.reviewBoard.dao;

import java.util.ArrayList;
import java.util.List;

import com.pcmanager.reviewBoard.vo.ReviewBoardVO;

public class ReviewBoardDaoImpl implements ReviewBoardDao {
	private List<ReviewBoardVO> reviewBoardList;
	
	public ReviewBoardDaoImpl() {
		reviewBoardList= new ArrayList<ReviewBoardVO>();
	}
	
	@Override
	public int inputBoard(ReviewBoardVO reviewBoardVO) {
		reviewBoardVO.setBoardId(reviewBoardList.size()+ 1);
		reviewBoardList.add(reviewBoardVO);
		return 1;
	}

	@Override
	public int updateBoard(ReviewBoardVO reviewBoardVO) {
		for(ReviewBoardVO reviewBoard : reviewBoardList) {
			if(reviewBoard.getBoardId() == reviewBoardVO.getBoardId()) {
				reviewBoard = reviewBoardVO;
				return 1;
			}
		}
		return 0;
	}

	@Override
	public int removeBoard(int boardId) {
		for(ReviewBoardVO reviewBoard : reviewBoardList) {
			if(reviewBoard.getBoardId() == boardId) {
				reviewBoardList.remove(reviewBoard);
				return 1;
			}
		}
		return 0;
	}

	@Override
	public List<ReviewBoardVO> selectAll() {
		return reviewBoardList;
	}

	@Override
	public List<ReviewBoardVO> search(int type, String condition) {
		List<ReviewBoardVO> searchBoardList= new ArrayList<ReviewBoardVO>();
		//검색 조건이 제목일 경우.
		if(type == 1) {
			for(ReviewBoardVO reviewBoard : reviewBoardList) {
				if(condition == reviewBoard.getTitle()) { 
						searchBoardList.add(reviewBoard);
				}
			}
		//검색 조건이 작성자일 경우.	
		}else if(type == 2) {
			for(ReviewBoardVO reviewBoard : reviewBoardList) {
				if(condition == reviewBoard.getUserNickname()) { 
						searchBoardList.add(reviewBoard);
				}
			}
		}
		return searchBoardList;
	}

	@Override
	public ReviewBoardVO selectOne(int id) {
		for(ReviewBoardVO reviewBoard : reviewBoardList) {
			if(reviewBoard.getBoardId() == id) {
			return reviewBoard;
			}
		}
		return null;
	}
	
}
