package com.pcmanager.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pcmanager.user.constants.Member;
import com.pcmanager.user.service.UserService;
import com.pcmanager.user.vo.UserVO;

@Controller
public class UserController {
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 로그인을 했다는 상태정보를 가져와서 했다면 리스트를 보여주고 아니면 로그인페이지로 돌아간다.
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public ModelAndView viewLoginPage(@ModelAttribute("writeForm") @Valid UserVO userVO, Errors errors,
			HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ModelAndView view = new ModelAndView();

		// 넘어오는게 없으면 null(누락 상태) or 아이디는 잇으나 값이 없는 상태
//		if (userVO.getId() == null || userVO.getId().length() == 0) {
//			session.setAttribute("status", "emptyId");
//
//			return new ModelAndView("redirect:/");
//		}
//		if (userVO.getPassword() == null || userVO.getPassword().length() == 0) {
//			session.setAttribute("status", "emptyPassword");
//
//			return new ModelAndView("redirect:/");
//		}
		
		UserVO userCheck =(UserVO)userService.readUser(userVO);
		if(userCheck == null) {
			System.out.println("아이디체크 실패");
			return new ModelAndView("redirect:/");
		}else {
			if (userCheck.getPassword().equals(userVO.getPassword())) {
				session.setAttribute(Member.USER, userVO);
				System.out.println("로그인");
				return new ModelAndView("redirect:/");		
			}
		}
		System.out.println("로그인 실패");
		return new ModelAndView("redirect:/");
	}

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String viewSignupPage() {
		return "main/signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView doSignup(@ModelAttribute("writeForm") @Valid UserVO userVO, Errors errors,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		System.out.println(userVO.getPassword());

		// UserVO loginMember = userService.searchData(userVO);
		// session.setAttribute(Member.USER, loginMember);

		if (userService.createUser(userVO)) {
			System.out.println("회원가입");
			return new ModelAndView("redirect:/");
		}
		return new ModelAndView("redirect:/signup");
	}

	@RequestMapping("/logout")
	public String viewLogoutPage(HttpSession session) {
		session.invalidate();
		System.out.println("로그아웃");
		
		return "main/index";
	}
	
	@RequestMapping(value="/modify/{id}", method=RequestMethod.GET)
	public ModelAndView viewModifyPage(@PathVariable int id, HttpSession session) {
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		
		//유저가 글쓴이인지 체크.
		if( user == null ) {
			return new ModelAndView("error/404");
		}
		ModelAndView view= new ModelAndView();
		view.setViewName("main/signup");
		view.addObject("userVO", user);
		view.addObject("mode", "modify");
		
		return view;
	}
	
	

}
