package com.pcmanager.gamenews.web;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
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
		
		if(!incrementViewCount(id)) {
			return new ModelAndView("error/500");
		}
		GameNewsBoardVO gameNewsBoard= gameNewsBoardService.readOne(id);
		
		view.setViewName("right/gamenews/view");
		view.addObject("gameNewsBoard", gameNewsBoardService.readOne(id));
		System.out.println(gameNewsBoard.getBoardId());
		
		return view;
	}
	@RequestMapping(value="/gamenews/modify/{id}", method=RequestMethod.GET)
	public ModelAndView viewModifyPage(@PathVariable int id, HttpSession session) {
		UserVO userVO= (UserVO) session.getAttribute(Member.USER);
		GameNewsBoardVO gameNewsBoard= gameNewsBoardService.readOne(id);
		
		//유저가 글쓴이인지 체크.
		int userId= userVO.getId();
		if( userId != gameNewsBoard.getUserId() ) {
			return new ModelAndView("error/404");
		}
		
		
		ModelAndView view= new ModelAndView();
		view.setViewName("right/gamenews/write");
		view.addObject("gameNewsBoard", gameNewsBoard);
		view.addObject("mode", "modify");
		
		return view;
	}
	@RequestMapping(value="/gamenews/modify/{id}", method=RequestMethod.POST)
	public String doModifyPage(@PathVariable int id, HttpSession session, HttpServletRequest request
			, @ModelAttribute("writeForm") @Valid GameNewsBoardVO gameNewsBoardVO, Errors errors) {
		
		UserVO userVO= (UserVO) session.getAttribute(Member.USER);
		GameNewsBoardVO originalVO= gameNewsBoardService.readOne(id);
		
		
		if(userVO.getId() != originalVO.getUserId()) {
			return "error/404";
		}
		
		if( errors.hasErrors()) {
			return "redirect:/gamenews/modify/"+id;
		}
		GameNewsBoardVO newGameNewsBoardVO= new GameNewsBoardVO();
		newGameNewsBoardVO.setBoardId(originalVO.getBoardId());
		newGameNewsBoardVO.setUserId(userVO.getId());
		
		boolean isModify= false;
		
		
//		2. 제목 변경확인
		if(!originalVO.getTitle().equals(newGameNewsBoardVO.getTitle())) {
			newGameNewsBoardVO.setTitle(newGameNewsBoardVO.getTitle());
			isModify= true;
		}
//		3.내용체크
		if(!originalVO.getBody().equals(newGameNewsBoardVO.getBody())) {
			newGameNewsBoardVO.setTitle(newGameNewsBoardVO.getBody());
			isModify= true;
		}
//		변경여부 체크.
		if(isModify) {
			gameNewsBoardService.updateBoard(newGameNewsBoardVO);
			return "redirect:/gamenews/view/"+ id;
		}
		
		return "right/gamenews/list";
		
	}
	@RequestMapping("/load/gamenews/write")
	public String viewGameNewsWrite(){
		return "right/gamenews/write";
	}
	
	@RequestMapping("/load/gamenews/list")
	public String viewGameNewsList(){
		return "right/gamenews/list";
	}
	
	private boolean incrementViewCount(int boardId) {
		return gameNewsBoardService.upViewCount(boardId);
	}
}
