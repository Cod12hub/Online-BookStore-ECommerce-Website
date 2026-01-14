<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>My Cart</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-xxx" crossorigin="anonymous" />
    

    <style>
          body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #333;
            color: #fff;
            padding: 10px 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
        }

        .navbar-brand {
            color: #fff;
            text-decoration: none;
            font-size: 1.5rem;
            font-weight: bold;
        }

        .navbar-links a {
            color: #fff;
            margin-left: 15px;
            text-decoration: none;
        }

        .my-5 {
            margin-top: 5rem;
            margin-bottom: 5rem;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 1rem;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .btn {
            display: inline-block;
            padding: 8px 16px;
            margin-bottom: 0;
            font-size: 14px;
            font-weight: 400;
            line-height: 1.42857143;
            text-align: center;
            white-space: nowrap;
            vertical-align: middle;
            cursor: pointer;
            border: 1px solid transparent;
            border-radius: 4px;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 12px;
        }

        .btn-secondary {
            color: #fff;
            background-color: #333;
            border-color: #333;
        }

        .ms-4 {
            margin-left: 1rem;
        }

        .ms-4 i {
            color: blue;
        }

        .ms-4 i:hover {
            color: red;
        }
    </style>
</head>
<body>
    <nav class="navbar">
        <div class="container">
            <a class="navbar-brand" href="#">Book Store</a>
            <div class="navbar-links">
                <a href="/">Home</a>
                <a href="/view">Available Books</a>
                <a href="/">My Order</a>
            </div>
        </div>
    </nav>
      <center>  <h1>My Cart</h1><center>
    

    <div class="container my-5 col-md-8">
        <table id="cartTable">
            <thead>
                <tr>
                    <th scope="col">Id</th>
                    <th scope="col">Image</th>
                    <th scope="col">Name</th>
                    <th scope="col">Author</th>
                    <th scope="col">Price</th>
                    <th scope="col">Quantity</th>
                    <th scope="col">Total</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="cartItem" items="${cartItems}">
                
                    <tr>
                        <td>${cartItem.id}</td>
                         <td><img src="${pageContext.request.contextPath}/images/${cartItem.book.imageFileName}" 
                         alt="${cartItem.book.title}" width="100" /></td>
                        <td>${cartItem.title}</td>
                        <td>${cartItem.author}</td>
                        <td id="price_${cartItem.id}">${cartItem.price}</td>
                        <td><input type="number" id="quantity_${cartItem.id}" value="1" min="1" class="quantity-input" oninput="updateTotal()" /></td>
                       <!--  <td>${cartItem.price}</td>-->
                         <td id="total_${cartItem.id}">${cartItem.price}</td>
                       
                       <td><a class="btn btn-secondary btn-sm delete-button"  href="<c:url value='/deletecart/${cartItem.id}'/>">Delete</a></td>
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div style="margin-top: 20px;">
            <label><strong>Total Price: </strong></label>
            <span id="grandTotal">${totalPrice}</span>
        </div>
        
        
        <br>
                <a class="btn btn-secondary" href="/order">Place Order</a>
        
    </div>
     <script>
        // Function to update the total price for all items in the cart
        function updateTotal() {
            let grandTotal = 0;

            // Loop through each cart item and update total
            const rows = document.querySelectorAll('#cartTable tbody tr');
            rows.forEach(row => {
                const price = parseFloat(row.querySelector('td[id^="price_"]').innerText);
                const quantity = row.querySelector('.quantity-input').value;
                const total = price * quantity;
                
                // Update the total for the current row
                row.querySelector('td[id^="total_"]').innerText = total;

                // Add to grand total
                grandTotal += total;
            });

            // Update the grand total on the page
            document.getElementById('grandTotal').innerText = grandTotal.toFixed(2);
        }

        // Initial total calculation
        updateTotal();
    </script>
</body>
</html>
