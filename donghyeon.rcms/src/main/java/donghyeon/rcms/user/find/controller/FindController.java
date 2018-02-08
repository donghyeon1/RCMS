package donghyeon.rcms.user.find.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.find.domain.FindInfo;
import donghyeon.rcms.user.find.service.FindService;
import donghyeon.rcms.user.find.util.SendMail;

@Controller
public class FindController {
	@Autowired private FindService findService;
	
	@RequestMapping("/find")
	public String find(){
		return "user/find/find";
	}
	
	//정보틀렸을때
	@ResponseBody
	@RequestMapping("/findId")
	public String findId(FindInfo fInfo){
		fInfo.setUserEmail("tirran@naver.com");
		fInfo.setUserName("김동현");
		User user = findService.idCheck(fInfo);
		if(user!=null){
			SendMail.sendInquiryAnswer(fInfo.getUserEmail(), "ID/PW 찾기 메일 입니다.", "회원님의 아이디는 "+user.getUserId()
					+"입니다. ");
			return "가입하신 이메일로 id를 발송해드렸습니다. 확인후 로그인 하여주십시오.";
		}
		return "입력하신 정보로 가입한 회원을 찾을수 없습니다.";
	}
	
	@ResponseBody
	@RequestMapping("/findPw")
	public String findPw(FindInfo fInfo){
		User user=findService.pwCheck(fInfo);
		if(user!=null){
			SendMail.sendInquiryAnswer(fInfo.getUserEmail(), "ID/PW 찾기 메일 입니다.", "회원님의 비밀번호는 "+user.getUserPw()
					+"입니다. ");
			return "가입하신 이메일로 비밀번호를 발송해드렸습니다. 확인후 로그인 하여주십시오.";
		}
		return "입력하신 정보로 가입한 회원을 찾을수 없습니다.";
	}
}
