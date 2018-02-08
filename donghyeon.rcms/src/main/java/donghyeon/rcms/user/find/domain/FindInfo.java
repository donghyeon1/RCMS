package donghyeon.rcms.user.find.domain;

public class FindInfo {
	private String userId;
	private String userName;
	private String userEmail;
	private String userEmail2;
	
	
	@Override
	public String toString() {
		return String.format("%s %s %s %s", userId, userName, userEmail, userEmail2);
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
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
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}
