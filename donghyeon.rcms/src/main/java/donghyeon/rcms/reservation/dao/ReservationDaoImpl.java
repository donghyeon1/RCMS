package donghyeon.rcms.reservation.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.reservation.dao.mapper.ReservationMapper;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired private ReservationMapper reservationMapper;
	
	public List<Car> getCars(int typeCode){
		return reservationMapper.getCars(typeCode);
	}
	
	public Car getCar(int carNum){
		return reservationMapper.getCar(carNum);
	}
	
	@Override
	public int carReservation(Reservation reservation){
		return reservationMapper.carReservation(reservation);
	}
	
	@Override
	public int carReservationModify(Reservation reservation){
		return reservationMapper.carReservationModify(reservation);
	}
	
	@Override
	public int carReservationDelete(int deleteReservNum){
		return reservationMapper.carReservationDelete(deleteReservNum);
	}
	
	@Override
	public int reservationOverlapCheck(Reservation reservation){
		return reservationMapper.reservationOverlapCheck(reservation);
	}
	
	@Override
	public List<HashMap> getDisableDate(int reservNum){
		return reservationMapper.getDisableDate(reservNum);
	}
	
	@Override
	public List<Reservation> getReservByCarNum(int CarNum){
		return reservationMapper.getReservByCarNum(CarNum);
	}
	
	@Override
	public List<Reservation> getReservationSearchList(Reservation reservation){
		return reservationMapper.getReservationSearchList(reservation);
	}
	
	public Car getCarInfo(int carNum){
	      return reservationMapper.getCarInfo(carNum);
	}
}