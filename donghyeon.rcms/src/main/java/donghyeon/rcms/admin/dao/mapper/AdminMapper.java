package donghyeon.rcms.admin.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import donghyeon.rcms.admin.domain.Search;
import donghyeon.rcms.admin.domain.UploadImage;
import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Page;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;

public interface AdminMapper {
	
	@Select("select img_title imgTitle, img_name imgName from advertisements")
	public List<UploadImage> getUploadImages();
	
	@Delete("delete advertisements where img_Name=#{imgName}")
	public int deleteImage(String imgName);
	
	@Insert("insert into advertisements values(#{imgTitle,jdbcType=VARCHAR}, #{imgName,jdbcType=VARCHAR})")
	public int addImage(UploadImage uploadImage);
	
	@Select("select count(img_name) from advertisements where img_name=#{imgName}")
	public int imageNameCheck(String imgName);
	
	
	
	//회원관리
//	@Select("select user_id userId, user_pw userPw, "
//			+ "user_name userName, user_email userEmail, user_hp userHp,"
//			+ "class_code classCode from users where class_code=1")
//	public List<User> getUsers();
	
	@Select("select user_id userId, user_pw userPw, "
			+ "user_name userName, user_email userEmail, user_hp userHp,"
			+ "class_code classCode from ("
			+ "  select rownum as rnum , x.* from("
			+ "    select * from users where class_code=1 order by user_id desc  "
			+ " )x where rownum <=#{rowCnt}*#{currentPage}"
			+ ")where rnum > #{rowCnt}*(#{currentPage}-1)")
	public List<User> getUsers(Page page);
	
	@Delete("delete users where user_id=#{userId}")
	public int deleteUser(String userId);
	
	@Select("select user_id userId, user_pw userPw, "
			+ "user_name userName, user_email userEmail, user_hp userHp,"
			+ "class_code classCode from users where user_id like '%'||#{userId}||'%' and user_name like '%'||#{userName}||'%' and class_code=1")
	public List<User> searchUsers(Search search);
	
	//차량관리
	@Select("select car_num carNum, car_name carName, car_mileage carMileage, car_img_name carImgName, car_charge carCharge, "
			+ "color_name color, type_name type, maker_name maker, fuel_name fuelName from ("
			+ "  select rownum as rnum , x.* from("
			+ "    select * from cars natural join makers natural join types natural join colors natural join fuels order by car_num desc "
			+ " )x where rownum <=#{rowCnt}*#{currentPage}"
			+ ")where rnum > #{rowCnt}*(#{currentPage}-1)")
	public List<Car> getCars(Page page);
	
	@Insert("insert into cars values(car_num_seq.nextval,#{carName},#{carMileage},#{carImgName},#{carCharge},#{color},#{type},#{maker},#{fuel},0)")
	public int addCar(Car car);
	
	@Update("update cars set car_name=#{carName}, car_mileage=#{carMileage}, type_code=#{type},"
			+ "fuel_code=#{fuel}, color_code=#{color}, maker_code=#{maker}, car_charge=#{carCharge} where car_num=#{carNum}")
	public int updateCar(Car car);
	
	@Delete("delete cars where car_num=#{carNum}")
	public int deleteCar(int carNum);
	
	@Select("select car_num carNum, car_name carName, car_mileage carMileage, car_img_name carImgName"
			+ ", car_charge carCharge, color_name color, type_name type, maker_name maker"
			+ ", fuel_name fuel from cars natural join colors NATURAL join types "
			+ "natural join makers natural join fuels "
			+ "where car_name like '%'||#{carName,jdbcType=VARCHAR}||'%' "
			+ "and car_num like '%'||decode(#{carNum,jdbcType=NUMERIC},0,null,#{carNum,jdbcType=NUMERIC})||'%' "
			+ "and type_code like '%'||#{type}||'%' and color_code like '%'||#{color}||'%'")
	public List<Car> searchCar(Car car);
	
	
	@Select("select car_num carNum, car_name carName, car_mileage carMileage, car_img_name carImgName, car_charge carCharge, color_name color, type_name type, maker_name maker, fuel_name fuel, reco_status recoStatus"
			+ " from cars"
			+ " natural join colors"
			+ " NATURAL join types"
			+ " natural join makers"
			+ " natural join fuels"
			+ " where reco_status=#{recoStatus}")
	public List<Car> getRecoCars(int recoStatus);
	
	@Update("update cars set reco_status=1 where car_num=#{carNum}")
	int addRecommendCar(int carNum);
	
	@Update("update cars set reco_status=0 where car_num=#{carNum}")
	int reduceRecommendCar(int carNum);
	
//	@Select("select reserv_num reservNum, reserv_date reservDate, return_date returnDate, user_id userId, car_num carNum, car_name carName"
//			+ " from reservations"
//			+ " natural join cars"
//			+ " order by reservNum")
//	public List<Reservation> getReservationList();
	
	@Select("select reserv_num reservNum, reserv_date reservDate, return_date returnDate, user_id userId, car_num carNum, car_name carName from ("
			+ "  select rownum as rnum , x.* from("
			+ "    select * from reservations natural join cars order by reserv_num desc "
			+ " )x where rownum <=#{rowCnt}*#{currentPage}"
			+ ")where rnum > #{rowCnt}*(#{currentPage}-1)")
	public List<Reservation> getReservationList(Page page);
	
	@Select("select reserv_num reservNum, reserv_date reservDate, return_date returnDate, user_id userId, car_num carNum, car_name carName"
			+ " from reservations"
			+ " natural join cars"
			+ " where reserv_num = #{reservNum}")
	public Reservation getReservation(int reservNum); 
}
