package donghyeon.rcms.user.mypage.domain;

import java.sql.Date;

public class ReservationDetail {
	private String carName;
	private String type;
	private String carMileage;
	private String fuel;
	private String maker;
	private String color;
	private int carCharge;
	private Date reservDate;
	private Date returnDate;
	private String carImgName;
	
	public ReservationDetail(){}
	
	public ReservationDetail(String carName, String type, String carMileage,
			String fuel, String maker, String color, int carCharge,
			Date reservDate, Date returnDate, String carImgName) {
		super();
		this.carName = carName;
		this.type = type;
		this.carMileage = carMileage;
		this.fuel = fuel;
		this.maker = maker;
		this.color = color;
		this.carCharge = carCharge;
		this.reservDate = reservDate;
		this.returnDate = returnDate;
		this.carImgName = carImgName;
	}


	public String getCarName() {
		return carName;
	}
	public void setCarName(String carName) {
		this.carName = carName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getMileage() {
		return carMileage;
	}
	public void setMileage(String carMileage) {
		this.carMileage = carMileage;
	}
	public String getFuel() {
		return fuel;
	}
	public void setFuel(String fuel) {
		this.fuel = fuel;
	}
	public String getMaker() {
		return maker;
	}
	public void setMaker(String maker) {
		this.maker = maker;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getCarCharge() {
		return carCharge;
	}
	public void setCarCharge(int carCharge) {
		this.carCharge = carCharge;
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

	public String getCarMileage() {
		return carMileage;
	}

	public void setCarMileage(String carMileage) {
		this.carMileage = carMileage;
	}

	public String getCarImgName() {
		return carImgName;
	}

	public void setCarImgName(String carImgName) {
		this.carImgName = carImgName;
	}

	@Override
	public String toString() {
		return "ReservationDetail [carName=" + carName + ", type=" + type
				+ ", carMileage=" + carMileage + ", fuel=" + fuel + ", maker="
				+ maker + ", color=" + color + ", carCharge=" + carCharge
				+ ", reservDate=" + reservDate + ", returnDate=" + returnDate
				+ ", carImgName=" + carImgName + "]";
	}
}
