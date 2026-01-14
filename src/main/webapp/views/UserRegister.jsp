<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>
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
}

header nav ul {
    list-style: none;
    padding: 0;
    margin: 0;
    display: flex;
    justify-content: center;
    gap: 1.5rem;
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

#register {
    background-color: white;
    padding: 2rem;
    border-radius: 8px;
    max-width: 500px;
    margin: 2rem auto;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

#register h1 {
    text-align: center;
    margin-bottom: 1.5rem;
}

#register form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

#register label {
    font-weight: bold;
}

#register input,
#register textarea,
#register button {
    padding: 0.5rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
}

#register textarea {
    resize: vertical;
}

#register button {
    background-color: #4CAF50;
    color: white;
    border: none;
    cursor: pointer;
    font-size: 1rem;
    font-weight: bold;
}

#register button:hover {
    background-color: #45a049;
}

footer {
    text-align: center;
    padding: 1rem;
    background-color: #f1f1f1;
    margin-top: 2rem;
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
  <header>
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/register">Register</a></li>
                <li><a href="/login">Login</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="register">
            <h1>User Registration</h1>
            <form action="/registerUser" method="POST">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="mobileNumber">Mobile Number:</label>
                <input type="tel" id="mobileNumber" name="mobileNumber" pattern="[0-9]{10}" required>

                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="3" required></textarea>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="submit">Register</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Bookstore Management System. All rights reserved.</p>
    </footer>
</body>
</html>


