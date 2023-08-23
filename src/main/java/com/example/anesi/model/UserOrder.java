package com.example.anesi.model;

import java.util.Date;

public class UserOrder {
	private Long orderNo;
    private Long productNo;
    private Long optionNo;
    private String userNo;
    private Long addrNo;
    private char deliverySit;
    private String request;
    private int orderPrice;
    private String orderName;
    private String orderEmail;
    private String orderPhone;
    private String receiptName;
    private String receiptPhone;
    private int cnt;
    private String createDate;
    private String updateDateTime;
    private String imgName;
    private String imgPath;
    private String productName;
    private int productPrice;
    private String optionName;
    private int optionPrice;
    private String manufacturer;
    private int discount;
    private String paymentNo;
    private String zipcode;
    private String addr;
    private String addr2;
    
    
	public String getZipcode() {
		return zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public String getAddr2() {
		return addr2;
	}
	public String getPaymentNo() {
		return paymentNo;
	}
	public int getDiscount() {
		return discount;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public Long getOrderNo() {
		return orderNo;
	}
	public Long getProductNo() {
		return productNo;
	}
	public Long getOptionNo() {
		return optionNo;
	}
	public String getUserNo() {
		return userNo;
	}
	public Long getAddrNo() {
		return addrNo;
	}
	public char getDeliverySit() {
		return deliverySit;
	}
	public String getRequest() {
		return request;
	}
	public int getOrderPrice() {
		return orderPrice;
	}
	public String getOrderName() {
		return orderName;
	}
	public String getOrderEmail() {
		return orderEmail;
	}
	public String getOrderPhone() {
		return orderPhone;
	}
	public String getReceiptName() {
		return receiptName;
	}
	public String getReceiptPhone() {
		return receiptPhone;
	}
	public int getCnt() {
		return cnt;
	}
	public String getCreateDate() {
		return createDate;
	}
	public String getUpdateDateTime() {
		return updateDateTime;
	}
	public String getImgName() {
		return imgName;
	}
	public String getImgPath() {
		return imgPath;
	}
	public String getProductName() {
		return productName;
	}
	public int getProductPrice() {
		return productPrice;
	}
	public String getOptionName() {
		return optionName;
	}
	public int getOptionPrice() {
		return optionPrice;
	}
}
