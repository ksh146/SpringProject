package kr.co.domain;

import java.util.Date;

public class SocksViewVO {
	
	private int socksNum;
	private String socksName;
	private String cateCode;
	private int socksPrice;
	private int socksStock;
	private String socksDes;
	private String socksImg;
	private Date socksDate;
	
	private String cateCodeRef;
	private String cateName;
	
	private String socksThumbImg;
	
	public String getSocksThumbImg() {
		return socksThumbImg;
	}

	public void setSocksThumbImg(String socksThumbImg) {
		this.socksThumbImg = socksThumbImg;
	}

	public int getSocksNum() {
		return socksNum;
	}
	
	public void setSocksNum(int socksNum) {
		this.socksNum = socksNum;
	}
	
	public String getSocksName() {
		return socksName;
	}
	
	public void setSocksName(String socksName) {
		this.socksName = socksName;
	}
	
	public String getCateCode() {
		return cateCode;
	}
	
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	
	public int getSocksPrice() {
		return socksPrice;
	}
	
	public void setSocksPrice(int socksPrice) {
		this.socksPrice = socksPrice;
	}
	
	public int getSocksStock() {
		return socksStock;
	}
	
	public void setSocksStock(int socksStock) {
		this.socksStock = socksStock;
	}
	
	public String getSocksDes() {
		return socksDes;
	}
	
	public void setSocksDes(String socksDes) {
		this.socksDes = socksDes;
	}
	
	public String getSocksImg() {
		return socksImg;
	}
	
	public void setSocksImg(String socksImg) {
		this.socksImg = socksImg;
	}
	
	public Date getSocksDate() {
		return socksDate;
	}
	
	public void setSocksDate(Date socksDate) {
		this.socksDate = socksDate;
	}
	
	public String getCateCodeRef() {
		return cateCodeRef;
	}
	
	public void setCateCodeRef(String cateCodeRef) {
		this.cateCodeRef = cateCodeRef;
	}
	
	public String getCateName() {
		return cateName;
	}
	
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	
}
