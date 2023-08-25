package com.example.anesi.model;

public class UsedOrder {
	private int usedPNo;
	private int usedNo;
	private String deliverySit;
	private int orderPrice;
	private int usedPSellPrice;
	private String usedPName;
	private String pImgPath;
	private String pImgName;
	
	public int getUsedNo() {
		return usedNo;
	}
	public void setUsedNo(int usedNo) {
		this.usedNo = usedNo;
	}
	
	public String getDeliverySit() {
		return deliverySit;
	}
	public void setDeliverySit(String deliverySit) {
		this.deliverySit = deliverySit;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public void setUsedPNo(int usedPNo) {
		this.usedPNo = usedPNo;
	}
	public int getUsedPNo() {
		return usedPNo;
	}
	public int getUsedPSellPrice() {
		return usedPSellPrice;
	}
	public void setUsedPSellPrice(int usedPSellPrice) {
		this.usedPSellPrice = usedPSellPrice;
	}
	public String getUsedPName() {
		return usedPName;
	}
	public void setUsedPName(String usedPName) {
		this.usedPName = usedPName;
	}
	public String getpImgPath() {
		return pImgPath;
	}
	public void setpImgPath(String pImgPath) {
		this.pImgPath = pImgPath;
	}
	public String getpImgName() {
		return pImgName;
	}
	public void setpImgName(String pImgName) {
		this.pImgName = pImgName;
	}
	
}
