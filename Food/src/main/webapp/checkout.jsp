<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<style>
    /* MATCHING THE INSTRUCTOR'S CSS PATTERN IN SCREENSHOT 4 */
    h2 {
        font-size: 24px;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 20px;
    }
    .container {
        max-width: 600px;
        margin: 50px auto;
        background: #fff;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    form {
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
    label {
        font-weight: bold;
        margin-top: 10px;
    }
    textarea, select {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }
    input[type="submit"] {
        background-color: #ff5200;
        color: white;
        border: none;
        padding: 12px;
        font-size: 18px;
        cursor: pointer;
        border-radius: 4px;
        font-weight: bold;
        margin-top: 15px;
    }
    input[type="submit"]:hover {
        background-color: #e64900;
    }
</style>
</head>
<body>

    <div class="container">
        <h2>Checkout</h2>
        <form action="checkout" method="post">
            
            <label for="address">Delivery Address:</label>
            <textarea id="address" name="address" required></textarea>
            
            <label for="paymentMethod">Payment Method:</label>
            <select name="paymentMethod" id="paymentMethod" required>
                <option value="Credit Card">Credit Card</option>
                <option value="Debit Card">Debit Card</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
            </select>
            
            <input type="submit" value="Place Order">
        </form>
    </div>

</body>
</html>