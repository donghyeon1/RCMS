package donghyeon.rcms.common.domain;

public class Class {
	private int classCode;
	private String className;
	
	public Class(){}
	
	public Class(int classCode, String className) {
		super();
		this.classCode = classCode;
		this.className = className;
	}

	public int getClassCode() {
		return classCode;
	}

	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}
}
