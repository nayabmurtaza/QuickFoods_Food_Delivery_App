package com.tap.model;

import java.util.List;
import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {
	
	private int orderId;
    private Timestamp orderDate;
    private int userId;
    private int restaurantId;
    private String address;
    private String paymentMethod;
    private double totalAmount;
    private String status;
    private List<OrderItem> orderItems;

    public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getRestaurantId() {
		return restaurantId;
	}

	public void setRestaurantId(int restaurantId) {
		this.restaurantId = restaurantId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}

	public Order() {

    	this.orderDate=new Timestamp(System.currentTimeMillis());
    	this.orderItems=new ArrayList<>();
    	
    }

	public Order(int orderId, Timestamp orderDate, int userId, int restaurantId, String address, String paymentMethod,
			double totalAmount, String status) {
		super();
		this.orderId = orderId;
		this.orderDate = orderDate;
		this.userId = userId;
		this.restaurantId = restaurantId;
		this.address = address;
		this.paymentMethod = paymentMethod;
		this.totalAmount = totalAmount;
		this.status = status;
	}

	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", orderDate=" + orderDate + ", userId=" + userId + ", restaurantId="
				+ restaurantId + ", address=" + address + ", paymentMethod=" + paymentMethod + ", totalAmount="
				+ totalAmount + ", status=" + status + "]";
	}
    
    
    
}

