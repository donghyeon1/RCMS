package donghyeon.rcms.admin.dao;

import java.util.List;

import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.common.domain.User;

public interface AdminDao {
	List<UploadImage> getUploadImages();
	int deleteImage(String imgName);
	int addImage(UploadImage uploadImage);
	int imageNameCheck(String imgName);
//	public List<User> getUsers();
	public List<User> getUsers(Page page);
	public boolean deleteUser(String userId);
	public List<User> getUsers(Search search);
	public List<Car> getCars(Page page);
	public int addCar(Car car);
	public int updateCar(Car car);
	public int deleteCar(int carNum);
	public List<Car> searchCar(Car car);
	public List<Car> getRecoCars(int recoStatus);
	int addRecommendCar(int carNums);
	int reduceRecommendCar(int carNums);
//	List<Reservation> getReservationList();
	public List<Reservation> getReservationList(Page page);
	Reservation getReservation(int reservNum);
}
