package com.tap;

import java.io.IOException;

import com.tap.daoimpl.MenuDAOImpl;
import com.tap.model.Cart;
import com.tap.model.CartItem;
import com.tap.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			HttpSession session = req.getSession();
			
			Cart cart=(Cart)session.getAttribute("cart");
			Integer oldRestaurantId = (Integer)session.getAttribute("restaurantId");
			
			int newRestaurantId = Integer.parseInt(req.getParameter("restaurantId"));
			
			if(cart==null || oldRestaurantId != newRestaurantId) {
				cart = new Cart();
				session.setAttribute("cart", cart);
				session.setAttribute("oldRestaurantId", newRestaurantId);
				
			}
		String action = req.getParameter("action");
		
		if(action.equals("add")) {
			addItemToCart(req, cart);
		}
		else if(action.equals("update")) {
			updateItemInCart(req, cart);
		}
		else if(action.equals("delete")||action.equals("remove")) {
			deleteItemFromCart(req,cart);
		}
		
		resp.sendRedirect("cart.jsp");
		
		
	}

	private void addItemToCart(HttpServletRequest req, Cart cart) {
		
		int menuId = Integer.parseInt(req.getParameter("menuId"));
		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		MenuDAOImpl menuDAOImpl = new MenuDAOImpl();
		
		Menu menu = menuDAOImpl.getMenu(menuId);
		
		String itemName = menu.getItemName();
		double price = menu.getPrice();
		
		CartItem cartItem = new CartItem(menuId, itemName, price, quantity);
		
		cart.addItem(cartItem);		
		
		
	}
	
	
	
	private void updateItemInCart(HttpServletRequest req, Cart cart) {

		int itemId = Integer.parseInt(req.getParameter("itemId"));

		int quantity = Integer.parseInt(req.getParameter("quantity"));
		
		cart.updateItem(itemId, quantity);
		
		
	}

	private void deleteItemFromCart(HttpServletRequest req, Cart cart) {

		int itemId = Integer.parseInt(req.getParameter("itemId"));
		cart.removeItem(itemId);
		
	}

	

	
	
}


















