package donghyeon.rcms.reservation.dao.mapper;

import java.util.HashMap;
import java.util.List;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;

public interface ReservationMapper {
	List<Car> getCars(int typeCode);
	Car getCar(int carNum);
	int carReservation(Reservation reservation);
	int reservationOverlapCheck(Reservation reservation);
	List<Reservation> getReservByCarNum(int carNum);	//예약 리스트 가져오기(carNum 이용)
	List<HashMap> getDisableDate(int reservNum); 	//예약된 날짜 가져오기(reservNum 이용)
	int carReservationModify(Reservation reservation);
	int carReservationDelete(int deleteReservNum);
	List<Reservation> getReservationSearchList(Reservation reservation);
	Car getCarInfo(int carNum);
}
