<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tap.model.Cart"%>
<%@ page import="com.tap.model.CartItem"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your Cart</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: #f5f5f5;
	padding: 40px;
}

h1 {
	text-align: center;
	margin-bottom: 40px;
	color: #ff5200;
}

.cart-container {
	width: 90%;
	max-width: 1000px;
	margin: auto;
}

.cart-item {
	background: white;
	border-radius: 18px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 20px;
	margin-bottom: 25px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	transition: 0.2s ease;
}

.cart-item:hover {
	transform: translateY(-3px);
}

.cart-left {
	display: flex;
	gap: 20px;
	align-items: center;
}

.cart-details h2 {
	font-size: 24px;
	margin-bottom: 8px;
	color: #222;
}

.cart-details p {
	color: #666;
	margin-bottom: 6px;
}

.quantity-controls {
	display: flex;
	align-items: center;
	gap: 15px;
	margin-top: 10px;
}

.quantity-btn {
	width: 35px;
	height: 35px;
	border: none;
	background: #ff5200;
	color: white;
	font-size: 20px;
	border-radius: 8px;
	cursor: pointer;
	transition: 0.2s;
}

.quantity-btn:hover {
	background: #e64900;
}

.quantity-number {
	font-size: 18px;
	font-weight: 600;
}

.cart-right {
	text-align: right;
}

.price {
	font-size: 24px;
	color: #ff5200;
	font-weight: 700;
	margin-bottom: 15px;
}

.remove-btn {
	background: red;
	color: white;
	border: none;
	padding: 10px 16px;
	border-radius: 10px;
	cursor: pointer;
	font-weight: 500;
}

.remove-btn:hover {
	background: darkred;
}

.total-section {
	background: white;
	padding: 25px;
	border-radius: 18px;
	margin-top: 30px;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
	text-align: right;
}

.total-section h2 {
	margin-bottom: 20px;
	color: #222;
}

.checkout-btn {
	background: #ff5200;
	color: white;
	border: none;
	padding: 5px 15px;
	border-radius: 12px;
	font-size: 18px;
	cursor: pointer;
	font-weight: 600;
}

.checkout-btn:hover {
	background: #e64900;
}

.empty-cart {
	text-align: center;
	font-size: 24px;
	color: #777;
	margin-top: 80px;
}

@media ( max-width :768px) {
	.cart-item {
		flex-direction: column;
		align-items: flex-start;
	}
	.cart-right {
		width: 100%;
		margin-top: 20px;
		text-align: left;
	}
	.cart-left {
		flex-direction: column;
		align-items: flex-start;
	}
}
</style>
</head>

<body>

	<h1>Your Cart</h1>

	<div class="cart-container">

		<%
		Cart cart = (Cart) session.getAttribute("cart");
		Integer restaurantId = (Integer) session.getAttribute("restaurantId");

		if (cart != null && !cart.getItems().isEmpty()) {
			// Grabbing the grand total directly using your new custom Cart method!
			double grandTotal = cart.getTotalPrice();

			for (CartItem item : cart.getItems().values()) {
				// Calculating individual item row total (Price * Quantity)
				double itemTotal = item.getPrice() * item.getQuantity();
		%>

		<div class="cart-item">
			<div class="cart-left">
				<div class="cart-details">
					<h2><%=item.getName()%></h2>
					<p>
						Price: ₹<%=item.getPrice()%></p>
					<p>
						Total: ₹<%=itemTotal%></p>

					<div class="quantity-controls">
						<form action="cart" method="get">
							<input type="hidden" name="itemId" value="<%=item.getId()%>">
							<input type="hidden" name="action" value="update"> 
							<input
								type="hidden" name="restaurantId"
								value="<%=session.getAttribute("restaurantId")%>"> <input
								type="hidden" name="quantity"
								value="<%=item.getQuantity() - 1%>">
							<button class="quantity-btn" <%if (item.getQuantity() == 1) {%>
								disabled <%}%>>-</button>
						</form>

						<span class="quantity-number"> <%=item.getQuantity()%>
						</span>

						<form action="cart" method="get">
							<input type="hidden" name="itemId" value="<%=item.getId()%>">
							<input type="hidden" name="action" value="update"> <input
								type="hidden" name="restaurantId"
								value="<%=session.getAttribute("restaurantId")%>"> <input
								type="hidden" name="quantity"
								value="<%=item.getQuantity() + 1%>">
							<button class="quantity-btn">+</button>
						</form>
					</div>
				</div>
			</div>

			<div class="cart-right">
				<div class="price">
					₹<%=itemTotal%>
		
				</div>
				<form action="cart" method="get">
					<input type="hidden" name="itemId" value="<%=item.getId()%>">
					<input type="hidden" name="restaurantId"
						value="<%=session.getAttribute("restaurantId")%>"> 
					<input type="hidden" name="action" value="remove">
					<button class="remove-btn">Remove</button>
				</form>
			</div>
		</div>
		
		<%
			}
		%>
		
		<div class="total">
			
			<h2>Grand Total : ₹<%=grandTotal%></h2>
			
			<div class="add-more-items">
				<a href="menu?restaurantId=<%=session.getAttribute("restaurantId")%>"
					class="checkout-btn"> Add More Items </a>
			</div> 
		</div>
		

		<%
		} else {
		%>
		<div>
			<p style="text-align: center; color: #757575;">Your cart is empty 🛒</p>

			<div class="add-more-items">
				<a class="checkout-btn" href="menu?restaurantId=<%=session.getAttribute("restaurantId")%>">
					Add Items
				</a>
			</div>
		</div>
		<%
		}
		%>

		<%
		if (session.getAttribute("cart") != null) {
		%>

		<div>
			<form action="checkout.jsp" method="post" style="margin-top: 20px;">
				<input type="submit" value="Proceed to Checkout"
					class="checkout-btn">
			</form>
		</div>

		<%
		}
		%>

	</div>

</body>
</html>