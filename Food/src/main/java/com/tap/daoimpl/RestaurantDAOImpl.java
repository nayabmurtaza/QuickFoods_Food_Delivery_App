package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.connection.DBConnection;
import com.tap.dao.RestaurantDAO;
import com.tap.model.Restaurant;

public class RestaurantDAOImpl implements RestaurantDAO {
    private Connection connection;

    public RestaurantDAOImpl() {
        this.connection = DBConnection.getConnection();
    }

    public RestaurantDAOImpl(Connection connection) {
        this.connection = connection;
    }

    @Override
    public List<Restaurant> getAllRestaurants() {
        List<Restaurant> list = new ArrayList<>();
        String query = "SELECT * FROM restaurants";
        
        if (connection == null) return list;
        
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            
            while (rs.next()) {
                Restaurant r = new Restaurant();
                r.setId(rs.getInt("id"));
                r.setName(rs.getString("name"));
                r.setImageUrl(rs.getString("image_url"));
                r.setRating(rs.getDouble("rating"));
                r.setAddress(rs.getString("address"));
                r.setDescription(rs.getString("description"));
                r.setEta(rs.getString("eta"));
                list.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public Restaurant getRestaurant(int restaurantId) {
        Restaurant restaurant = null;
        String sql = "SELECT * FROM `restaurants` WHERE `id` = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setInt(1, restaurantId);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    restaurant = new Restaurant();
                    restaurant.setId(rs.getInt("id"));
                    restaurant.setName(rs.getString("name"));
                    restaurant.setImageUrl(rs.getString("image_url"));
                    restaurant.setRating(rs.getDouble("rating"));
                    restaurant.setAddress(rs.getString("address"));
                    restaurant.setDescription(rs.getString("description"));
                    restaurant.setEta(rs.getString("eta"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return restaurant;
    }

    // Call this helper method if you need to update restaurant records dynamically
    public void updateRestaurant(Restaurant restaurant) {
        // FIXED: Comma added between name=? and image_url=?
        String sql = "UPDATE `restaurants` SET `name` = ?, `image_url` = ?, `rating` = ?, `address` = ?, `description` = ?, `eta` = ? WHERE `id` = ?";
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
            
            pstmt.setString(1, restaurant.getName());
            pstmt.setString(2, restaurant.getImageUrl());
            pstmt.setDouble(3, restaurant.getRating());
            pstmt.setString(4, restaurant.getAddress());
            pstmt.setString(5, restaurant.getDescription());
            pstmt.setString(6, restaurant.getEta());
            pstmt.setInt(7, restaurant.getId());
            
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}