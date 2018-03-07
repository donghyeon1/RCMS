package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Reservation {
	private int reservNum;
	private Date reservDate;
	private Date returnDate;
	private String userId;
	private int carNum;
	private String carName;
	
	public Reservation(){}

	public Reservation(int reservNum, Date reservDate, Date returnDate,
			String userId, int carNum, String carName) {
		super();
		this.reservNum = reservNum;
		this.reservDate = reservDate;
		this.returnDate = returnDate;
		this.userId = userId;
		this.carNum = carNum;
		this.carName = carName;
	}

	public int getReservNum() {
		return reservNum;
	}
	
	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}

	public void setReservNum(int reservNum) {
		this.reservNum = reservNum;
	}

	public Date getReservDate() {
		return reservDate;
	}

	public void setReservDate(Date reservDate) {
		this.reservDate = reservDate;
	}

	public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getCarNum() {
		return carNum;
	}

	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}

	@Override
	public String toString() {
		return "Reservation [reservNum=" + reservNum + ", reservDate="
				+ reservDate + ", returnDate=" + returnDate + ", userId="
				+ userId + ", carNum=" + carNum + "]";
	}
}
