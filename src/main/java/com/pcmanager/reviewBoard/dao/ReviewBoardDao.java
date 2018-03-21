package com.pcmanager.reviewBoard.dao;

import java.util.List;

import com.pcmanager.reviewBoard.vo.ReviewBoardVO;

public interface ReviewBoardDao {
	public int inputBoard(ReviewBoardVO reviewBoardVO);
	public int updateBoard(ReviewBoardVO reviewBoardVO);
	public int removeBoard(int boardId);
	public List<ReviewBoardVO> selectAll();
	public ReviewBoardVO selectOne(int id);
	public List<ReviewBoardVO> search(int type, String condition);
}
