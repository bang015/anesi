package com.example.anesi.model;

public class Coupon {

		private int cpCnt;
		private String imgOrgName;
	    private char disFlag;	   
	    private int discount;
		public int getCpCnt() {
			return cpCnt;
		}
		public void setCpCnt(int cpCnt) {
			this.cpCnt = cpCnt;
		}
		public String getImgOrgName() {
			return imgOrgName;
		}
		public void setImgOrgName(String imgOrgName) {
			this.imgOrgName = imgOrgName;
		}
		public char getDisFlag() {
			return disFlag;
		}
		public void setDisFlag(char disFlag) {
			this.disFlag = disFlag;
		}
		public int getDiscount() {
			return discount;
		}
		public void setDiscount(int discount) {
			this.discount = discount;
		}
}
