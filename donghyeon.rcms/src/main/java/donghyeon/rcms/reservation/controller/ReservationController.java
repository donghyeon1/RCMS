package donghyeon.rcms.reservation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.reservation.service.ReservationService;

@Controller
public class ReservationController {
	@Autowired ReservationService reservationService;
	
	@RequestMapping("/carList")
	public String greet(HttpServletRequest request,HttpSession session){
//		User user = (User)session.getAttribute("user");
//		if(user==null){
//			request.setAttribute("msg", "로그인이 필요합니다.");
//			return "forward:login";
//		}
		return "reservation/carList";
	}
	
	@ResponseBody
	@RequestMapping("/carTypes")
	public List<Car> getCars(int typeNum){
		return reservationService.getCars(typeNum);
	}
	
	@ResponseBody
	@RequestMapping("/carDetail")
	public ModelMap carDetail(int carNum){
		ModelMap reservInfo = new ModelMap();
		reservInfo.addAttribute("carInfo",reservationService.getCar(carNum));
		reservInfo.addAttribute("disableDate", reservationService.getReservationDateCheck(carNum));
		return reservInfo;
	}
	
	  @ResponseBody
	   @RequestMapping("/carDetails")
	   public Car carDetails(int carNum){
		  System.out.println(carNum+"차넘버");
	      return reservationService.getCarInfo(carNum);
	   }
	
	@ResponseBody
	@RequestMapping("/carReservation")
	public String carReservation(HttpSession session, Reservation reservation){
		User user = (User)session.getAttribute("user");
		if(user==null){
			return "noLogin";
		}
		
		reservation.setUserId(user.getUserId());
		return reservationService.carReservation(reservation);
	}
}
