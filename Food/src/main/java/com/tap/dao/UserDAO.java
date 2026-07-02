package com.tap.dao;

import com.tap.model.User;

public interface UserDAO {
    // Used to validate user log-in credentials
    User getUserByEmailAndPassword(String email, String password);
    
    // Used to retrieve user profiles by an ID reference 
    User getUser(int userId);
}