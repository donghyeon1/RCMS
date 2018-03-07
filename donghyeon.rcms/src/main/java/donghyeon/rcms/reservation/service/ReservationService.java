package donghyeon.rcms.reservation.service;

import java.util.List;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;

public interface ReservationService {
	public List<Car> getCars(int typeCode);
	public Car getCar(int carNum);
	String carReservation(Reservation reservation);
	List<String> getReservationDate(int reservNum);
	List<String> getReservationDateCheck(int carNum);
	String carReservationModify(Reservation reservation);
	String carReservationDelete(int deleteReservNum);
	List<Reservation> getReservationSearchList(Reservation reservation);
	List<Reservation> getReservationSearchList(String reservation);
	public Car getCarInfo(int carNum);
}
