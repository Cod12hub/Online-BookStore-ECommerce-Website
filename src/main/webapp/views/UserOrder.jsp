<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>

td,img
{

width:25px;

}

</style>
<body>

<h2>Your Orders</h2>

<table border="1">
    <thead>
        <tr>
            <th>Order ID</th>
            <th>Image</th>
            <th>Book Name</th>
            <th>Price</th>
            <th>Order Date</th>
            <th>Customer Name</th>
            <th>Status</th>
            <th>Show Invoice</th>
            
        </tr>
    </thead>
    <tbody>
        <!-- Loop through the orders and display them -->
        <c:forEach var="order" items="${orders}">
            <tr>
                <td>${order.id}</td>
                <td><img src="${pageContext.request.contextPath}/images/${order.book.imageFileName}" alt="Book Image"></td>
                
                <td>${order.book.title}</td> <!-- Book name -->
                <td>${order.price}</td>
                <td>${order.orderDate}</td>
                <td>${order.user.firstName} ${order.user.lastName}</td>  
                <td><button>Status</button></td>
                <td>
                    <button onclick="window.location.href='${pageContext.request.contextPath}/viewReceipt?orderId=${order.id}'">View Receipt</button>
                </td>
   </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
