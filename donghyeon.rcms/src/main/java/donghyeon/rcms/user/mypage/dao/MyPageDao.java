package donghyeon.rcms.user.mypage.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;

@Repository
public interface MyPageDao {
	boolean modifyPw(User user);
	boolean modifyEmail(User user);
	boolean modifyHp(User user);
	boolean secedeUser(String userId);
	public List<Reservation> getReservations(String userId);
	public ReservationDetail getReservDetail(Reservation reservNum);
	public boolean delReservation(Reservation reservNum);
}
