package kr.co.domain;

import java.util.Date;

public class OrderListVO {
	
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAdd1;
	private String userAdd2;
	private String userAdd3;
	private String orderPhone;
	private int amount;
	private Date orderDate;
	private String delivery;
	
	private int orderDetailsNum;
	private int socksNum;
	private int cartStock;
	
	private String socksName;
	private String socksThumbImg;
	private int socksPrice;
	
	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	
	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getOrderRec() {
		return orderRec;
	}
	
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
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
	
	public String getOrderPhone() {
		return orderPhone;
	}
	
	public void setOrderPhone(String orderPhone) {
		this.orderPhone = orderPhone;
	}
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
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
	
	public String getSocksName() {
		return socksName;
	}
	
	public void setSocksName(String socksName) {
		this.socksName = socksName;
	}
	
	public String getSocksThumbImg() {
		return socksThumbImg;
	}
	
	public void setSocksThumbImg(String socksThumbImg) {
		this.socksThumbImg = socksThumbImg;
	}
	
	public int getSocksPrice() {
		return socksPrice;
	}
	
	public void setSocksPrice(int socksPrice) {
		this.socksPrice = socksPrice;
	}

}
