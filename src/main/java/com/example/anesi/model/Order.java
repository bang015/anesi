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
