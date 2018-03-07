package donghyeon.rcms.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.admin.service.AdminService;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.common.service.PageService;
import donghyeon.rcms.reservation.service.ReservationService;

@Controller
public class AdminController {
	@Autowired private AdminService adminService;
	@Autowired private ReservationService reservationService;
	@Autowired private PageService pageService;
	
	//메인화면관리
	@RequestMapping("adminMain")
	public String adminMain(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		if(user.getClassCode()==1){
			return "redirect:/";
		}
		return "admin/adminMain";
	}
	
	//차량관리
	@RequestMapping("adminCarMng")
	public String adminCarMng(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		if(user.getClassCode()==1){
			return "redirect:/";
		}
		
		Page myPage=null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();

		pageService.setCarPageServiceImpl(5, myPage);
		request.setAttribute("pageMaker", pageService);
		request.setAttribute("cars", adminService.getCars(myPage));
		
		return "admin/adminCarMng";
	}
	
//	@RequestMapping("getCars")
//	@ResponseBody
//	public List<Car> getCars(){
//		return adminService.getCars();
//	}
	
	//차량등록
	@RequestMapping(value="upload/addCar" , method=RequestMethod.POST)
	@ResponseBody
	public boolean AdminCarAdd(HttpServletRequest request, Car car){
		System.out.println(car);
		//원래파일이름
		String fileName = car.getUploadFile().getOriginalFilename();
		
		//저장경로
		String dir = request.getSession().getServletContext().getRealPath("WEB-INF/resource/img");
		car.setCarImgName(fileName);
		save(dir +"/"+ fileName, car.getUploadFile());
		return adminService.addCar(car);
	}
	
	//차량 수정
	@RequestMapping(value="updateCar")
	@ResponseBody
	public boolean adminCarUpdate(Car car){
		return adminService.updateCar(car);
	}
	
	//차량 삭제
	@RequestMapping(value="deleteCar")
	@ResponseBody
	public boolean adminCarUpdate(int carNum){
		return adminService.deleteCar(carNum);
	}
	
	//차량 검색
	@RequestMapping(value="searchCars")
	@ResponseBody
	public List<Car> searchCars(Car car){
		return adminService.searchCar(car);
	}
	
	//회원관리
	@RequestMapping("adminUserMng")
	public String adminUserMng(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		if(user.getClassCode()==1){
			return "redirect:/";
		}
		
		Page myPage=null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();
		
		pageService.setUserPageServiceImpl(5, myPage);
		request.setAttribute("pageMaker", pageService);
		request.setAttribute("users", adminService.getUsers(myPage));
		
		return "admin/adminUserMng";
	}
	
	//회원들 목록 ajax
//	@RequestMapping("getUsers")
//	@ResponseBody
//	public List<User> getUsers(){
//		return adminService.getUsers();
//	}
	
	@RequestMapping("userDelete")
	@ResponseBody
	public boolean userDelete(String userId){
		return adminService.deleteUser(userId);
	}
	
	//검색
	@RequestMapping("userSearch")
	@ResponseBody
	public List<User> getUsers(Search search){
		return adminService.getUsers(search);
	}
	
	//캐러셀 이미지목록 ajax
	@RequestMapping("carouselList")
	@ResponseBody
	public List<UploadImage> AdminMainCarousel(){
		return adminService.getUploadImages();
	}
	
	//캐러셀 삭제
	@RequestMapping("carouselDelete")
	@ResponseBody
	public String AdminMainCarouselDelete(String fileName){
		adminService.deleteImage(fileName);
		return "msg";
	}
	
	//캐러셀 이미지추가
	@ResponseBody
	@RequestMapping(value="upload/carouselAdd", method=RequestMethod.POST)
	public String AdminMainCarouselAdd(MultipartFile uploadFile, HttpServletRequest request){
		String fileName = uploadFile.getOriginalFilename();
		if(adminService.imageNameCheck(fileName)){
			return "duplicate";
		}
		
		String dir = request.getSession().getServletContext().getRealPath("WEB-INF/resource/img");
		UploadImage uploadImage = new UploadImage();
		uploadImage.setImgTitle(request.getParameter("imgTitle"));
		uploadImage.setImgName(uploadFile.getOriginalFilename());
		adminService.addImage(uploadImage);
		save(dir +"/"+ fileName, uploadFile);
		return "success";
	}
	
	private void save(String fileFullName, MultipartFile uploadFile){
		try{
			uploadFile.transferTo(new File(fileFullName));
		}catch(IOException e){
			e.printStackTrace();
		}
	}
	

	@RequestMapping(value="recommendList", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap AdminCarList(){
		ModelMap carList = new ModelMap();
		carList.addAttribute("nomalCar", adminService.getRecoCars(0));
		carList.addAttribute("recommendCar", adminService.getRecoCars(1));		
		return carList;
	}

	@RequestMapping(value="recommendCarSave", method = {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String recommendCarSave(@RequestParam(value="nomalCarNums", defaultValue="") List<Integer> nomalCarNums,
		@RequestParam(value="recommendCarNums", defaultValue="") List<Integer> recommendCarNums){
		
		adminService.addRecommendCar(recommendCarNums);
		adminService.reduceRecommendCar(nomalCarNums);
		return "";
	}
	
	@RequestMapping("reservationMng")
	public String reservationMgnt(HttpServletRequest request,HttpSession session){
		User user = (User)session.getAttribute("user");
		if(user==null){
			request.setAttribute("msg", "로그인이 필요합니다.");
			return "forward:login";
		}
		if(user.getClassCode()==1){
			return "redirect:/";
		}
		
		Page myPage=null;
		String currentPage = request.getParameter("currentPage");
		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
		else myPage = new Page();

		pageService.setReservationPageServiceImpl(5, myPage);
		request.setAttribute("pageMaker", pageService);
		request.setAttribute("reservations", adminService.getReservationList(myPage));
		
		return "admin/reservationMng";
	}
	
//	@RequestMapping(value="reservationMng", method=RequestMethod.POST)
//	public String reservationList(HttpServletRequest request,HttpSession session){
//		Page myPage=null;
//		String currentPage = request.getParameter("currentPage");
//		if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
//		else myPage = new Page();
//
//		pageService.setPageServiceImpl(5, myPage);
//		request.setAttribute("pageMaker", pageService);
//		request.setAttribute("reservations", adminService.getReservationList(myPage));
//		
//		return "admin/reservationMng";
//	}
	
	@RequestMapping(value="getReservationInfo", method=RequestMethod.POST)
	@ResponseBody
	public ModelMap getReservationInfo(int reservNum){
		return adminService.getReservation(reservNum);
	}
	
	@RequestMapping(value="carReservationModify", method=RequestMethod.POST)
	@ResponseBody
	public String carReservationModify(Reservation reservation){
		return reservationService.carReservationModify(reservation);
	}
	
	
	@RequestMapping(value="carReservationDelete", method=RequestMethod.POST)
	@ResponseBody
	public String carReservationDelete(int deleteReservNum){
		return reservationService.carReservationDelete(deleteReservNum);
	}
	
	@RequestMapping("getReservationSearchList")
	@ResponseBody
	public List<Reservation> getReservationSearchList(String res){
		return reservationService.getReservationSearchList(res);
	}
	
}
