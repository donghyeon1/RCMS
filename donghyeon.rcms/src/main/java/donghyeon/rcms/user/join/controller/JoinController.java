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
		if(joinService.signupCheck(uForm).equals("success")){
			return "user/join/joinSuccess";
		}else{
			request.setAttribute("errMsg2", "회원가입에 실패했습니다.");
			return "user/join/join";
		}
	}
}
