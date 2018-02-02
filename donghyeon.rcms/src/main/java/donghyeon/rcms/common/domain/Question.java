package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Question {
	private int qstNum;
	private String qstTitle;
	private String qstContent;
	private String qstAnswer;
	private Date qstRegDate;
	private String qstStatus;
	private User user;
	
	public Question(){}
	
	public Question(int qstNum, String qstTitle, String qstContent,
			String qstAnswer, Date qstRegDate, String qstStatus, User user) {
		super();
		this.qstNum = qstNum;
		this.qstTitle = qstTitle;
		this.qstContent = qstContent;
		this.qstAnswer = qstAnswer;
		this.qstRegDate = qstRegDate;
		this.qstStatus = qstStatus;
		this.user = user;
	}

	public int getQstNum() {
		return qstNum;
	}

	public void setQstNum(int qstNum) {
		this.qstNum = qstNum;
	}

	public String getQstTitle() {
		return qstTitle;
	}

	public void setQstTitle(String qstTitle) {
		this.qstTitle = qstTitle;
	}

	public String getQstContent() {
		return qstContent;
	}

	public void setQstContent(String qstContent) {
		this.qstContent = qstContent;
	}

	public String getQstAnswer() {
		return qstAnswer;
	}

	public void setQstAnswer(String qstAnswer) {
		this.qstAnswer = qstAnswer;
	}

	public Date getQstRegDate() {
		return qstRegDate;
	}

	public void setQstRegDate(Date qstRegDate) {
		this.qstRegDate = qstRegDate;
	}

	public String getQstStatus() {
		return qstStatus;
	}

	public void setQstStatus(String qstStatus) {
		this.qstStatus = qstStatus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
