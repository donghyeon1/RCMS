package donghyeon.rcms.user.mypage.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired MyPageService userModifyService;
	
	
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String userMypage(HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "redirect:login";
		}
		return "user/mypage/myPage";
	}
	
	@ResponseBody
	@RequestMapping("myPageModifyPw")
	public String modifyPw(String userPw, HttpSession session){
		String msg ="";
		User user = (User)session.getAttribute("user");
		user.setUserPw(userPw);
		if(userModifyService.modifyPw(user)){
			msg = "success";
			return msg;
		}else{
			msg = "err";
			return msg;
		}
	}
	
	@ResponseBody
	@RequestMapping("myPageModifyEmail")
	public String modifyEmail(String userEmail, HttpSession session){
		String msg ="";
		User user = (User)session.getAttribute("user");
		user.setUserEmail(userEmail);
		if(userModifyService.modifyEmail(user)){
			msg = "success";
			return msg;
		}else{
			msg = "err";
			return msg;
		}
	}
	
	@ResponseBody
	@RequestMapping("myPageModifyHp")
	public String modifyHp(String userHp, HttpSession session){
		String msg ="";
		User user = (User)session.getAttribute("user");
		user.setUserHp(userHp);
		if(userModifyService.modifyHp(user)){
			msg = "success";
			return msg;
		}else{
			msg = "err";
			return msg;
		}
	}
}
