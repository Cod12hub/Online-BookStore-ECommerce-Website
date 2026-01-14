<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
            display: flex;
        }

        .sidebar {
            width: 250px;
            background-color: #343a40;
            color: white;
            height: 100vh;
            position: fixed;
            display: flex;
            flex-direction: column;
            padding: 1rem;
        }

        .sidebar .profile {
            text-align: center;
            margin-bottom: 1rem;
        }

        .sidebar .profile img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
    border: 2px solid white; /* Adds a white border around the image */
            margin-bottom: 2rem;
            
        }

        .sidebar .profile h3 {
            margin: 0;
            font-size: 1.2rem;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            margin: 0.5rem 0;
            padding: 0.5rem 1rem;
            border-radius: 4px;
            display: block;
        }

        .sidebar a:hover {
            background-color: #495057;
        }

        .container {
            margin-left: 260px;
            padding: 2rem;
            width: calc(100% - 260px);
        }

        .dashboard-cards {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 1.5rem;
            flex: 1 1 calc(25% - 1.5rem);
            min-width: 200px;
            text-align: center;
        }

        .card h3 {
            font-size: 2rem;
            margin: 0;
            color: #343a40;
        }

        .card p {
            font-size: 1rem;
            color: #6c757d;
            margin: 0.5rem 0 0;
        }

        .actions {
            margin-top: 2rem;
        }

        .actions button {
            padding: 0.75rem 1.5rem;
            margin: 0.5rem;
            border: none;
            border-radius: 4px;
            background-color: #007bff;
            color: white;
            font-size: 1rem;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #0056b3;
        }

        .footer {
            text-align: center;
            padding: 1rem;
            background-color: #343a40;
            color: white;
            position: fixed;
            bottom: 0;
            width: calc(100% - 260px);
            left: 260px;
        }
        .table-container {
        margin-top: 2rem;
        display: none;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 1rem;
    }

    table, th, td {
        border: 1px solid #ddd;
    }

    th, td {
        padding: 1rem;
        text-align: left;
    }

    th {
        background-color: #343a40;
        color: white;
    }
    .graph-container {
    margin: 2rem auto;
    padding: 2rem;
    background-color: white;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 90%;
    text-align: center;
        display: none; /* Hide graph initially */
 position: relative;
}

.graph-container canvas {
    width: 60% !important;  
    height: 40% !important; 
    max-height: 500px; 
}
        
    </style>
    <script>
// Initialize the graph
function loadChart() {
    document.querySelector('.graph-container').style.display = 'block'; 
    document.querySelector('.table-container').style.display = 'none';


    const ctx = document.getElementById('dashboardGraph').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Books', 'Categories', 'Orders', 'Customers'],
            datasets: [{
                label: 'Metrics',
                data: [${totalBooks}, 25, ${totalOrders}, ${totalCustomers}],
                backgroundColor: ['#007bff', '#28a745', '#dc3545', '#ffc107'],
            }]
        },
        options: {
            responsive: false,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
}
</script>
    
    <script>
    function showTable(type) {
        document.querySelector('.table-container').style.display = 'block';
        document.querySelector('.graph-container').style.display = 'none'; // Hide the graph container

        const bookTable = document.getElementById('bookTable');
        const customerTable = document.getElementById('customerTable');
        const bookFilter = document.getElementById('bookFilter');
        const customerFilter = document.getElementById('customerFilter');
        

        if (type === 'books') {
            bookTable.style.display = 'table';
            bookFilter.style.display = 'block'; // Show the book filter
            customerFilter.style.display = 'none'; // Hide the customer filter
            customerTable.style.display = 'none';

        } else if (type === 'customers') {
            bookTable.style.display = 'none';
            bookFilter.style.display = 'none'; // Hide the book filter
            customerTable.style.display = 'table';
            customerFilter.style.display = 'block'; // Show the customer filter

        }
    }
    function filterTable(inputId, tableId) {
        const input = document.getElementById(inputId);
        const filter = input.value.toLowerCase();
        const table = document.getElementById(tableId);
        const rows = table.getElementsByTagName('tr');

        for (let i = 1; i < rows.length; i++) { // Start from 1 to skip the header row
            const cells = rows[i].getElementsByTagName('td');
            let found = false;

            for (let j = 0; j < cells.length; j++) {
                if (cells[j].textContent.toLowerCase().includes(filter)) {
                    found = true;
                    break;
                }
            }

            rows[i].style.display = found ? '' : 'none';
        }
    }
</script>

    
</head>
<body>
    <div class="sidebar">
        <div class="profile">
         <c:if test="${not empty loggedInAdmin.imageName}">
            <img src="img/${loggedInAdmin.imageName}" alt="Admin Profile">
               
            
            <h3>${loggedInAdmin.username}</h3>
             </c:if>
            <a href="/adlogout">Logout</a>
        </div>
        <a href="/">Home</a>
        <a href="#" onclick="event.preventDefault(); showTable('books')">Manage Books</a>
        <a href="#" onclick="event.preventDefault(); showTable('customers')">Customers</a>
        <a href="#" onclick="event.preventDefault(); loadChart()">Show Chart</a>
        <a href="/admin">Action</a>
        <a href="/regis">Add Book</a>
        <a href="/showpurchase">Total Order</a>
        <a href="/adregister">Add Admin</a>
        <a href="/showreportpurchase">Generate Report</a>
        
        
    </div>
    

    <div class="container">
        <h1>Admin Dashboard</h1>
        <div class="dashboard-cards">
            <div class="card">
                <h3>${totalRevanue}</h3>
                <p>Revenue</p>
            </div>
            <div class="card">
                <h3>${totalBooks}</h3>
                <p>Total Books</p>
            </div>
            
            <div class="card">
                <h3>${totalOrders}</h3>
                <p>Orders</p>
            </div>
            <div class="card">
                <h3>${totalCustomers}</h3>
                <p>Customers</p>
            </div>
        </div>
 <div class="table-container">
  <!-- Book Filter -->
    <input
        type="text"
        id="bookFilter"
        placeholder="Search Books..."
        onkeyup="filterTable('bookFilter', 'bookTable')"
        style="margin-bottom: 1rem; display: none; width: 100%; padding: 0.5rem;"
    />
            <table id="bookTable">
                <thead>
                    <tr>
                        <th>Book ID</th>
                        <th>Title</th>
                        <th>Author</th>
                        <th>Category</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="book" items="${bookList}">
                        <tr>
                            <td>${book.id}</td>
                            <td>${book.title}</td>
                            <td>${book.author}</td>
                            <td>${book.category}</td>
                            <td>${book.price}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            
             <!-- Customer Filter -->
    <input
        type="text"
        id="customerFilter"
        placeholder="Search Customers..."
        onkeyup="filterTable('customerFilter', 'customerTable')"
        style="margin-bottom: 1rem; display: none; width: 100%; padding: 0.5rem;"
    />

            <table id="customerTable">
                <thead>
                    <tr>
                        <th>Customer ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="customer" items="${customerList}">
                        <tr>
                            <td>${customer.id}</td>
                            <td>${customer.firstName}</td>
                            <td>${customer.email}</td>
                            <td>${customer.mobileNumber}</td>
                            <td>${customer.address}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table> 
             <!-- Graph container -->
         
        </div>
         <div class="graph-container">
            <canvas id="dashboardGraph"></canvas>
        </div>
         
                          
    </div>
   
   
             
    </div>
   

    <div class="footer">
        &copy; 2024 Book Store Management System
    </div>
</body>
</html>
