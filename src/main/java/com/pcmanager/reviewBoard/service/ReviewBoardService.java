package com.pcmanager.reviewBoard.service;

import java.util.List;

import com.pcmanager.reviewBoard.vo.ReviewBoardVO;

public interface ReviewBoardService {
	public int inputBoard(ReviewBoardVO reviewBoardVO);
	public int updateBoard(ReviewBoardVO reviewBoardVO);
	public int removeBoard(int boardId);
	public List<ReviewBoardVO> selectAll();
	public List<ReviewBoardVO> search(int type, String condition);
}
