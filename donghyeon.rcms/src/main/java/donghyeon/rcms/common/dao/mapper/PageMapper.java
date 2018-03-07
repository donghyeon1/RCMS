package donghyeon.rcms.common.dao.mapper;

import org.apache.ibatis.annotations.Select;

public interface PageMapper {
	@Select("select count(rev_num) from reviews")
	int getTotRowCnt();
	
	@Select("select count(reserv_num) from reservations")
	int getReservationTotRowCnt();
	
	@Select("select count(car_num) from cars")
	int getCarTotRowCnt();
	
	@Select("select count(qst_num) from Questions")
	int getQstTotRowCnt();
	
	@Select("select count(user_id) from users where class_code=1")
	int getUserTotRowCnt();
	
}
