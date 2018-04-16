package com.pcmanager.gamenews.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.gamenews.vo.GameNewsBoardSearchVO;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;
import com.pcmanager.user.constants.Member;
import com.pcmanager.user.service.UserService;
import com.pcmanager.user.vo.UserVO;

import io.github.seccoding.web.pager.explorer.PageExplorer;

@Controller
public class GameNewsBoardController {
	private GameNewsBoardService gameNewsBoardService;
	private UserService userService;
	
	public void setGameNewsBoardService(GameNewsBoardService gameNewsBoardService) {
		this.gameNewsBoardService = gameNewsBoardService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	
	@RequestMapping("/gamenews/list")
	public ModelAndView viewGameNewsBoard(GameNewsBoardSearchVO gameNewsBoardSearchVO, HttpSession session) {
		ModelAndView view = new ModelAndView();
		
//		view.setViewName("gamenews/list");
//		view.addObject("gameNewsBoardList", gameNewsBoardService.selectAll());
//		return view;
		
		if( gameNewsBoardSearchVO.getPageNo() < 0) {
			//Session에 저장된 CommunitySearchVO를 가져옴
			//Session에 저장된 CommunitySearchVO가 없을 경우, PageNo= 0 으로 초기화.
			gameNewsBoardSearchVO= (GameNewsBoardSearchVO) session.getAttribute("__SEARCH__");
			if (gameNewsBoardSearchVO == null) {
				gameNewsBoardSearchVO= new GameNewsBoardSearchVO();
				gameNewsBoardSearchVO.setPageNo(0);
			}
		}
		
		
		session.setAttribute("__SEARCH__", gameNewsBoardSearchVO);
		view.setViewName("gamenews/list");
		view.addObject("search", gameNewsBoardSearchVO);
		PageExplorer pageExplorer = gameNewsBoardService.getall(gameNewsBoardSearchVO);
		view.addObject("pageExplorer", pageExplorer);
		
		return view;
	}
	@RequestMapping(value="/gamenews/write", method= RequestMethod.GET)
	public String viewGameNewsWritePage() {
		return "gamenews/write";
	}
	
	@RequestMapping(value="/gamenews/write", method= RequestMethod.POST)
	public String doWrite(@ModelAttribute("writeForm") @Valid GameNewsBoardVO gameNewsBoardVO, HttpSession session) {
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		gameNewsBoardVO.setUserId(user.getId());
		
		if( gameNewsBoardService.inputBoard(gameNewsBoardVO) ) {
			return "redirect:/gamenews/list";
		}
		
		return "/";
	}
}
