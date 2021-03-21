package kr.co.domain;

import java.util.Date;

public class CartListVO {
	
	private int cartNum;
	private String userId;
	private int socksNum;
	private int cartStock;
	private Date addDate;
	
	private int num;
	private String socksName;
	private int socksPrice;
	private String socksThumbImg;
	
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSocksName() {
		return socksName;
	}

	public void setSocksName(String socksName) {
		this.socksName = socksName;
	}

	public int getSocksPrice() {
		return socksPrice;
	}

	public void setSocksPrice(int socksPrice) {
		this.socksPrice = socksPrice;
	}

	public String getSocksThumbImg() {
		return socksThumbImg;
	}

	public void setSocksThumbImg(String socksThumbImg) {
		this.socksThumbImg = socksThumbImg;
	}

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
