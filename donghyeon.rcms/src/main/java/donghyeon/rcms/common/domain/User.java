package donghyeon.rcms.common.domain;

public class User {
	private String userId;
	private String userName;
	private String userPw;
	private String userEmail;
	private String userHp;
	private int classCode;
	
	public User(){}
	
	public User(String userId, String userName, String userPw,
			String userEmail, String userHp, int classCode) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPw = userPw;
		this.userEmail = userEmail;
		this.userHp = userHp;
		this.classCode = classCode;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserHp() {
		return userHp;
	}
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	public int getClassCode() {
		return classCode;
	}
	public void setClassCode(int classCode) {
		this.classCode = classCode;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName
				+ ", userPw=" + userPw + ", userEmail=" + userEmail
				+ ", userHp=" + userHp + ", classCode=" + classCode + "]";
	}
}
