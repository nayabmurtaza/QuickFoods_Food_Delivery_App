package com.tap.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
    
    private Map<Integer, CartItem> items;

    public Cart() {
        this.items = new HashMap<>();
    }

    // Add an item to the cart
    public void addItem(CartItem item) {
        // FIXED: Changed item.getItemId() to item.getId()
        int itemId = item.getId(); 
        
        if (items.containsKey(itemId)) {
            // If item already exists, increase its quantity
            CartItem existingItem = items.get(itemId);
            
            int newQua = item.getQuantity();
            int oldQua = existingItem.getQuantity();
            int sumQua = newQua + oldQua;
            
            existingItem.setQuantity(sumQua);
            
        } else {
            // If it's a new item, add it to the map
            items.put(itemId, item);
        }
    }

    // Update the quantity of an existing item
    public void updateItem(int itemId, int quantity) {
        if (items.containsKey(itemId)) {
            if (quantity <= 0) {
                items.remove(itemId);
            } else {
                CartItem existingcartItem=items.get(itemId);
                existingcartItem.setQuantity(quantity);
            }
        }
    }

    // Remove an item entirely from the cart
    public void removeItem(int itemId) {
        items.remove(itemId);
    }

    // Get all items currently in the cart
    public Map<Integer, CartItem> getItems() {
        return items;
    }
    
    // Calculate total price of the cart
    public double getTotalPrice() {

    	return items.values().stream().mapToDouble(item -> item.getPrice()*item.getQuantity()).sum();
    	
    }
    
    public void clear() {
    	items.clear();
    }
    
    
}