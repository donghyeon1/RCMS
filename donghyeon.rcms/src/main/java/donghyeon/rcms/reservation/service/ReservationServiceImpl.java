package donghyeon.rcms.reservation.service;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import donghyeon.rcms.common.domain.Car;
import donghyeon.rcms.common.domain.Reservation;
import donghyeon.rcms.reservation.dao.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService{
	@Autowired private ReservationDao reservationDao;
	
	public List<Car> getCars(int typeCode){
		return reservationDao.getCars(typeCode);
	}
	
	public Car getCar(int carNum){
		return reservationDao.getCar(carNum);
	}
	
	@Override
	public String carReservation(Reservation reservation){
		if(reservationDao.reservationOverlapCheck(reservation)>0){
			return "overLap";
		}else{
			reservationDao.carReservation(reservation);
			return "success";
		}
	}
	
	@Override
	public String carReservationModify(Reservation reservation){
		if(reservationDao.reservationOverlapCheck(reservation)>0){
			return "overLap";
		}else{
			reservationDao.carReservationModify(reservation);
			return "success";
		}
	}
	
	@Override
	public String carReservationDelete(int deleteReservNum){
		if(reservationDao.carReservationDelete(deleteReservNum)>0){
			return "success";
		}else{
			return "error";
		}
	}
	
	@Override
	public List<String> getReservationDate(int reservNum){
		List<String> nowReservDates = new ArrayList<String>();
		Iterator<HashMap> reservIterator = reservationDao.getDisableDate(reservNum).iterator();
		while (reservIterator.hasNext()) {
			nowReservDates.add(reservIterator.next().get("DAYS").toString());
		}
		return nowReservDates;
	}
	
	
	
	@Override
	public List<String> getReservationDateCheck(int carNum){
		List<Integer> reservNums = new ArrayList<Integer>();
		List<String> reservDates = new ArrayList<String>();
		
		List<Reservation> reservationList = reservationDao.getReservByCarNum(carNum);
		for(Reservation reserv:reservationList){
			reservNums.add(reserv.getReservNum());
		}
		for(int reservNum:reservNums){
			Iterator<HashMap> reservIterator = reservationDao.getDisableDate(reservNum).iterator();
			while (reservIterator.hasNext()) {
				reservDates.add(reservIterator.next().get("DAYS").toString());
			}
		}
		return reservDates;
	}
	
	@Override
	public List<Reservation> getReservationSearchList(Reservation reservation){
		return reservationDao.getReservationSearchList(reservation);
	}
	
	@Override
	public List<Reservation> getReservationSearchList(String res){
		JSONParser parser = new JSONParser();
		Object obj = null;
		try {
			obj = parser.parse( res );
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		JSONObject jsonObj = (JSONObject) obj;
		Map<String, Object> resMap= getMapFromJsonObject(jsonObj);
		Reservation reservation = new Reservation();
		String rsDate = (String) resMap.get("reservDate");
		String userId = (String) resMap.get("userId");
		try{
			reservation.setUserId((String)resMap.get("userId"));
			reservation.setReservNum(Integer.parseInt((String)resMap.get("reservNum")));
			reservation.setCarNum(Integer.parseInt((String)resMap.get("carNum")));
			if(rsDate.equals("null")){
				reservation.setReservDate(null);
				reservation.setReturnDate(null);
			}else{
				reservation.setReservDate(Date.valueOf((String)resMap.get("reservDate")));
				reservation.setReturnDate(Date.valueOf((String)resMap.get("returnDate")));
			}
			reservation.setCarName((String)resMap.get("carName"));
		}catch(Exception e){
			System.out.println("getReservationSerchList date error:"+e);
		}
		return reservationDao.getReservationSearchList(reservation);
	}
	
	@SuppressWarnings("unchecked")
	public static Map<String, Object> getMapFromJsonObject( JSONObject jsonObj ) {

		Map<String, Object> map = null;
		
		try {
			
			map = new ObjectMapper().readValue(jsonObj.toJSONString(), Map.class) ;
			
		} catch (JsonParseException e) {
            e.printStackTrace();
        } catch (JsonMappingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return map;
	}
	
	public Car getCarInfo(int carNum){
		return reservationDao.getCarInfo(carNum);
	}
}
