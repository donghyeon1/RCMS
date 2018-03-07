package donghyeon.rcms.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.Comment;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.review.service.ReplyService;

@Controller
public class ReplyController {
	@Autowired ReplyService replyService;
    
	//리스트
	@RequestMapping(value="coList")
	@ResponseBody
	public List<Comment> commlist(){ 
		List<Comment> coall = replyService.list();
		return coall;
	}
	
	//등록
	@ResponseBody
	@RequestMapping(value="coInsert")
	public String insert(Comment co, HttpSession session){    	
		User user = (User)session.getAttribute("user"); 		
		co.setUserId(user.getUserId());
		System.out.println(co);
		replyService.create(co);
		return "result";
	 }
	
	@ResponseBody
	@RequestMapping(value="replyDel")
	public String repDel(int commNum ){
		replyService.delete(commNum);
		return "";
	}
    
}