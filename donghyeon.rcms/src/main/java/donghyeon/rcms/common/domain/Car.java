package donghyeon.rcms.common.domain;

import org.springframework.web.multipart.MultipartFile;

public class Car {
	private int carNum;
	private String carName;
	private String carMileage;
	private String carImgName;
	private int carCharge;
	private String color;
	private String type;
	private String maker;
	private String fuel;
	private MultipartFile uploadFile;
	
	public Car(){}

	public Car(int carNum, String carName, String carMileage,
			String carImgName, int carCharge, String color, String type,
			String maker, String fuel, MultipartFile uploadFile) {
		super();
		this.carNum = carNum;
		this.carName = carName;
		this.carMileage = carMileage;
		this.carImgName = carImgName;
		this.carCharge = carCharge;
		this.color = color;
		this.type = type;
		this.maker = maker;
		this.fuel = fuel;
		this.uploadFile = uploadFile;
	}

	public int getCarNum() {
		return carNum;
	}

	public void setCarNum(int carNum) {
		this.carNum = carNum;
	}

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
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

	public int getCarCharge() {
		return carCharge;
	}

	public void setCarCharge(int carCharge) {
		this.carCharge = carCharge;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMaker() {
		return maker;
	}

	public void setMaker(String maker) {
		this.maker = maker;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	@Override
	public String toString() {
		return "Car [carNum=" + carNum + ", carName=" + carName
				+ ", carMileage=" + carMileage + ", carImgName=" + carImgName
				+ ", carCharge=" + carCharge + ", color=" + color + ", type="
				+ type + ", maker=" + maker + ", fuel=" + fuel
				+ ", uploadFile=" + uploadFile + "]";
	}
}
