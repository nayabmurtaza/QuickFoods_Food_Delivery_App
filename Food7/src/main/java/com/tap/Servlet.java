package com.tap;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.tap.daoimpl.RestaurantDAOImpl;
import com.tap.model.Restaurant;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class Servlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
    	System.out.println("--- Servlet Hit Successfully! ---");
    		
        
            RestaurantDAOImpl impl = new RestaurantDAOImpl();
            List<Restaurant> allRestaurants = impl.getAllRestaurants();
            
            for (Restaurant restaurant : allRestaurants) {
				System.out.println(restaurant);
			}
            
            req.setAttribute("allRestaurants", allRestaurants);
            
            RequestDispatcher rd = req.getRequestDispatcher("home.jsp");
            rd.forward(req, resp);

        
    }
}

































