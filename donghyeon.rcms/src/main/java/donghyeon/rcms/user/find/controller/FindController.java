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
	
	@ResponseBody
	@RequestMapping(value="/findId",produces = "application/text; charset=utf8")
	public String findId(FindInfo fInfo){
		User user = findService.idCheck(fInfo);
		if(user!=null){
			if(1==SendMail.sendInquiryAnswer(user.getUserEmail(), "ID/PW 찾기 메일 입니다.", "회원님의 아이디는 "+user.getUserId()
					+"입니다. ")){
			return "true";
			}else{
				return "";
			}
		}
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value="/findPw",produces = "application/text; charset=utf8")
	public String findPw(FindInfo fInfo){
		User user=findService.pwCheck(fInfo);
		if(user!=null){
			if(1==SendMail.sendInquiryAnswer(user.getUserEmail(), "ID/PW 찾기 메일 입니다.", "회원님의 비밀번호는 "+user.getUserPw()
					+"입니다. ")){
				System.out.println(SendMail.sendInquiryAnswer(user.getUserEmail(), "ID/PW 찾기 메일 입니다.", "회원님의 비밀번호는 "+user.getUserPw()
						+"입니다. ")+"보냄");
					return "true";
			}else{
				return "";
			}
		}
		return "";
	}
}
