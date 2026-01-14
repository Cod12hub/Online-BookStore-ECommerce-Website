<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Login</title>
<style>

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f9f9f9;
    color: #333;
}

header {
    background-color: black;
    color: white;
    padding: 1rem;
     display: flex;
    justify-content: space-between;
    align-items: center;
}
header h2 {
    margin: 0;
    font-size: 1.5rem;
}

header nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    gap: 1.5rem;
}
header nav ul li {
    margin: 0;
}

header nav ul li a {
    text-decoration: none;
    color: white;
    font-weight: bold;
}

header nav ul li a:hover {
    text-decoration: underline;
}

main {
    padding: 2rem;
}

#login {
    background-color: white;
    padding: 2rem;
    border-radius: 8px;
    max-width: 400px;
    margin: 2rem auto;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#login h1 {
    text-align: center;
    margin-bottom: 1.5rem;
}

#login form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

#login label {
    font-weight: bold;
}

#login input {
    padding: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
}

#login button {
    background-color: #4CAF50;
    color: white;
    border: none;
    padding: 0.75rem;
    font-size: 1rem;
    font-weight: bold;
    border-radius: 4px;
    cursor: pointer;
}

#login button:hover {
    background-color: #45a049;
}

footer {
    text-align: center;
    padding: 0.5rem;
    background-color: black;
    color:white;
    margin-top: 5rem;
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
<c:if test="${ not empty error}">
    <script>
        Swal.fire({
            title: 'Error!',
            text: '${error}',
            icon: 'warning',
            timer: 3000,
            showConfirmButton: false
        });   
    </script>
    </c:if>
<header>
        <h2>Online Book Store Management System</h2>

        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                 <li><a href="/view">Available Books</a></li>
                <li><a href="/register">Register</a></li>
                <li><a href="/login">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="login">
            <h1>User Login</h1>
            <form action="/loginUser" method="POST">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Login</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Bookstore Management System. All rights reserved.</p>
    </footer>
</body>
</html>