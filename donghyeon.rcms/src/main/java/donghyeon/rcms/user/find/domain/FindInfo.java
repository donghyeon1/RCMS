package donghyeon.rcms.user.find.domain;

public class FindInfo {
	private String userId;
	private String userName;
	private String userEmail;
	
	@Override
	public String toString() {
		return "FindInfo [userId=" + userId + ", userName=" + userName
				+ ", userEmail=" + userEmail + "]";
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
