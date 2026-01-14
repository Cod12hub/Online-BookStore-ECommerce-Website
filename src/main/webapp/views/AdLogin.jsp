<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
</head>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 300px;
        }
        .form-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .form-container input {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
        
    </style>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    
</head>
<body>
<c:if test="${ not empty message}">
    <script>
        Swal.fire({
            title: 'Success!',
            text: '${message}',
            icon: 'success',
            timer: 3000,
            showConfirmButton: false
        });
    </script>
</c:if>

    <div class="form-container">
        <h2>Admin Login</h2>
        <form action="/admindashboard" method="POST">
           <!--  <input type="text" name="username" placeholder="Username" required>-->
                <input type="email" name="email" placeholder="Email" required>
            
            <input type="password" name="password" placeholder="Password"  required  >
            <button type="submit">Login</button><br><br>
            <center><a href="/">Home</a></center>
            
        </form>
<!-- <center><a href="/adregister" class="button">Register</a></center>-->
    </div>
    
</body>
</html>
