package donghyeon.rcms.user.join.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.user.join.domain.UserForm;
import donghyeon.rcms.user.join.service.JoinService;

@Controller
public class JoinController {
	@Autowired private JoinService joinService;
	
	@RequestMapping("/signupForm")
	public String signupForm(){
		return "user/join/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/doubleCheck",method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public String doubleCheck(String userId, HttpServletRequest request){
		String id="";
		if(id!=null) id=userId;
		if(joinService.doubleCheck(id)){
			return "dd";
		}else{
			return null;
		}
	}
	
	@RequestMapping("/signupCheck")
	public String signupCheck(HttpServletRequest request,UserForm uForm){
		System.out.println(uForm.getUserI());
		switch(joinService.signupCheck(uForm)){
			case "success": return "user/join/joinSuccess";
			case "empty":{
				request.setAttribute("error", "입련란을 모두 입력해주세요.");
				return "forward:/signupForm";
			}
			case "pw": {
				request.setAttribute("error", "비밀번호가 일치하지않습니다.");
				return "forward:/signupForm";
			}
			case "pw8":{
				request.setAttribute("error", "비밀번호를 8자리 이상 설정하여주십시오.");
				return "forward:/signupForm";
			}
			default: return "/error";
		}
	}
}
