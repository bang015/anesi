package com.example.anesi.model;

public class Product {
	 private String productNo;
	 	//product 테이블
	    private String productName;
	    private int productPrice;
	    private int discount;
	    private String cdateTime;
	    private String udateTime;
	    private char discountYn;
	    private char deleteYn;
	    private String categoryNo;
	    private String manufacturer;
	    private String pContent;
	    private String country;
	    private int discountPrice;
	    
	 	//product_category 테이블
	    private String categoryName;

	    
	    
	    
	    
		public String getProductNo() {
			return productNo;
		}
		public void setProductNo(String productNo) {
			this.productNo = productNo;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public int getProductPrice() {
			return productPrice;
		}
		public void setProductPrice(int productPrice) {
			this.productPrice = productPrice;
		}
		public int getDiscount() {
			return discount;
		}
		public void setDiscount(int discount) {
			this.discount = discount;
		}
		public String getCdateTime() {
			return cdateTime;
		}
		public void setCdateTime(String cdateTime) {
			this.cdateTime = cdateTime;
		}
		public String getUdateTime() {
			return udateTime;
		}
		public void setUdateTime(String udateTime) {
			this.udateTime = udateTime;
		}
		public char getDiscountYn() {
			return discountYn;
		}
		public void setDiscountYn(char discountYn) {
			this.discountYn = discountYn;
		}
		public char getDeleteYn() {
			return deleteYn;
		}
		public void setDeleteYn(char deleteYn) {
			this.deleteYn = deleteYn;
		}
		public String getCategoryNo() {
			return categoryNo;
		}
		public void setCategoryNo(String categoryNo) {
			this.categoryNo = categoryNo;
		}
		public String getManufacturer() {
			return manufacturer;
		}
		public void setManufacturer(String manufacturer) {
			this.manufacturer = manufacturer;
		}
		public String getpContent() {
			return pContent;
		}
		public void setpContent(String pContent) {
			this.pContent = pContent;
		}
		public String getCountry() {
			return country;
		}
		public void setCountry(String country) {
			this.country = country;
		}
		public int getDiscountPrice() {
			return discountPrice;
		}
		public void setDiscountPrice(int discountPrice) {
			this.discountPrice = discountPrice;
		}
		public String getCategoryName() {
			return categoryName;
		}
		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}
	    
	    

}
