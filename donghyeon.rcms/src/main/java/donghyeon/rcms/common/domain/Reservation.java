package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Reservation {
	private int reservNum;
	private Date reservDate;
	private Date returnDate;
	private User user;
	private Car car;
	
	public Reservation(){}
	
	public Reservation(int reservNum, Date reservDate, Date returnDate,
			User user, Car car) {
		super();
		this.reservNum = reservNum;
		this.reservDate = reservDate;
		this.returnDate = returnDate;
		this.user = user;
		this.car = car;
	}

	public int getReservNum() {
		return reservNum;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
}
