package com.tap.dao;

import java.util.List;
import com.tap.model.OrderItem;

public interface OrderItemDAO {
    
    // Adds a single line item into the database
    void addOrderItem(OrderItem orderItem);
    
    // Retrieves a specific item row by its ID
    OrderItem getOrderItem(int orderItemId);
    
    // Fetches all items linked to a specific overall order (Used for receipts / order histories!)
    List<OrderItem> getOrderItemsByOrder(int orderId);
}