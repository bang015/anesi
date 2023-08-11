package com.example.anesi.model;

public class Scrapbook {
	private int scrapbookNo;
	private int userNo;
	private int productNo;
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
	public void setScrapbookNo(int scrapbookNo) {
		this.scrapbookNo = scrapbookNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getScrapbookNo() {
		return scrapbookNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public int getProductNo() {
		return productNo;
	}	
}
