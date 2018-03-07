package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Question {
	private int qstNum;
	private String qstTitle;
	private String qstContent;
	private String qstAnswer;
	private Date qstRegDate;
	private String qstStatus;
	private String userId;
	
	public Question(){}
	
	public Question(int qstNum, String qstTitle, String qstContent,
			String qstAnswer, Date qstRegDate, String qstStatus, String userId) {
		super();
		this.qstNum = qstNum;
		this.qstTitle = qstTitle;
		this.qstContent = qstContent;
		this.qstAnswer = qstAnswer;
		this.qstRegDate = qstRegDate;
		this.qstStatus = qstStatus;
		this.userId = userId;
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

	@Override
	public String toString() {
		return "Question [qstNum=" + qstNum + ", qstTitle=" + qstTitle
				+ ", qstContent=" + qstContent + ", qstAnswer=" + qstAnswer
				+ ", qstRegDate=" + qstRegDate + ", qstStatus=" + qstStatus
				+ ", userId=" + userId + "]";
	}

	public void setQstStatus(String qstStatus) {
		this.qstStatus = qstStatus;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
}
