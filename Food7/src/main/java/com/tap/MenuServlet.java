package com.tap;

import java.io.IOException;
import java.util.List;

import com.tap.dao.RestaurantDAO;
import com.tap.daoimpl.MenuDAOImpl;
import com.tap.daoimpl.RestaurantDAOImpl;
import com.tap.model.Menu;
import com.tap.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
    	MenuDAOImpl impl = new MenuDAOImpl();

    	// Get the restaurantId from the URL (e.g., /menu?restaurantId=1)
        int restaurantId = Integer.parseInt(req.getParameter("restaurantId"));
        req.getSession().setAttribute("restaurantId", restaurantId);
        
        List<Menu> allMenusByRestaurant = impl.getAllMenusByRestaurant(restaurantId);
        
     // 2. Get the specific Restaurant object to get its name
        RestaurantDAO restaurantDAO = new RestaurantDAOImpl(); 
        Restaurant restaurant = restaurantDAO.getRestaurant(restaurantId);
        req.setAttribute("restaurant", restaurant);
        
        for (Menu menu : allMenusByRestaurant) {
			
        	System.out.println(menu);
		}
        
        
        req.setAttribute("allMenusByRestaurant", allMenusByRestaurant);
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }
}