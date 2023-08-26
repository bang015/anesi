package com.example.anesi.model;

import java.sql.Date;

public class Statistics {
	private int totalOrders;
	private int todayOrders;
	private int overallTotal;
	private int overallToday;
	private Date orderDate;
	private int totalOrderCount;
	private int totalOrderAmount;
	private String CategoryGroup;
	private int TotalCount;
	private String csatGroup;
	private int csatCount;
	
	
	public int getTotalOrders() {
		return totalOrders;
	}
	public int getTodayOrders() {
		return todayOrders;
	}
	public int getOverallTotal() {
		return overallTotal;
	}
	public int getOverallToday() {
		return overallToday;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public int getTotalOrderCount() {
		return totalOrderCount;
	}
	public int getTotalOrderAmount() {
		return totalOrderAmount;
	}

	
}
