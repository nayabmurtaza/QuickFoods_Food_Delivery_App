<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.tap.model.CartItem" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Successful! 🎉</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f7f9fc;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .success-card {
            background: #ffffff;
            max-width: 550px;
            width: 100%;
            border-radius: 24px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.05);
            padding: 40px;
            text-align: center;
        }

        .icon-container {
            width: 80px;
            height: 80px;
            background: #e6fff0;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto 20px auto;
        }

        .checkmark {
            color: #2ed573;
            font-size: 45px;
            font-weight: bold;
        }

        h1 {
            color: #2f3542;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .subtitle {
            color: #747d8c;
            font-size: 15px;
            margin-bottom: 30px;
        }

        .highlight-box {
            background: #fff8f5;
            border: 1px dashed #ff5200;
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .eta-title {
            font-size: 13px;
            color: #ff5200;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .eta-time {
            font-size: 24px;
            color: #2f3542;
            font-weight: 700;
        }

        .restaurant-tag {
            font-size: 14px;
            color: #57606f;
            margin-top: 5px;
        }

        .order-summary {
            text-align: left;
            margin-bottom: 35px;
            background: #f8f9fa;
            border-radius: 16px;
            padding: 20px;
        }

        .summary-heading {
            font-size: 15px;
            color: #2f3542;
            font-weight: 600;
            margin-bottom: 15px;
            border-bottom: 1px solid #e1e4e8;
            padding-bottom: 8px;
        }

        .item-row {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            color: #57606f;
            margin-bottom: 12px;
        }

        .item-name {
            font-weight: 500;
            color: #2f3542;
        }

        .total-row {
            display: flex;
            justify-content: space-between;
            font-size: 16px;
            color: #2f3542;
            font-weight: 700;
            border-top: 1px dashed #cbd2d9;
            padding-top: 12px;
            margin-top: 12px;
        }

        .ok-btn {
            display: inline-block;
            width: 100%;
            background-color: #ff5200;
            color: white;
            text-decoration: none;
            padding: 14px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 12px;
            transition: background 0.2s ease, transform 0.1s ease;
            box-shadow: 0 4px 12px rgba(255, 82, 0, 0.2);
        }

        .ok-btn:hover {
            background-color: #e64900;
        }

        .ok-btn:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>

    <div class="success-card">
        <div class="icon-container">
            <span class="checkmark">✓</span>
        </div>

        <h1>Order Placed Successfully!</h1>
        <p class="subtitle">Your chef is already preparing something delicious.</p>

        <div class="highlight-box">
            <p class="eta-title">Estimated Delivery Time</p>
            <p class="eta-time">⏱️ <%= request.getAttribute("estimatedEta") %></p>
            <p class="restaurant-tag">Coming from: <strong><%= request.getAttribute("restaurantName") %></strong></p>
        </div>

        <div class="order-summary">
            <p class="summary-heading">Items Ordered</p>
            
            <%
                List<CartItem> orderedItems = (List<CartItem>) request.getAttribute("orderedItems");
                if (orderedItems != null) {
                    for (CartItem item : orderedItems) {
            %>
                <div class="item-row">
                    <span><span class="item-name"><%= item.getName() %></span> × <%= item.getQuantity() %></span>
                    <span>₹<%= (item.getPrice() * item.getQuantity()) %></span>
                </div>
            <%
                    }
                }
            %>

            <div class="total-row">
                <span>Grand Total Paid</span>
                <span>₹<%= request.getAttribute("totalPaid") %></span>
            </div>
        </div>

        <a href="home" class="ok-btn">OK</a>
    </div>

</body>
</html>