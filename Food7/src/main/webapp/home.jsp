<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.tap.model.Restaurant"  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QUICK FOODS | Restaurants</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f4f4f4;
            padding-top: 80px; /* Space for the fixed navbar */
            padding-bottom: 20px;
            padding-left: 20px;
            padding-right: 20px;
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

        /* Header and Grid Styles */
        header {
            text-align: center;
            margin-bottom: 40px;
        }

        header h1 {
            color: #333;
            font-size: 2.2rem;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }
        
        /* Card Link Selector Reset Rules */
        .restaurant-link, 
        .restaurant-link:hover, 
        .restaurant-link:visited, 
        .restaurant-link:active {
            text-decoration: none !important;
            color: inherit !important;
        }

        /* Forces any deep child tag structure to drop text decoration accents */
        .restaurant-link * {
            text-decoration: none !important;
        }

        /* Card Styles */
        .restaurant-card {
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateY(-5px);
        }

        .image-container {
            position: relative;
            height: 180px;
            width: 100%;
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .eta-badge {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background: rgba(255, 255, 255, 0.9);
            padding: 5px 10px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 0.8rem;
        }

        .content {
            padding: 15px;
        }

        .name-rating {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 8px;
        }

        .name {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
        }

        .rating {
            background: #27ae60;
            color: white;
            padding: 2px 6px;
            border-radius: 4px;
            font-size: 0.85rem;
        }

        .description {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 10px;
            height: 40px;
            overflow: hidden;
        }

        .address {
            font-size: 0.8rem;
            color: #999;
            border-top: 1px solid #eee;
            padding-top: 10px;
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

    <header>
        <h1>Top Restaurants Near You</h1>
    </header>

    <div class="container">
        <%
            List<Restaurant> allRestaurants = (List<Restaurant>)request.getAttribute("allRestaurants");
            if (allRestaurants != null) {
                for (Restaurant restaurant : allRestaurants) {
        %>
            <a href="menu?restaurantId=<%=restaurant.getId() %>" class="restaurant-link">
            	<!-- Restaurant Card -->
	            <div class="restaurant-card" >
	                <div class="image-container">
	                    <img src="<%= restaurant.getImageUrl() %>" alt="<%= restaurant.getName() %>">
	                    <span class="eta-badge"><%= restaurant.getEta() %></span>
	                </div>
	                <div class="content">
	                    <div class="name-rating">
	                        <span class="name"><%= restaurant.getName() %></span>
	                        <span class="rating">★ <%= restaurant.getRating() %></span>
	                    </div>
	                    <p class="description"><%= restaurant.getDescription() %></p>
	                    <p class="address"><%= restaurant.getAddress() %></p>
	                </div>
	            </div>	
            </a>
        <%
                }
            } else {
        %>
            <p>No restaurants found.</p>
        <%
            }
        %>
    </div>

</body>
</html>



