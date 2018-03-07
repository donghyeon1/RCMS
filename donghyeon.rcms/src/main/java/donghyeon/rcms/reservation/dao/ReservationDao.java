package donghyeon.rcms.reservation.dao;

import java.util.HashMap;
import java.util.List;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;

public interface ReservationDao {
	List<Car> getCars(int typeCode);
	public Car getCar(int carNum);
	int carReservation(Reservation reservation);
	int reservationOverlapCheck(Reservation reservation);
	List<HashMap> getDisableDate(int reservNum);
	List<Reservation> getReservByCarNum(int CarNum);
	int carReservationModify(Reservation reservation);
	int carReservationDelete(int deleteReservNum);
	List<Reservation> getReservationSearchList(Reservation reservation);
	public Car getCarInfo(int carNum);
}
