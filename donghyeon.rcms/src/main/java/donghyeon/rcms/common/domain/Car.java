package donghyeon.rcms.common.domain;

public class Car {
	private int carNum;
	private String carName;
	private int carMileage;
	private String carImgName;
	private int carCharge;
	private Color color;
	private Type type;
	private Maker maker;
	private Fuel fuel;
	
	public Car(){}
	
	public Car(int carNum, String carName, int carMileage, String carImgName,
			int carCharge, Color color, Type type, Maker maker, Fuel fuel) {
		this.carNum = carNum;
		this.carName = carName;
		this.carMileage = carMileage;
		this.carImgName = carImgName;
		this.carCharge = carCharge;
		this.color = color;
		this.type = type;
		this.maker = maker;
		this.fuel = fuel;
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

	public int getCarMileage() {
		return carMileage;
	}

	public void setCarMileage(int carMileage) {
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

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Type getType() {
		return type;
	}

	public void setType(Type type) {
		this.type = type;
	}

	public Maker getMaker() {
		return maker;
	}

	public void setMaker(Maker maker) {
		this.maker = maker;
	}

	public Fuel getFuel() {
		return fuel;
	}

	public void setFuel(Fuel fuel) {
		this.fuel = fuel;
	}
}
