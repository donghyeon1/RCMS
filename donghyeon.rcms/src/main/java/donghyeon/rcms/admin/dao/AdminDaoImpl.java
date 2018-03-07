package donghyeon.rcms.admin.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.admin.dao.mapper.AdminMapper;
import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.Review;
import donghyeon.rcms.common.domain.User;

@Repository
public class AdminDaoImpl implements AdminDao {
	@Autowired private AdminMapper adminMapper;

	@Override
	public List<UploadImage> getUploadImages() {
		return adminMapper.getUploadImages();
	}
	
	@Override
	public int deleteImage(String imgName){
		return adminMapper.deleteImage(imgName);
	}
	
	@Override
	public int addImage(UploadImage uploadImage){
		return adminMapper.addImage(uploadImage);
	}
	
	@Override
	public int imageNameCheck(String imgName){
		return adminMapper.imageNameCheck(imgName);
	}

//	public List<User> getUsers(){
//		return adminMapper.getUsers();
//	}
	
	public List<User> getUsers(Page page){
		return adminMapper.getUsers(page);
	}
	
	public boolean deleteUser(String userId){
		return adminMapper.deleteUser(userId)>=1; 
	}
	
	public List<User> getUsers(Search search){
		return adminMapper.searchUsers(search);
	}
	
	public List<Car> getCars(Page page){
		return adminMapper.getCars(page);
	}
	
	public int addCar(Car car){
		return adminMapper.addCar(car);
	}
	
	public int updateCar(Car car){
		return adminMapper.updateCar(car);
	}
	
	public int deleteCar(int carNum){
		return adminMapper.deleteCar(carNum);
	}
	
	public List<Car> searchCar(Car car){
		return adminMapper.searchCar(car);
	}
	
	@Override
	public List<Car> getRecoCars(int recoStatus){
		return adminMapper.getRecoCars(recoStatus);
	}
	
	@Override
	public int addRecommendCar(int carNums){
		return adminMapper.addRecommendCar(carNums);
	}
	
	@Override
	public int reduceRecommendCar(int carNums){
		return adminMapper.reduceRecommendCar(carNums);
	}
	
//	@Override
//	public List<Reservation>getReservationList(){
//		return adminMapper.getReservationList();
//	}
	
	@Override
	public List<Reservation> getReservationList(Page page){
		return adminMapper.getReservationList(page);
	}
	
	@Override
	public Reservation getReservation(int reservNum){
		return adminMapper.getReservation(reservNum);
	}
}
