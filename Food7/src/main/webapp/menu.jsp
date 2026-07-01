<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.util.List, com.tap.model.Menu, com.tap.model.Restaurant" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Food Menu</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: #f5f5f5;
      padding: 40px 20px;
      color: #222;
    }

    .container {
      max-width: 1300px;
      margin: auto;
      margin-top: 80px;
    }
    
    /* Navbar Styles */
        .navbar {
            background-color: #fff;
            height: 70px;
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 50px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .nav-logo a {
            text-decoration: none;
            color: #e74c3c;
            font-size: 1.8rem;
            font-weight: 800;
            letter-spacing: -1px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 20px;
            align-items: center;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #e74c3c;
        }

        .btn-login {
            background-color: #e74c3c;
            color: white !important;
            padding: 8px 20px;
            border-radius: 5px;
        }

        .btn-login:hover {
            background-color: #c0392b;
        }

    .header {
      text-align: center;
      margin-bottom: 40px;
    }

    .header h1 {
      font-size: 42px;
      color: #ff5a5f;
      margin-bottom: 20px;
    }

    .header p {
      color: #666;
      font-size: 16px;
    }

    .menu-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 24px;
    }

    .menu-card {
      background: #fff;
      border-radius: 20px;
      overflow: hidden;
      box-shadow: 0 8px 20px rgba(0,0,0,0.08);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .menu-card:hover {
      transform: translateY(-8px);
      box-shadow: 0 12px 30px rgba(0,0,0,0.12);
    }

    .menu-image {
      width: 100%;
      height: 220px;
      object-fit: cover;
    }

    .menu-content {
      padding: 18px;
    }

    .menu-top {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }

    .menu-name {
      font-size: 20px;
      font-weight: 600;
    }

    .rating {
      background: #28a745;
      color: white;
      padding: 4px 10px;
      border-radius: 20px;
      font-size: 14px;
      font-weight: 500;
    }

    .description {
      color: #666;
      font-size: 14px;
      line-height: 1.6;
      margin-bottom: 18px;
      min-height: 65px;
    }

    .bottom-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .price {
      font-size: 22px;
      font-weight: 700;
      color: #ff5a5f;
    }

    .cart-btn {
      background: #ff5a5f;
      color: white;
      border: none;
      padding: 10px 16px;
      border-radius: 10px;
      cursor: pointer;
      font-size: 14px;
      font-weight: 500;
      transition: background 0.3s ease;
    }

    .cart-btn:hover {
      background: #e94a50;
    }

    @media (max-width: 600px) {
      .header h1 {
        font-size: 32px;
      }

      .menu-image {
        height: 200px;
      }
    }
  </style>
</head>
<body>
	
	<!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-logo">
            <a href="home">QUICK FOODS</a>
        </div>
        <ul class="nav-links">
            <li><a href="home">Home</a></li>
            <li><a href="profile">Profile</a></li>
            <li><a href="login" class="btn-login">Login</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </nav>

  <div class="container">
    <div class="header">
		<% 
		com.tap.model.Restaurant restaurant = (com.tap.model.Restaurant)request.getAttribute("restaurant");
			String restaurantName = (restaurant != null) ? restaurant.getName() : "Our";
		%>
			<h1><%= restaurantName %> Menu</h1>
	    <p>Freshly prepared dishes just for you</p>      
    </div>

    <div class="menu-grid">
    
    
    	<%
    		List<Menu> allMenusByRestaurant = (List<Menu>)request.getAttribute("allMenusByRestaurant");
			for (Menu menu : allMenusByRestaurant) {
			%>
				<div class="menu-card">
            <img src="<%= menu.getImageUrl() %>" loading="lazy" class="menu-image" alt="<%= menu.getItemName() %>">
            
            <div class="menu-content">
                <div class="menu-top">
                    <h2 class="menu-name"><%= menu.getItemName() %></h2>
                    <span class="rating">⭐ <%= menu.getRating() %></span>
                </div>
                
                <p class="description"><%= menu.getDescription() %></p>
                
                <div class="bottom-row">
                    <span class="price">₹<%= menu.getPrice() %></span>
                    
                    <form action="cart">
                    	<input type="hidden" name="menuId" value="<%= menu.getMenuId() %>">
                    	<input type="hidden" name="quantity" value="1">
                    	<input type="hidden" name="restaurantId" value="<%= menu.getRestaurantId() %>">
                    	<input type="hidden" name="action" value="add">
                    	<button type="submit" class="cart-btn">Add To Cart</button>
                    </form>
                    
                    
                </div>
            </div>
        </div>	
			<%        	
			}
    	%>

      

      

    </div>
  </div>
</body>
</html>
