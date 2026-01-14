<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Purchase Order</title>
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
        .filter-container {
            margin: 10px auto;
            width: 80%;
            text-align: center;
        }
        .filter-input {
            width: 50%;
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .table-container {
            margin: 20px auto;
            width: 80%;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #333;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .pagination {
        margin: 20px auto;
        text-align: center;
    }
    .page-link {
        display: inline-block;
        padding: 8px 12px;
        margin: 2px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-decoration: none;
        color: #333;
    }
    .page-link.active {
        background-color: #333;
        color: white;
    }
    
   .navbar {
    background-color: #333;
    color: #fff;
    padding: 15px 0;
    display: flex;
    justify-content: space-between; /* Aligns items to the left and right */
    align-items: center;
    margin-left:-17px;
    margin-right:-17px;

}

.container {
    width: 98%;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar-brand {
    color: #fff;
    text-decoration: none;
    font-size: 1.5rem;
    font-weight: bold;
}

.navbar-links {
    display: flex; 
    gap: 20px; 
}

.navbar-links a {
    color: #fff;
    text-decoration: none;
    font-size: 1rem;
    padding: 5px 10px; /* Adds padding around links for a better clickable area */
    transition: color 0.3s ease; /* Smooth color transition on hover */
}

.navbar-links a:hover {
    color: #00bcd4; /* Changes color on hover for better interaction */
        text-decoration: underline;
    
}

    </style>
</head>
<body>
<nav class="navbar">
    <div class="container">
        <a class="navbar-brand" href="#">Book Store Management System</a>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="/admindashboard">Dashboard</a>
             
        </div>
    </div>
</nav>
 <h1>Purchase Orders</h1>

    <!-- Filter Input -->
    <div class="filter-container">
        <input type="text" id="filterInput" class="filter-input" placeholder="Filter by Order ID, Product Name, or Order Date" onkeyup="filterTable()">
    </div>

    <!-- Table -->
    <div class="table-container">
        <table id="ordersTable">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Order Date</th>
                    <th>Address</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="order" items="${orders}">
                    <tr>
                        <td>${order.id}</td>
                        <td>${order.user.firstName}
                        <td>${order.book.title}</td>
                        
                        <td>${order.price}</td>
                        <td>${order.orderDate}</td>
                        <td>${order.user.address}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
     <!-- Pagination -->
    <div class="pagination">
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="?page=${i}" class="page-link ${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
    </div>

    <!-- JavaScript for Table Filtering -->
    <script>
        function filterTable() {
            const filter = document.getElementById("filterInput").value.toLowerCase();
            const table = document.getElementById("ordersTable");
            const rows = table.getElementsByTagName("tr");

            for (let i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
                const cells = rows[i].getElementsByTagName("td");
                let match = false;
                
                for (let j = 0; j < cells.length; j++) {
                    if (cells[j].innerText.toLowerCase().includes(filter)) {
                        match = true;
                        break;
                    }
                }

                rows[i].style.display = match ? "" : "none";
            }
        }
    </script>
</body>
</html>