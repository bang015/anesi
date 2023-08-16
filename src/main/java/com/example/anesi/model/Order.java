package com.example.anesi.model;

public class Order {
	private int couponNo;
    private int userNo;
    private String mDate;
    private String eDate;
    private String disFlg;
    private int discount;
    private String useYn;
    private String ableYn;
    private String cpKind;
    private int minPrice;
    private int maxDi;
    private String mutiYn;
    private String couponName;
    private int productNo;
    private int optionNo;
    private int orderPrice;
    private int cnt;
    private String optionName;
    public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public int getOptionNo() {
		return optionNo;
	}
	public void setOptionNo(int optionNo) {
		this.optionNo = optionNo;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getCouponName() {
		return couponName;
	}
	public int getCouponNo() {
		return couponNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public String getmDate() {
		return mDate;
	}
	public String geteDate() {
		return eDate;
	}
	public String getDisFlg() {
		return disFlg;
	}
	public int getDiscount() {
		return discount;
	}
	public String getUseYn() {
		return useYn;
	}
	public String getAbleYn() {
		return ableYn;
	}
	public String getCpKind() {
		return cpKind;
	}
	public int getMinPrice() {
		return minPrice;
	}
	public int getMaxDi() {
		return maxDi;
	}
	public String getMutiYn() {
		return mutiYn;
	}
}
