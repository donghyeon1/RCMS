package donghyeon.rcms.common.domain;

public class Fuel {
	private int fuelCode;
	private String fuelName;
	
	public Fuel(){}
	
	public Fuel(int fuelCode, String fuelName) {
		super();
		this.fuelCode = fuelCode;
		this.fuelName = fuelName;
	}

	public int getFuelCode() {
		return fuelCode;
	}

	public void setFuelCode(int fuelCode) {
		this.fuelCode = fuelCode;
	}

	public String getFuelName() {
		return fuelName;
	}

	public void setFuelName(String fuelName) {
		this.fuelName = fuelName;
	}
}
