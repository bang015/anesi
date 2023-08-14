package com.example.anesi.model;

public class Cart {

	private int cartNo;
	private int userNo;
	private int productNo;
	private int cnt;
	private String imgName;
	private String imgPath;
	private String imgOrgName;
	
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public String getImgOrgName() {
		return imgOrgName;
	}
	public void setImgOrgName(String imgOrgName) {
		this.imgOrgName = imgOrgName;
	}
	
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	
	public int getUserNo() {
		return userNo;
	}
	public int getProductNo() {
		return productNo;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}	
}
