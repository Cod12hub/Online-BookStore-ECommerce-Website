<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Order Details</title>
    <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1 {
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            border: 2px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 12px;
            box-sizing: border-box;
        }

        button {
            background-color: #4caf50;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
 input[type="checkbox"] {
            margin-right: 5px;
        }

        .checkbox-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 5px;
        }

        .checkbox-item {
            flex-basis: calc(33.3333% - 10px);
            box-sizing: border-box;
            padding: 5px;
        }
    </style>
   
</head>
<body>
   <center> <h1>Order Details</h1></center>
           <c:if test="${not empty sessionScope.user}">
   
    <form action="/placeOrder" method="post">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="${sessionScope.user.address}" required><br>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${sessionScope.user.mobileNumber}" required><br>
         
       
<label>Select Books:</label><br>
  <div class="checkbox-row">
            <c:forEach var="cartItem" items="${cartItems}" varStatus="loop">
                <div class="checkbox-item">
                    <input type="checkbox" id="${cartItem.id}" name="selectedBooks[]" value="${cartItem.id}">
                    <label for="book${cartItem.id}">${cartItem.title}<br>Price ${cartItem.price}<br></label><br>
                </div>
                <c:if test="${loop.index % 3 == 2 && !loop.last}">
                    <div style="width: 100%; flex-basis: 100%;"></div>
                </c:if>
            </c:forEach>
        </div>
           
       <center> <button type="submit">Place Order</button></center>
    </form>
    </c:if>
</body>
</html>
