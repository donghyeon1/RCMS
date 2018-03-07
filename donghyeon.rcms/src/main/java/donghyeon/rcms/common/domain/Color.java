package donghyeon.rcms.common.domain;

public class Color {
	private int colorCode;
	private String colorName;
	
	public Color(){}
	
	public Color(int colorCode, String colorName) {
		super();
		this.colorCode = colorCode;
		this.colorName = colorName;
	}

	public int getColorCode() {
		return colorCode;
	}

	public void setColorCode(int colorCode) {
		this.colorCode = colorCode;
	}

	public String getColorName() {
		return colorName;
	}

	public void setColorName(String colorName) {
		this.colorName = colorName;
	}
}
