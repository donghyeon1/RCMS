package donghyeon.rcms.user.mypage.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.dao.mapper.MyPageMapper;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired private MyPageMapper myPageMapper;

	@Override
	public boolean modifyPw(User user) {
		return myPageMapper.modifyPw(user)>=1;
	}
	
	@Override
	public boolean modifyEmail(User user){
		return myPageMapper.modifyEmail(user)>=1;
	}
	
	@Override
	public boolean modifyHp(User user){
		return myPageMapper.modifyHp(user)>=1;
	}
	
	@Override
	public boolean secedeUser(String userId){
		return myPageMapper.secedeUser(userId)>=1;
	}

	public List<Reservation> getReservations(String userId){
		return myPageMapper.getReservations(userId);
	}
	
	public ReservationDetail getReservDetail(Reservation reservNum){
		return myPageMapper.getReservDetail(reservNum);
	}
	
	public boolean delReservation(Reservation reservNum){
		return myPageMapper.delReservation(reservNum)>=1;
	}
}
