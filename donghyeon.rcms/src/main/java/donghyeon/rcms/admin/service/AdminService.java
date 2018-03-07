package donghyeon.rcms.admin.service;

import java.util.List;

import org.springframework.ui.ModelMap;

import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.common.domain.User;

public interface AdminService {
	List<UploadImage> getUploadImages();
	int deleteImage(String imgName);
	int addImage(UploadImage uploadImage);
	boolean imageNameCheck(String imgName);
//	public List<User> getUsers();
	public List<User> getUsers(Page page);
	boolean deleteUser(String userId);
	public List<User> getUsers(Search search);
	public List<Car> getCars(Page page);
	public boolean addCar(Car car);
	public boolean updateCar(Car car);
	public boolean deleteCar(int carNum);
	public List<Car> searchCar(Car car);
	public List<Car> getRecoCars(int recoStatus);
	int addRecommendCar(List<Integer> carNums);
	int reduceRecommendCar(List<Integer> carNums);
//	List<Reservation> getReservationList();
	public List<Reservation> getReservationList(Page page);
	ModelMap getReservation(int reservNum);
}
