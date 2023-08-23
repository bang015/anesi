package com.example.anesi.model;

public class Product {
	 private String productNo;
	 	//product 테이블
	    private String productName;
	    private int productPrice;
	    private int discount;
		private String cdatetime;
		private String udatetime;
	    private char discountYn;
	    private char deleteYn;
	    private String categoryNo;
	    private String manufacturer;
	    private String pContent;
	    private String country;
	    private int discountPrice;
	    private int optionNo;
	    private int productStock;
	    private int optionPrice;
	    private int productCnt;
	    private String optionName;
		//리뷰테이블 조인
	    private double csatAvg; // 상품 평점
	    private int csatCnt; // 상품 별점 개수
	    
		private String imgName;
		private String imgPath;
		private String imgOrgName;
		
		private int stock;
		
		//페이징인덱스
		private int idx;
		
		//쿠폰 개수
		private int cpCnt;
		
	
		
		
	    
	    
	    
	 	public int getCsatCnt() {
			return csatCnt;
		}

		public void setCsatCnt(int csatCnt) {
			this.csatCnt = csatCnt;
		}

		public double getCsatAvg() {
			return csatAvg;
		}

		public void setCsatAvg(double csatAvg) {
			this.csatAvg = csatAvg;
		}

		public String getOptionName() {
			return optionName;
		}

		public void setOptionName(String optionName) {
			this.optionName = optionName;
		}

		public int getOptionNo() {
			return optionNo;
		}

		public void setOptionNo(int optionNo) {
			this.optionNo = optionNo;
		}

		public int getProductStock() {
			return productStock;
		}

		public void setProductStock(int productStock) {
			this.productStock = productStock;
		}

		public int getOptionPrice() {
			return optionPrice;
		}

		public void setOptionPrice(int optionPrice) {
			this.optionPrice = optionPrice;
		}

		public int getProductCnt() {
			return productCnt;
		}

		public void setProductCnt(int productCnt) {
			this.productCnt = productCnt;
		}

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

		public String getCdatetime() {
			return cdatetime;
		}

		public void setCdatetime(String cdatetime) {
			this.cdatetime = cdatetime;
		}

		public String getUdatetime() {
			return udatetime;
		}

		public void setUdatetime(String udatetime) {
			this.udatetime = udatetime;
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

		public int getStock() {
			return stock;
		}

		public int getIdx() {
			return idx;
		}

		public void setIdx(int idx) {
			this.idx = idx;
		}

		public int getCpCnt() {
			return cpCnt;
		}

		public void setCpCnt(int cpCnt) {
			this.cpCnt = cpCnt;
		}

		public void setStock(int stock) {
			this.stock = stock;
		}

	
	    

}
