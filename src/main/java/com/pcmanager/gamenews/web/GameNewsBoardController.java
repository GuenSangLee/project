package com.pcmanager.gamenews.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;
import com.pcmanager.reply.service.ReplyService;
import com.pcmanager.user.constants.Member;
import com.pcmanager.user.service.UserService;
import com.pcmanager.user.vo.UserVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class GameNewsBoardController {
	private GameNewsBoardService gameNewsBoardService;
	private UserService userService;
	private ReplyService replyService;
	
	public void setGameNewsBoardService(GameNewsBoardService gameNewsBoardService) {
		this.gameNewsBoardService = gameNewsBoardService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	
	
	@RequestMapping("/gamenews/list")
	public ModelAndView viewGameNewsBoard(GameNewsBoardSearchVO gameNewsBoardSearchVO, HttpSession session) {
		ModelAndView view = new ModelAndView();
		
//		view.setViewName("gamenews/list");
//		view.addObject("gameNewsBoardList", gameNewsBoardService.selectAll());
//		return view;
		
		if( gameNewsBoardSearchVO.getPageNo() < 0) {
			//Session에 저장된 CommunitySearchVO를 가져옴
			gameNewsBoardSearchVO= (GameNewsBoardSearchVO) session.getAttribute("__SEARCH__");
			//Session에 저장된 CommunitySearchVO가 없을 경우, PageNo= 0 으로 초기화.
			if (gameNewsBoardSearchVO == null) {
				gameNewsBoardSearchVO= new GameNewsBoardSearchVO();
				gameNewsBoardSearchVO.setPageNo(0);
			}
		}
		
		
		session.setAttribute("__SEARCH__", gameNewsBoardSearchVO);
		view.setViewName("right/gamenews/list");
		view.addObject("search", gameNewsBoardSearchVO);
		PageExplorer pageExplorer = gameNewsBoardService.getall(gameNewsBoardSearchVO);
		view.addObject("pageExplorer", pageExplorer);
		return view;
	}
	@RequestMapping(value="/gamenews/write", method= RequestMethod.GET)
	public String viewGameNewsWritePage() {
		return "right/gamenews/write";
	}
	
	@RequestMapping(value="/gamenews/write", method= RequestMethod.POST)
	public String doWrite(@ModelAttribute("writeForm") @Valid GameNewsBoardVO gameNewsBoardVO, HttpSession session) {
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		gameNewsBoardVO.setUserId(user.getId());
		
		if( gameNewsBoardService.inputBoard(gameNewsBoardVO) ) {
			return "right/gamenews/list";
		}
		return "right/rightmain";
	}
	
	@RequestMapping("/load/gamenews/reset")
	public String viewInitListPage(HttpSession session) {
		session.removeAttribute("__SEARCH__");
		return "redirect:/gamenews/list";
	}
	
	@RequestMapping(value="/gamenews/setting", method= RequestMethod.GET)
	public ModelAndView doRightTop5() {
		ModelAndView view= new ModelAndView();
		
		view.setViewName("right/rightmain");
		view.addObject("gameNewsBoardList", gameNewsBoardService.selectTop5());
		return view;
	}
	
	@RequestMapping("/gamenews/view/{id}")
	public ModelAndView doGameNewsView(@PathVariable int id) {
		ModelAndView view = new ModelAndView();
		
		GameNewsBoardVO gameNewsBoard= gameNewsBoardService.readOne(id);
		
		view.setViewName("right/gamenews/view");
		view.addObject("gameNewsBoard", gameNewsBoardService.readOne(id));
		System.out.println(gameNewsBoard.getBoardId());
		
		return view;
	}
	
	@RequestMapping("/load/gamenews/write")
	public String viewGameNewsWrite(){
		return "right/gamenews/write";
	}
	
	@RequestMapping("/load/gamenews/list")
	public String viewGameNewsList(){
		return "right/gamenews/list";
	}
}
