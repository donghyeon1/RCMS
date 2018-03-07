package donghyeon.rcms.common.domain;

public class Type {
	private int typeCode;
	private String typeName;
	
	public Type(){}
	
	public Type(int typeCode, String typeName) {
		super();
		this.typeCode = typeCode;
		this.typeName = typeName;
	}

	public int getTypeCode() {
		return typeCode;
	}

	public void setTypeCode(int typeCode) {
		this.typeCode = typeCode;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Override
	public String toString() {
		return "Type [typeCode=" + typeCode + ", typeName=" + typeName + "]";
	}
	
}
