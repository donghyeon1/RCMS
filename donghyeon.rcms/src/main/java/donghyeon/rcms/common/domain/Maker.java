package donghyeon.rcms.common.domain;

public class Maker {
	private int makerCode;
	private String makerName;
	
	public Maker(){}
	
	public Maker(int makerCode, String makerName) {
		super();
		this.makerCode = makerCode;
		this.makerName = makerName;
	}

	public int getMakerCode() {
		return makerCode;
	}

	public void setMakerCode(int makerCode) {
		this.makerCode = makerCode;
	}

	public String getMakerName() {
		return makerName;
	}

	public void setMakerName(String makerName) {
		this.makerName = makerName;
	}
}
