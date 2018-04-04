package com.pcmanager.gamenews.web;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.gamenews.vo.GameNewsBoardVO;
import com.pcmanager.user.constants.Member;
import com.pcmanager.user.service.UserService;
import com.pcmanager.user.vo.UserVO;

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
	public ModelAndView viewGameNewsBoard() {
		ModelAndView view = new ModelAndView();
		
		view.setViewName("gamenews/list");
		view.addObject("gameNewsBoardList", gameNewsBoardService.selectAll());
		
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
