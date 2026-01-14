<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Record</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-xxx" crossorigin="anonymous" />

<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
             background: url('img/bookstore img.webp') center center no-repeat fixed;
            background-size: cover;
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
    background-color: rgba(255, 255, 255, 0.7);            
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
            color: black;
            border-color: #333;
        }
        #del
        {
        background-color:red;
        }
        #ad
        {
        background-color:green;
        }
         #upd
        {
        background-color:orange;
        }
         #ad
        {
        background-color:green;
        }
         #adv
        {
        background-color:yellow;
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
            <a href="/regis">New Book Register</a>
            <a href="/admindashboard">Dashboard</a>
            
        </div>
    </div>
</nav>

<div class="container my-5 col-md-8">
    <table>
        <thead>
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Image</th>
                <th scope="col">Name</th>
                <th scope="col">Author</th>
                <th scope="col">Category</th>
                <th scope="col">Price</th>
                <th scope="col">Action</th>
            </tr>
        </thead>
       <tbody>
           <c:forEach var="bok" items="${e_data}">
       
        <tr>
            <td>${bok.id}</td>
            <td style="width: 70px; height: 70px; padding: 0; overflow: hidden;"> <img src="${pageContext.request.contextPath}/images/${bok.imageFileName}" alt="${bok.title}"  
             style="width: 100%; height: 100%; object-fit: cover;"/></td>
            <td>${bok.title}</td>
            <td>${bok.author}</td>
            <td>${bok.category}</td>
            <td>${bok.price}</td>
            <td>
              <a class="btn btn-secondary btn-sm"  id="ad" href="/regis">Add Book</a>
              <a class="btn btn-secondary btn-sm" id="del" href="<c:url value='/${bok.id}'/>"class="delete-button">Delete</a> 
              <a class="btn btn-secondary btn-sm"  id="upd" href="<c:url value='/edit/${bok.id}'/>"class="update-button">Update </a> 
              <a class="btn btn-secondary btn-sm" id="adv" href="/admin2"class="update-button">Advance </a> 
              
            </td>
        </tr>
    </c:forEach>
</tbody>

    </table>
                   
</div>
</body>
</html>