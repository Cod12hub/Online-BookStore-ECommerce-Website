<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
            <%@page isELIgnored="false" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 20px;
        }

        h1, h2 {
            color: #333;
            text-align: left;
        }
        .h
        {
        text-align:center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #4caf50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .total {
            text-align: right;
            font-weight: bold;
            margin-top: 10px;
            font-size:23px;
            
        }

        .print-button {
            text-align: center;
            margin-top: 20px;
        }

        button {
            padding: 10px 15px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }
         .store-image {
            position: absolute;
            top: 20px;
            right: 20px;
            width: 150px; /* Adjust the size as needed */
            height: auto;
        }
        
    </style>
    <script>
        function calculateTotal() {
            var prices = document.getElementsByClassName("price");
            var total = 0;

            for (var i = 0; i < prices.length; i++) {
                total += parseFloat(prices[i].textContent);
            }

            document.getElementById("totalPrice").textContent = "Total Price: Rs," + total.toFixed(2);
        }
        
      
      
     
       
    </script>
</head>

<body onload="calculateTotal()">
<h1 class="h">Order Comfirmed</h1>
<center><h4>Your order has been successfully placed. Below are your order details:</h4></center>
    <h1>Order Receipt</h1>
    <h2>Customer Name: ${NAME}</h2>
    <h2>Customer Address: ${ADDRESS}</h2>
    <h2>Employee Phone: ${PHONE}</h2>

    <h2>Selected Books:</h2>
               <c:if test="${not empty sessionScope.user}">
    

    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Price</th>
        </tr>
        <c:forEach var="cartItem" items="${cartItems}">
            <tr>
                <td>${cartItem.title}</td>
                <td>${cartItem.author}</td>
                <td class="price">${cartItem.price}</td>
            </tr>
        </c:forEach>
    </table>

    <div class="total" id="totalPrice">Total </div>
    <img class="store-image" src="img/bookstore img.webp" alt="Bookstore Image">

    <div class="print-button">
        <button onclick="window.print()">Print Receipt</button>
        
                <button><a href="/">Home</a></button>
        
    </div>
    </c:if>
  
 

</body>
</html>