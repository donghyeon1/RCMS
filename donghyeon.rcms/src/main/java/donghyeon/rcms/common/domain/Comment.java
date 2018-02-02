package donghyeon.rcms.common.domain;

import java.sql.Date;

public class Comment {
	private int commNum;
	private String commContent;
	private Date commRegDate;
	private Reservation reservation;
	private User user;
	
	public Comment(){}
	
	public Comment(int commNum, String commContent, Date commRegDate,
			Reservation reservation, User user) {
		super();
		this.commNum = commNum;
		this.commContent = commContent;
		this.commRegDate = commRegDate;
		this.reservation = reservation;
		this.user = user;
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

	public Reservation getReservation() {
		return reservation;
	}

	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
