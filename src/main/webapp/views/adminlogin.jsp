<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<style>
      
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
}

.navbar {
    background-color: #333;
    color: #fff;
    padding: 10px 0;
    width: 100%;
    box-sizing: border-box;
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

.navbar-links {
    display: flex;
    margin-top: 10px;
}

.navbar-links a {
    color: #fff;
    margin-left: 15px;
    text-decoration: none;
}
.background-container {
    position: relative;
    width: 100%;
    height: 90vh;
    background: url('/img/bookstore img.webp') center center no-repeat;
    background-size: cover;
    overflow: hidden;
}

.registration-container {
    border: 2px solid black;
    padding: 20px;
    max-width: 400px;
    width: 100%;
    box-sizing: border-box;
    margin: 50px auto;
    margin-top:150px;
    border-radius:9px;
    background-color:white;
  
}

.registration-form {
    display: flex;
    flex-direction: column;
}

.form-group {
    margin-bottom: 15px;
}

label {
    margin-bottom: 5px;
}

input {
    padding: 8px;
    width: 100%;
    box-sizing: border-box;
}

button {
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    cursor: pointer;
}

button:hover {
    background-color: #0056b3;
}

.btn {
    padding: 12px;
    background-color: #337ab7;
    color: #fff;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}

.btn:hover {
    background-color: #286090;
}
legend
{
text-align:center;
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
            <a href="/cart">My Books</a>
        </div>
    </div>
</nav>
<div class="background-container">
<div class="registration-container">
    <form action="/login/authenticate" method="post" class="registration-form">
        <legend><h1>Admin Login</h1></legend>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter character only" required pattern="[A-Za-z\s]+"  >
        </div>
        <button class="btn" type="submit">Login</button>
    </form>
</div>
</div>

</body>
</html>