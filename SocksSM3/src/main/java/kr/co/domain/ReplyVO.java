package kr.co.domain;

import java.util.Date;

public class ReplyVO {
	
	private int socksNum;
	private String userId;
	private int replyNum;
	private String replyCon;
	private Date replyDate;
	
	public int getSocksNum() {
		return socksNum;
	}
	
	public void setSocksNum(int socksNum) {
		this.socksNum = socksNum;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getReplyNum() {
		return replyNum;
	}
	
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	
	public String getReplyCon() {
		return replyCon;
	}
	
	public void setReplyCon(String replyCon) {
		this.replyCon = replyCon;
	}
	
	public Date getReplyDate() {
		return replyDate;
	}
	
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	
}
