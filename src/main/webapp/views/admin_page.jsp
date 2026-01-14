<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Advance Filter</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
                background: url('/img/bookstore img.webp') center center no-repeat;
                background-size: cover;
            
            
        }

        h1 {
            text-align: center;
            color: white;
        }

        .top-row {
            display: flex;
            flex-direction: row;
            justify-content: center;
            gap:50px;
            width: 100%;
        }

        .bottom-row {
            display: flex;
            flex-direction: row;
            justify-content: center;
            gap:50px;
            width: 100%;
        }

        .container {
            border: 2px solid black;
            padding: 20px;
            margin: 10px;
            cursor: pointer;
            text-align: center;
            flex: 1;
            max-width: 300px;
            border-radius:8px;
            
        }

        .container.new-book {
            background-color: #66ff66; /* Green Background for New Book Register */
        }

        .container.view-record {
            background-color: #ffe066; /* Yellow Background for View Record */
        }

        .container.delete {
            background-color: #ff4d4d; /* Red Background for Delete Container */
        }

        .container.update {
            background-color: #66b3ff; /* Blue Background for Update Container */
        }

        .form-group {
            margin-top: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        label {
            margin-bottom: 10px;
            font-weight: bold;
        }

        input {
            padding: 8px;
            margin-bottom: 10px;
            border-radius:5px;
        }

        button, a.btn {
            padding: 8px 15px;
            background-color: #337ab7;
            color: #fff;
            text-decoration: none;
            border: none;
            cursor: pointer;
            border-radius: 3px;
        }

        button:hover, a.btn:hover {
            background-color: #286090;
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
            background-color: orange;
        }
        td
        {
        background-color:grey;
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
        
        
    <!--Navbar -->    
.navbar-brand {
    color: #fff;
    text-decoration: none;
    font-size: 1.5rem;
    font-weight: bold;
}

.navbar-links a {
    color: #fff;
    margin-left: 13px;
    text-decoration: none;
}
        
.navbar {
    background-color: #333;
    color: #fff;
    padding-left:500px;
        padding-right:500px;
        padding-bottom:20px;
                padding-top:20px;
        
    
}

        
    </style>
    
</head>
<body>
    <body>
    
    <nav class="navbar">
        <a class="navbar-brand" href="#"></a>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="/view">Available Books</a>
            <a href="/cart">My Books</a>
            <a href="/regis">New Book Register</a>
           <a href="/admin">Admin</a>
        </li>
        </div>
</nav>
    <h1>Admin Page</h1>

    <!-- Top Row - Two Containers Horizontally Aligned -->
    <div class="top-row">
        <div class="container new-book">
                        <label for="id">Add New Book</label><br>
        
            <a class="btn btn-secondary btn-sm update-button" href="/regis">Add New Book </a>
        </div>

        <div class="container view-record">
            <div class="form-group">
                <label for="id">View Record</label><br>
                <a class="btn btn-secondary btn-sm update-button" href="/admin">View Record</a>
            </div>
        </div>
    </div>

    <!-- Bottom Row - Two Containers Next to Each Other -->
    <div class="bottom-row">
        <div class="container delete">
            <div class="form-group">
                <form action="<c:url value='/delete'/>" method="post">
                    <label for="id">Enter ID to delete:</label>
                    <input type="text" id="id" name="id" required>
                    <button type="submit">Delete</button>
                </form>
            </div>
        </div>

        <!-- <div class="container update">
            <div class="form-group">
<form action="/edit/${id}" method="post">
                    <label for="id">Update Book</label>
                    <input type="text" id="id" name="id" required>
                                        <button type="submit">Update</button>-->
             <div class="container update">
        
            <div class="form-group">
                <form action="/search" method="get">
    <label for="id">Search by ID:</label>
    <input type="text" id="id" name="id" required>
    <button type="submit">Search</button>
</form>
                             
            </div>
           </div>
                      
                </form>
                 
            </div>
            
        
       <c:if test="${not empty e_data}">
    <table>
        <thead>
            <tr>
                 <th>Id</th>
                 <th>Image</th>
                <th>Title</th>
                <th>Author</th>
                <th>Category</th>
                <th>Price</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="book" items="${e_data}">
                <tr>
                    <td>${book.id}</td>
           <td> <img src="${pageContext.request.contextPath}/images/${book.imageFileName}" alt="${bok.title}" width="50" />
                    <td>${book.title}</td>
                    <td>${book.author}</td>
                    <td>${book.category}</td>
                    <td>${book.price}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</c:if>

<c:if test="${empty e_data}">
    <p>No results found.</p>
</c:if>
    

</body>
</html>
