package com.pcmanager.reply.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pcmanager.gamenews.service.GameNewsBoardService;
import com.pcmanager.reply.service.ReplyService;
import com.pcmanager.reply.vo.ReplyVO;
import com.pcmanager.user.constants.Member;
import com.pcmanager.user.service.UserService;
import com.pcmanager.user.vo.UserVO;

@Controller
public class replyController {
	private ReplyService replyService;
	private UserService userService;
	private GameNewsBoardService gameNewsBoardService;
	
	public void setReplyService(ReplyService replyService) {
		this.replyService = replyService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setGameNewsBoardService(GameNewsBoardService gameNewsBoardService) {
		this.gameNewsBoardService = gameNewsBoardService;
	}
	
	@RequestMapping(value="/api/readreply", method= RequestMethod.GET)
	@ResponseBody
	public List<ReplyVO> readReply(ReplyVO replyVO){
		return replyService.readAllReplies(replyVO);
	}
	
	@RequestMapping(value="/api/createreply", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createReply(HttpSession session, ReplyVO replyVO){
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		
		replyVO.setUserId(user.getId());
		
		boolean isSuccess= replyService.createReply(replyVO);
		
		ReplyVO newReply = null;
		
		if(isSuccess) {
			newReply= replyService.readReply(replyVO.getId());
		}
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("status", isSuccess);
		result.put("reply", newReply);
		
		return result;
	}
	
	@RequestMapping(value="/api/delreply/{replyId}", method= RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delReply(@PathVariable int replyId, HttpSession session, ReplyVO replyVO ){
		
		UserVO user= (UserVO) session.getAttribute(Member.USER);
		ReplyVO reply = replyService.readReply(replyId);
		boolean isSuccess= user.getId() == reply.getUserId();
		
		List<ReplyVO> filterReply = null;
		
		
		if(isSuccess) {
			if(replyService.deleteReply(replyId)) {
				filterReply= replyService.readAllReplies(replyVO);
			}
		}else {
			return null;
		}
		
		Map<String, Object> result= new HashMap<String, Object>();
		result.put("status", isSuccess);
		result.put("reply", filterReply);
		
		return result;
	}
	

}
