package donghyeon.rcms.admin.service;

import java.util.List;

import org.springframework.ui.ModelMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.admin.dao.AdminDao;
import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.reservation.service.ReservationService;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired AdminDao adminDao;
	@Autowired private ReservationService reservationService;
	
	@Override
	public List<UploadImage> getUploadImages() {
		return adminDao.getUploadImages();
	}
	
	@Override
	public int deleteImage(String imgName){
		return adminDao.deleteImage(imgName);
	}
	
	@Override
	public int addImage(UploadImage uploadImage){
		return adminDao.addImage(uploadImage);
	}
	
	@Override
	public boolean imageNameCheck(String imgName){
		boolean checkResult = false;
		if(adminDao.imageNameCheck(imgName)>0){
			checkResult = true;
			return checkResult;
		}
		return checkResult;
	}
	
//	public List<User> getUsers(){
//		return adminDao.getUsers();
//	}
	public List<User> getUsers(Page page){
		return adminDao.getUsers(page);
	}
	
	public boolean deleteUser(String userId){
		return adminDao.deleteUser(userId);
	}
	
	public List<User> getUsers(Search search){
		return adminDao.getUsers(search);
	}
	
	public List<Car> getCars(Page page){
		return adminDao.getCars(page);
	}
	
	public boolean addCar(Car car){
		return (adminDao.addCar(car)>=1);
	}
	
	public boolean updateCar(Car car){
		return (adminDao.updateCar(car)>=1);
	}
	
	public boolean deleteCar(int carNum){
		return (adminDao.deleteCar(carNum)>=1);
	}
	
	public List<Car> searchCar(Car car){
		return adminDao.searchCar(car);
	}
	
	
	@Override
	public List<Car> getRecoCars(int recoStatus){
		return adminDao.getRecoCars(recoStatus);
	}
	
	@Override
	public int addRecommendCar(List<Integer> recommendCarNums){
		int addResultNum = 0;
		for(int carNum:recommendCarNums){
			addResultNum += adminDao.addRecommendCar(carNum);
		}
		return addResultNum;
	}
	
	@Override
	public int reduceRecommendCar(List<Integer> nomalCarNums){
		int reduceResultNum = 0;
		for(int carNum:nomalCarNums){
			reduceResultNum += adminDao.reduceRecommendCar(carNum);
		}
		return reduceResultNum;
	}

//	@Override
//	public List<Reservation>getReservationList(){
//		return adminDao.getReservationList();
//	}
	
	@Override
	public List<Reservation> getReservationList(Page page){
		return adminDao.getReservationList(page);
	}
	
	@Override
	public ModelMap getReservation(int reservNum){
		ModelMap reservInfoMap = new ModelMap();
		Reservation reservation = adminDao.getReservation(reservNum);
		int carNum = reservation.getCarNum();
		List<String> disableDateAll = reservationService.getReservationDateCheck(carNum);
		List<String> nowReservDates = reservationService.getReservationDate(reservNum);
		
		disableDateAll.removeAll(nowReservDates);
		
		reservInfoMap.addAttribute("reservInfo",reservation);
		reservInfoMap.addAttribute("disableDate", disableDateAll);
		reservInfoMap.addAttribute("carInfo",reservationService.getCar(carNum));
		
		return reservInfoMap;
	}
}
