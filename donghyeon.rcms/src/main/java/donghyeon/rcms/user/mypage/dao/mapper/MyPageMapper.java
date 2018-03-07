package donghyeon.rcms.user.mypage.dao.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;

public interface MyPageMapper {	
	@Update("update users set user_pw=#{userPw} where user_id=#{userId}")
	int modifyPw(User user);
	
	@Update("update users set user_email=#{userEmail} where user_id=#{userId}")
	int modifyEmail(User user);
	
	@Update("update users set user_hp=#{userHp} where user_id=#{userId}")
	int modifyHp(User user);
	
	@Delete("delete users where user_id=#{userId}")
	int secedeUser(String userId);
	
	@Select("select reserv_num reservNum, reserv_date reservDate"
			+ ", return_date returnDate, user_id userId, car_name carName"
			+ ", car_num carNum from reservations "
			+ "natural join cars where user_id=#{userId,jdbcType=VARCHAR}")
	public List<Reservation> getReservations(String userId);
	
	@Select("select reserv_date reservDate, return_date returnDate, car_name carName"
			+ ", type_name type,CAR_MILEAGE carMileage, fuel_name fuel, maker_name maker"
			+ ", color_name color, car_charge carCharge, car_img_name carImgName from reservations natural join cars "
			+ "natural join types natural join fuels natural join makers natural join colors "
			+ "where reserv_num=${reservNum}")
	public ReservationDetail getReservDetail(Reservation reservNum);
	
	@Delete("delete reservations where reserv_num=${reservNum}")
	public int delReservation(Reservation reservNum);
}
