package kr.co.domain;

import java.util.Date;

public class MemberVO {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private Date regDate;
	private int verify;
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserPw() {
		return userPw;
	}
	
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserPhone() {
		return userPhone;
	}
	
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUserAdd1() {
		return userAdd1;
	}
	
	public void setUserAdd1(String userAdd1) {
		this.userAdd1 = userAdd1;
	}
	
	public String getUserAdd2() {
		return userAdd2;
	}
	
	public void setUserAdd2(String userAdd2) {
		this.userAdd2 = userAdd2;
	}
	
	public String getUserAdd3() {
		return userAdd3;
	}
	
	public void setUserAdd3(String userAdd3) {
		this.userAdd3 = userAdd3;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getVerify() {
		return verify;
	}
	
	public void setVerify(int verify) {
		this.verify = verify;
	}

}	
	