package com.pcmanager.user.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView viewLoginPage(@ModelAttribute("userForm") @Valid UserVO userVO, Errors errors,
			HttpSession session) {
		ModelAndView view = new ModelAndView();

		UserVO userCheck = userService.selectUser(userVO, "signIn");
		if(userCheck == null) {
			System.out.println("아이디체크 실패");
			return new ModelAndView("redirect:/");
		}else {
			session.setAttribute(Member.USER, userCheck);
			System.out.println("로그인");
			System.out.println("접속 위치: " + userVO.getMapAddr());
			return new ModelAndView("redirect:/");		
		}
	}

	// 회원가입
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String viewSignupPage() {
		return "user/signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public ModelAndView doSignup(@ModelAttribute("writeForm") @Valid UserVO userVO, Errors errors,
			HttpServletRequest request) {
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
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public ModelAndView viewModifyPage( HttpSession session) {
		System.out.println("get실행");
		
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		UserVO checkUser= userService.selectUser(user, "modify");
		
		if( checkUser == null ){
			return new ModelAndView("error/404");
		}
		ModelAndView view= new ModelAndView();
		view.setViewName("user/signup");
		view.addObject("userVO", checkUser);
		view.addObject("mode", "modify");
		
		return view;
	}
	
	@RequestMapping(value="/modify/{email}", method=RequestMethod.POST)
	public String doModifyPage(@PathVariable String email, HttpSession session, HttpServletRequest request,  @ModelAttribute("writeForm") @Valid UserVO userVO, Errors errors) {
		System.out.println("modify 시작");
		
		UserVO changeVO= (UserVO) session.getAttribute(Member.USER);
		
		System.out.println(changeVO.getPassword() +" !!!!!!!!!!!!!!!!!");
		
		UserVO originalVO= userService.selectUser(changeVO,"modify");
		System.out.println(originalVO.getEmail());
		
		if(changeVO.getId() != originalVO.getId()) {
			System.out.println("회원 수정 페이지 실행 오류!");
			return "error/404";
		}
		
//		if( errors.hasErrors()) {
//			return "redirect:/modify/";
//		}
		UserVO checkUser= new UserVO();
		checkUser.setId(originalVO.getId());
		checkUser.setEmail(originalVO.getEmail());
//		변경할게 있는지.
		boolean isModify= false;
		
//		2. 제목 변경확인
		if(!originalVO.getPassword().equals(userVO.getPassword())) {
			checkUser.setPassword(userVO.getPassword());
			isModify= true;
		}
		if(!originalVO.getPhoneNum().equals(userVO.getPhoneNum())) {
			checkUser.setPhoneNum(userVO.getPhoneNum());
			isModify= true;
		}
//		3.내용체크
		if(!originalVO.getAddr().equals(userVO.getAddr())) {
			checkUser.setAddr(userVO.getAddr());
			isModify= true;
		}
//		4-2
		if(!originalVO.getNickname().equals(userVO.getNickname())) {
			checkUser.setNickname(userVO.getNickname());
		}
		
		
//		변경여부 체크.
		if(isModify) {
			if(userService.updateData(checkUser)) {
				//업데이트 성공
				return "redirect:/";
			}
		}
		
		return "redirect:/";
		
	}
	
	//login Interceptor에 걸리면
	@RequestMapping("/need/login")
	public String viewLogin() {
		return "user/signin";
	}
	
	//실시간 중복 체크.
	@RequestMapping("/api/exists/email")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsEmail(@RequestParam(required = false, defaultValue = "") String email){
		Map<String, Boolean> response= new HashMap<String, Boolean>();
		
		if(email == null || email.equals("") ) {
			response.put("isEmail", true);
			return response;
		}
		boolean isExists= userService.selectCountUserEmail(email);
		response.put("isEmail", isExists);
		
		System.out.println("이메일 체크..."+ isExists);
		return response;
	}
	
	@RequestMapping("/api/exists/nickname")
	@ResponseBody
	public Map<String, Boolean> apiIsExistsNickname(@RequestParam String nickname){
		boolean isExists= userService.selectCountUserNickname(nickname);
		Map<String, Boolean> response= new HashMap<String, Boolean>();
		response.put("isNickname", isExists);
		
		System.out.println("닉네임 체크..."+ isExists);
		return response;
	}
}
