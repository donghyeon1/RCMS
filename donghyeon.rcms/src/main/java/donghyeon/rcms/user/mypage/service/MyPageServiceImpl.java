package donghyeon.rcms.user.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.dao.MyPageDao;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired private MyPageDao myPageDao; 

	@Override
	public boolean modifyPw(User user) {
		return myPageDao.modifyPw(user);
	}

	@Override
	public boolean modifyEmail(User user) {
		return myPageDao.modifyEmail(user);
	}

	@Override
	public boolean modifyHp(User user) {
		return myPageDao.modifyHp(user);
	}
	
	@Override
	public boolean secedeUser(String userId){
		return myPageDao.secedeUser(userId);
	}

	public List<Reservation> getReservations(String userId){
		return myPageDao.getReservations(userId);
	}
	
	public ReservationDetail getReservDetail(Reservation reservNum){
		return myPageDao.getReservDetail(reservNum);
	}
	
	public boolean delReservation(Reservation reservNum){
		return myPageDao.delReservation(reservNum);
	}
}
