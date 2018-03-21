package com.pcmanager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.reviewBoard.service.ReviewBoardService;

@Controller
public class PcManagerController {
	private GameNewsBoardService gameNewsBoardService;
	private ReviewBoardService reviewBoardService;
	
	public void setGameNewsBoardService(GameNewsBoardService gameNewsBoardService) {
		this.gameNewsBoardService= gameNewsBoardService;
	}
	public void setReviewBoardService(ReviewBoardService reviewBoardService) {
		this.reviewBoardService= reviewBoardService;
	}
	
	@RequestMapping("/")
	public ModelAndView viewIndexPage() {
		ModelAndView view= new ModelAndView();
		
		view.setViewName("main/index");
		view.addObject("GameNewsBoardService", gameNewsBoardService.selectAll());
		view.addObject("reviewBoardService", reviewBoardService.selectAll());
		
		return view;
	}
}
