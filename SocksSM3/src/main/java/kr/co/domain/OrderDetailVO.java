package kr.co.domain;

public class OrderDetailVO {
	
	private int orderDetailsNum;
	private String orderId;
	private int socksNum;
	private int cartStock;
	
	public int getOrderDetailsNum() {
		return orderDetailsNum;
	}
	
	public void setOrderDetailsNum(int orderDetailsNum) {
		this.orderDetailsNum = orderDetailsNum;
	}
	
	public String getOrderId() {
		return orderId;
	}
	
	public void setOrderId(String orderId) {
		this.orderId = orderId;
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
	
}
