package com.example.anesi.model;

public class Cart {

	private int cartNo;
	private int userNo;
	private int productNo;
	private int cnt;
	private String nonuserNo;
	private int optionNo;
	
	
	private String cart_cklimit; //쿠키제한시간(삭제용)
	private String cart_ckid; //쿠키value값
	
	
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
	public String getNonuserNo() {
		return nonuserNo;
	}
	public void setNonuserNo(String nonuserNo) {
		this.nonuserNo = nonuserNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public String getCart_cklimit() {
		return cart_cklimit;
	}
	public void setCart_cklimit(String cart_cklimit) {
		this.cart_cklimit = cart_cklimit;
	}
	public String getCart_ckid() {
		return cart_ckid;
	}
	public void setCart_ckid(String cart_ckid) {
		this.cart_ckid = cart_ckid;
	}	
}
