package donghyeon.rcms.user.mypage.service;

import java.util.List;

import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.common.domain.User;
import donghyeon.rcms.user.mypage.domain.ReservationDetail;

public interface MyPageService {
	boolean modifyPw(User user);
	boolean modifyEmail(User user);
	boolean modifyHp(User user);
	boolean secedeUser(String userId);
	public List<Reservation> getReservations(String userId);
	public ReservationDetail getReservDetail(Reservation reservNum);
	public boolean delReservation(Reservation reservNum);
}
