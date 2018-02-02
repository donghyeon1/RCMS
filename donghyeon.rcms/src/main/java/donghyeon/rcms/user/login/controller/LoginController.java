package donghyeon.rcms.user.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.login.domain.LoginInfo;
import donghyeon.rcms.user.login.service.LoginService;

@Controller
public class LoginController {
	@Autowired LoginService loginService;
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(LoginInfo loginInfo, HttpServletRequest request,HttpSession session){
		User user=loginService.getUser(loginInfo.getUserId(), loginInfo.getUserPw());
		if(user!=null){
		session.setAttribute("user", user);
		return "redirect:/";
		}else{
			request.setAttribute("msg", "입력하신 정보가 틀렸습니다.");
			return "user/login/login";
		}
	}
	
	@RequestMapping("logOut")
	public String logOut(HttpSession session){
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("login")
	public String loginMenu(){
		return "user/login/login";
	}
}
