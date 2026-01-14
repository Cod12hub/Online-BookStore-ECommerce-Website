<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Generate Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .container {
            max-width: 500px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .form-group {
            margin-bottom: 15px;
            width: 25%;  
        }
        
        
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }
        input[type="date"],
        input[type="number"],
        button {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
        button {
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        table {
            width: 85%;
            border-collapse: collapse;
            margin-top: 20px;
            margin-left:100px;
        }
        table th, table td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }
        table th {
            background-color: #f4f4f4;
        }
        .error {
            color: red;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Generate Report</h2>
        <form action="/showreportpurchase" method="get">
            <!-- From Date -->
            <div class="form-group">
                <label for="fromDate">From Date:</label>
                <input type="date" name="fromDate" id="fromDate" required>
            </div>

            <!-- To Date -->
            <div class="form-group">
                <label for="toDate">To Date:</label>
                <input type="date" name="toDate" id="toDate" required>
            </div>

            <!-- User ID (optional) -->
            <div class="form-group">
                <label for="userId">User Id</label>
                <input type="number" name="userId" id="userId" placeholder="optional">
            </div>

            <!-- Submit Button -->
            <button type="submit">Generate Report</button>
        </form>
        </div>

        <!-- Display Report -->
        <c:if test="${not empty orders}">
          <center>  <h3>Report Results</h3></center>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>User ID</th>
                        <th>Customer Name</th>
                        <th>Address</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.id}</td>
                            <td>${order.orderDate}</td>
                            <td>${order.price}</td>
                            <td>${order.user.id}</td>
                        <td>${order.user.firstName}${order.user.lastName}
                        <td>${order.user.address }</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    
</body>
</html>