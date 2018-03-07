package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Comment {
	private int commNum;
	private String commContent;
	private Date commRegDate;
	private int revNum;
	private String userId;
	
	public Comment(){}
	
	public Comment(int commNum, String commContent, Date commRegDate,
			int revNum, String userId) {
		super();
		this.commNum = commNum;
		this.commContent = commContent;
		this.commRegDate = commRegDate;
		this.revNum = revNum;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Comment [commNum=" + commNum + ", commContent=" + commContent
				+ ", commRegDate=" + commRegDate + ", revNum=" + revNum
				+ ", userId=" + userId + "]";
	}

	public int getCommNum() {
		return commNum;
	}

	public void setCommNum(int commNum) {
		this.commNum = commNum;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public Date getCommRegDate() {
		return commRegDate;
	}

	public void setCommRegDate(Date commRegDate) {
		this.commRegDate = commRegDate;
	}

	public int getRevNum() {
		return revNum;
	}

	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
}
