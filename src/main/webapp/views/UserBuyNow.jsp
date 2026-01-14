<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

    <style>
        /* Add your custom styles for book details page here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }
        
       .navbar {
    background-color: #333;
    color: #fff;
    padding: 15px 0;
    display: flex;
    justify-content: space-between; /* Aligns items to the left and right */
    align-items: center;
   

}

.container {
    width: 97%;
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


        .book-details-container {
            width: 80%;
            margin: 50px auto;
            padding: 2rem;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .book-details-container h2 {
            text-align: center;
            font-size: 2rem;
        }

        .book-info {
            display: flex;
            gap: 2rem;
        }

        .book-info img {
            max-width: 250px;
            border-radius: 8px;
        }

        .book-info .details {
            max-width: 600px;
        }

        .book-info .details h3 {
            font-size: 1.8rem;
            color: #333;
        }

        .book-info .details p {
            font-size: 1.2rem;
            color: #555;
            line-height: 1.5;
        }

        .button-group {
            margin-top: 2rem;
            text-align: center;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            font-size: 1.2rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #4CAF50;
            color: white;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="container">
        <a class="navbar-brand" href="#">Book Store Management System</a>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="/view">Available Books</a> 
                                        <c:if test="${not empty sessionScope.user}">
                                        <a href="/cart">My Cart</a>
                                        <a href="/userOrders"">My Orders</a>
                                        </c:if>
            
        </div>
    </div>
</nav>

    <div class="book-details-container">
        <h2>Book Details</h2>
        <div class="book-info">
            <img src="${pageContext.request.contextPath}/images/${book.imageFileName}" alt="Book Image">
            <div class="details">
                <h3>${book.title}</h3>
                <p><strong>Author:</strong> ${book.author}</p>
                <p><strong>Category:</strong> ${book.category}</p>
                <p><strong>Price:</strong> ${book.price}</p>
            </div>
        </div>
        <div class="button-group">
            <form action="/userbuynow/${book.id}" method="get">
                <button type="submit" class="btn">Buy Now</button>
            </form><br>
            <form action="/my_cart/${book.id}" method="post">
                <button type="submit" class="btn">Add to Cart</button>
            </form>
        </div>
    </div>

</body>
</html>
