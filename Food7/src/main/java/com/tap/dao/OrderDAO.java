package com.tap.dao;

import java.util.List;
import com.tap.model.Order;

public interface OrderDAO {
    
    // UPDATED: Method name changed from saveOrder to addOrder
	int addOrder(Order order); // Returns the generated orderId
	
    Order getOrder(int orderId);
    
    void updateOrder(Order order);
    
    void deleteOrder(int orderId);
    
    List<Order> getAllOrdersByUser(int userId);
}