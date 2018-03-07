package donghyeon.rcms.user.join.domain;

public class UserForm {
	private String userI;
	private String userPw;
	private String userPwCheck;
	private String userName;
	private String userHp1;
	private String userHp2;
	private String userHp3;
	private String userEmail;
	
	public String getUserI() {
		return userI;
	}
	public void setUserI(String userI) {
		this.userI = userI;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserPwCheck() {
		return userPwCheck;
	}
	public void setUserPwCheck(String userPwCheck) {
		this.userPwCheck = userPwCheck;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserHp1() {
		return userHp1;
	}
	public void setUserHp1(String userHp1) {
		this.userHp1 = userHp1;
	}
	public String getUserHp2() {
		return userHp2;
	}
	public void setUserHp2(String userHp2) {
		this.userHp2 = userHp2;
	}
	public String getUserHp3() {
		return userHp3;
	}
	public void setUserHp3(String userHp3) {
		this.userHp3 = userHp3;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "UserForm [userI=" + userI + ", userPw=" + userPw
				+ ", userPwCheck=" + userPwCheck + ", userName=" + userName
				+ ", userHp1=" + userHp1 + ", userHp2=" + userHp2
				+ ", userHp3=" + userHp3 + ", userEmail=" + userEmail + "]";
	}
}
