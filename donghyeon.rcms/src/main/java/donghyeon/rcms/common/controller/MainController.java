package donghyeon.rcms.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	//메인화면
	@RequestMapping("/")
	public String main(){
		return "main";
	}
	
	//오시는길
	@RequestMapping("/tocome")
	public String tocome(){
		return "introduction/tocome";
	}
	
	//인사말
	@RequestMapping("/greet")
	public String greet(){
		return "introduction/greet";
	}
	
	//렌트안내
	@RequestMapping("/rentGuide")
	public String rentGuide(){
		return "guide/rent";
	}
	
	//보험및유의사항
	@RequestMapping("/insuranceGuide")
	public String insuranceGuide(){
		return "guide/insurance";
	}
}