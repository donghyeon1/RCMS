package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Review {
	private int revNum;
	private String revTitle;
	private String revContent;
	private Date revRegDate;
	private String userId;
	
	@Override
	public String toString() {
		return "Review [revNum=" + revNum + ", revTitle=" + revTitle
				+ ", revContent=" + revContent + ", revRegDate=" + revRegDate
				+ ", userId=" + userId + "]";
	}

	public Review(){}
	
	public Review(int revNum, String revTitle, String revContent,
			Date revRegDate, String userId) {
		super();
		this.revNum = revNum;
		this.revTitle = revTitle;
		this.revContent = revContent;
		this.revRegDate = revRegDate;
		this.userId = userId;
	}
	
	public int getRevNum() {
		return revNum;
	}
	public void setRevNum(int revNum) {
		this.revNum = revNum;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevContent() {
		return revContent;
	}
	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}
	public Date getRevRegDate() {
		return revRegDate;
	}
	public void setRevRegDate(Date revRegDate) {
		this.revRegDate = revRegDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
