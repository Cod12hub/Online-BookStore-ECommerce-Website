<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

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
   
    <form action="/buyNow/${book.id}" method="post">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" name="customerName" value="${sessionScope.user.firstName} ${sessionScope.user.lastName}" required><br>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" value="${sessionScope.user.address}" required><br>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${sessionScope.user.mobileNumber}" required><br>
         
       
<label>Select Books:</label><br>
                <h3>${book.title}</h3>
                <p><strong>Price:</strong> ${book.price}</p>
       
           
       <center> <button type="submit">Place Order</button></center>
    </form>
    </c:if>
</body>
</html>
