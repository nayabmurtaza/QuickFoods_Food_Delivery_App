package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tap.connection.DBConnection;
import com.tap.dao.UserDAO;
import com.tap.model.User;

public class UserDAOImpl implements UserDAO {

    private static final String VALIDATE_USER = "SELECT * FROM `users` WHERE `email` = ? AND `password` = ?";
    private static final String GET_USER_BY_ID = "SELECT * FROM `users` WHERE `user_id` = ?";

    @Override
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(VALIDATE_USER)) {

            statement.setString(1, email);
            statement.setString(2, password);
            
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    user = extractUserFromResultSet(res);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    @Override
    public User getUser(int userId) {
        User user = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(GET_USER_BY_ID)) {

            statement.setInt(1, userId);
            
            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    user = extractUserFromResultSet(res);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    // Helper method to keep data mapping clean and DRY
    private User extractUserFromResultSet(ResultSet res) throws SQLException {
        User user = new User();
        user.setUserId(res.getInt("user_id"));
        user.setUsername(res.getString("username"));
        user.setEmail(res.getString("email"));
        user.setPassword(res.getString("password"));
        user.setPhone(res.getString("phone"));
        user.setAddress(res.getString("address"));
        user.setRegDate(res.getTimestamp("reg_date"));
        return user;
    }
}