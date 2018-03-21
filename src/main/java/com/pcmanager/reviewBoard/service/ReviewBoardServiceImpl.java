package com.pcmanager.reviewBoard.service;

import java.util.List;

import com.pcmanager.reviewBoard.dao.ReviewBoardDao;
import com.pcmanager.reviewBoard.vo.ReviewBoardVO;

public class ReviewBoardServiceImpl implements ReviewBoardService {
	private ReviewBoardDao reviewBoardDao;

	public void setReviewBoardDao(ReviewBoardDao reviewBoardDao) {
		this.reviewBoardDao= reviewBoardDao;
	}
	
	@Override
	public int inputBoard(ReviewBoardVO reviewBoardVO) {

		return reviewBoardDao.inputBoard(reviewBoardVO);
	}

	@Override
	public int updateBoard(ReviewBoardVO reviewBoardVO) {
		return reviewBoardDao.updateBoard(reviewBoardVO);
	}

	@Override
	public int removeBoard(int boardId) {
		return reviewBoardDao.removeBoard(boardId);
	}

	@Override
	public List<ReviewBoardVO> selectAll() {
		return reviewBoardDao.selectAll();
	}

	@Override
	public List<ReviewBoardVO> search(int type, String condition) {
		return reviewBoardDao.search(type, condition);
	}

}
