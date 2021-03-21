package kr.co.domain;

import java.util.Date;

public class CartVO {
	
	private int cartNum;
	private String userId;
	private int socksNum;
	private int cartStock;
	private Date addDate;
	
	public int getCartNum() {
		return cartNum;
	}
	
	public void setCartNum(int cartNum) {
		this.cartNum = cartNum;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public int getSocksNum() {
		return socksNum;
	}
	
	public void setSocksNum(int socksNum) {
		this.socksNum = socksNum;
	}
	
	public int getCartStock() {
		return cartStock;
	}
	
	public void setCartStock(int cartStock) {
		this.cartStock = cartStock;
	}
	
	public Date getAddDate() {
		return addDate;
	}
	
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

}
