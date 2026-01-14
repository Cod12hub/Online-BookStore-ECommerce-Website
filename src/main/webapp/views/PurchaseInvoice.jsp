<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>View Receipt</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f9;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        .receipt-container {
            width: 35%;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .receipt-details {
            margin: 20px 0;
        }
        .receipt-details th, .receipt-details td {
            padding: 8px;
            text-align: left;
        }
        .receipt-details th {
            background-color: #333;
            color: white;
        }
        .receipt-details td {
            background-color: #f9f9f9;
        }
        .receipt-footer {
            margin-top: 30px;
            text-align: center;
        }
        .back-button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-button:hover {
            background-color: #45a049;
        }
         .order-summary {
            margin-top: 30px;
            text-align: right;
            font-weight: bold;
            font-size: 18px;
        }

        .order-summary p {
            margin: 10px 0;
        }

        .order-summary .total {
            font-size: 20px;
            color: #333;
        }
    </style>
</head>
<body>

<h1>Receipt for Order #${order.id}</h1>

<!-- Receipt Details -->
<div class="receipt-container">
    <table class="receipt-details" width="100%">
        <tr>
            <th>Order ID</th>
            <td>${order.id}</td>
        </tr>
        <tr>
            <th>Customer Name</th>
            <td>${order.user.firstName} ${order.user.lastName}</td>
        </tr>
        <tr>
            <th>Book Title</th>
            <td>${order.book.title}</td>
        </tr>
        <tr>
            <th>Price</th>
            <td>${order.price}</td>
        </tr>
        <tr>
            <th>Order Date</th>
            <td>${order.orderDate}</td>
        </tr>
        
    </table>
     <!-- Order Summary -->
    <div class="order-summary">
        <p><strong>Thank you for your purchase!</strong></p>
        <p class="total">Total Amount: ${order.price}</p>
    </div>

    <div class="receipt-footer">
        <a href="${pageContext.request.contextPath}/userOrders" class="back-button">Back to Orders</a>
    </div>
</div>

</body>
</html>
