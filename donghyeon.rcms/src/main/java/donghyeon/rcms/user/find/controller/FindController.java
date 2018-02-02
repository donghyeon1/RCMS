package donghyeon.rcms.user.find.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import donghyeon.rcms.user.find.service.FindService;

@Controller
public class FindController {
//	@Autowired private FindService findService;
	
	@RequestMapping("/find")
	public String find(){
		return "user/find/find";
	}
	
}
