package com.pcmanager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.gamerank.service.GameRankService;
import com.pcmanager.reviewBoard.service.ReviewBoardService;

@Controller
public class PcManagerController {
	private GameNewsBoardService gameNewsBoardService;
	private ReviewBoardService reviewBoardService;
	private GameRankService gameRankService;
	
	public void setGameNewsBoardService(GameNewsBoardService gameNewsBoardService) {
		this.gameNewsBoardService= gameNewsBoardService;
	}
	public void setReviewBoardService(ReviewBoardService reviewBoardService) {
		this.reviewBoardService= reviewBoardService;
	}
	public void setGameRankService(GameRankService gameRankService) {
		this.gameRankService = gameRankService;
	}
	
	@RequestMapping("/")
	public ModelAndView viewIndexPage() {
		ModelAndView view= new ModelAndView();
		
		view.addObject("gameRankList", gameRankService.readGameRank());
		view.setViewName("main/index");
		view.addObject("gameNewsBoardList", gameNewsBoardService.selectTop5());
//		view.addObject("reviewBoardService", reviewBoardService.selectAll());
		
		return view;
	}
	
	@RequestMapping("/rightbody")
	public ModelAndView doRightMain() {
		ModelAndView view= new ModelAndView();
		
		view.setViewName("right/rightmain");
		view.addObject("gameNewsBoardList", gameNewsBoardService.selectTop5());	
//		view.addObject("reviewBoardService", reviewBoardService.selectAll());
		return view;
	}
	
	
}
