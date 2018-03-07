package donghyeon.rcms.user.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;
import donghyeon.rcms.user.mypage.service.MyPageService;

@Controller
public class MyPageController {
	@Autowired MyPageService myPageService;
	
	
	@RequestMapping(value="myPage", method=RequestMethod.GET)
	public String userMypage(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		return "user/mypage/myPage";
	}
	
	@ResponseBody
	@RequestMapping("myPageModifyPw")
	public String modifyPw(String userPw, HttpSession session){
		String msg ="";
		User user = (User)session.getAttribute("user");
		user.setUserPw(userPw);
		if(myPageService.modifyPw(user)){
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
		if(myPageService.modifyEmail(user)){
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
		if(myPageService.modifyHp(user)){
			msg = "success";
			return msg;
		}else{
			msg = "err";
			return msg;
		}
	}
	
	@RequestMapping(value="userSecedePage", method=RequestMethod.GET)
	public String userSecedePage(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		return "user/mypage/userSecede";
	}
	
	//예약관리
	@RequestMapping("userReservPage")
	public String userReservPage(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		return "user/mypage/userReservation";
	}
	
	//로그인한 유저의 예약목록
	@ResponseBody
	@RequestMapping(value="reservList")
	public List<Reservation> reservList(String userId){
		return myPageService.getReservations(userId);
	}
	
	//예약 상세보기
	@ResponseBody
	@RequestMapping(value="reservDetail")
	public ReservationDetail getReservationDetail(Reservation reservation){
		return myPageService.getReservDetail(reservation);
	}
	
	//예약취소
	@ResponseBody
	@RequestMapping(value="reservDelete")
	public boolean reservDelete(Reservation reservation){
		return myPageService.delReservation(reservation);
	}
	
	//회원탈퇴
	@ResponseBody
	@RequestMapping(value="userSecede")
	public String userSecede(HttpSession session,String userPw){
		User user = (User)session.getAttribute("user");
		
		if(!userPw.equals(user.getUserPw())){
			return "secedeFail";	
		}else{
			myPageService.secedeUser(user.getUserId());
			return "secedeSuccess";
		}
	}
}
