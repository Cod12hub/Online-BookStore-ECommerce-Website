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

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Body and general layout */
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    background-color: #f4f4f4;
    color: #333;
}

header {
    background-color: #333;
    color: white;
    padding: 1rem;
    text-item: center;
    display: flex;
    justify-content: space-between;
    
   
}
header h2 {
    margin: 0;
    font-size: 1.5rem;
}


header nav ul {
    list-style-type: none;
    padding: 0;
     margin: 0;
    display: flex;
    gap: 1.5rem;      
}

header nav ul li {
    display: inline;
    margin-right: 20px;
}
header nav ul li {
    margin-top:10px ;
}

header nav ul li a {
    color: white;
    text-decoration: none;
    font-weight: bold;
}

header nav ul li a:hover {
    text-decoration: underline;
}

/* Main content */
main {
    padding: 2rem;
}

/* Welcome section */
#welcome {
    text-align: center;
    margin-bottom: 2rem;
}

#welcome h1 {
    font-size: 2.5rem;
    color: #333;
}

#welcome p {
    font-size: 1.1rem;
    color: #666;
}

/* Book section */
#books {
    padding: 1.5rem 0;
}

#books h2 {
    text-align: center;
    font-size: 2rem;
    color: #333;
    margin-bottom: 1.5rem;
}

.book-list {
    display: flex;
    justify-content: space-around;
    flex-wrap: wrap;
    
}

.book-item {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    padding: 1rem;
    width: 20%;
    margin: 1rem;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}

.book-item img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
}

.book-item h3 {
    font-size: 1.5rem;
    margin: 1rem 0;
}

.book-item p {
    font-size: 1rem;
    margin: 0.5rem 0;
    color: #555;
}

.book-item p:last-child {
    font-weight: bold;
    color: #333;
}

/* Buttons */
.button-group {
    display: flex;
    justify-content: space-between;
    margin-top: 1rem;
}

.btn {
    padding: 0.5rem 1rem;
    font-size: 1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

.buy-btn {
    background-color: #4CAF50; /* Green */
    color: white;
}

.buy-btn:hover {
    background-color: #45a049;
}

.cart-btn {
    background-color: #008CBA; /* Blue */
    color: white;
}

.cart-btn:hover {
    background-color: #007bb5;
}

/* Footer */
footer {
    background-color: #333;
    color: white;
    text-align: center;
    padding: 1rem;
    margin-top: 2rem;
}

footer p {
    font-size: 1rem;
}

/* Profile dropdown styles */
.profile-dropdown {
    position: relative;
    display: inline-block;
}

.profile-dropdown-content {
    display: none;
    position: absolute;
    background-color: white;
    color:black;
    min-width: 230px;
    border: 1px solid #ddd;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    padding: 10px;
    top: 100%;
    left: 0;
    text-align:left;
}

.profile-dropdown:hover .profile-dropdown-content {
    display: block;
    position: absolute;
    left: 40px;
    transform: translateX(-40%);  /* This will center it horizontally */
}

.profile-dropdown img {
    width: 50px;
    height: 50px;
    border-radius: 50%;
   
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.h
{
text-align:left;
}



/* Media query for responsiveness */
@media (max-width: 768px) {
    .book-list {
        flex-direction: column;
        align-items: center;
    }

    .book-item {
        width: 80%;
        margin: 1rem 0;
    }
}

</style>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
 <header>
    
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
   
    
         <h2>Online Book Store Management System</h2>
 
        <nav>
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/view">Available Books</a></li>
                
                            <c:if test="${not empty sessionScope.user}">
                
                 <li class="profile-dropdown">
                    <a href="javascript:void(0)">Profile</a>
                    <div class="profile-dropdown-content">
                        <img src="img/user i.png" alt="User Image" />
                         <h3>Name: ${user.firstName} ${user.lastName}</h3>
                          <p>Email: ${user.email}</p>
                        <p><a href="/editprouser" style="color:black">Edit Profile</a></p>
                     <p><a href="/account-settings" style="color:black">Account Setting</a></p>
                    </div>
                </li>
                <li><a href="/cart">Cart</a></li>
                <li><a href="/userlogout">Logout</a></li>
                <li><a href="/userOrders">My Order</a></li>
                </c:if>
                
                            <c:if test="${empty sessionScope.user}">
                
                <li><a href="/register">Register</a></li>
                <li><a href="/login">Login</a></li>
                <li><a href="/adlogin">Admin</a>
                </c:if>
               
            </ul>
        </nav>
    </header>

    <main>
        <section id="welcome">
            <h1>Welcome to the Online Bookstore</h1>
            <p>Explore our collection of books and find your next great read!</p>
        </section>

        <section id="books">
            <h2>Available Books</h2>
            
              
            <div class="book-list">
                          <c:forEach var="bok" items="${e_data}">
            
                <div class="book-item">
                
                    <img src="${pageContext.request.contextPath}/images/${bok.imageFileName}" alt="Book 1" class="book-image" width="100">
                    <h3>${bok.title}</h3>
                    <p>Author:${bok.author} </p>
                    <p>Category:${bok.category}</p>
                    <p>Price: ${bok.price}</p>
                    <div class="button-group">
                    <form action="/book/${bok.id}" method="get">
                        <button type="submit" class="btn buy-btn">Buy Now</button></form>
                        <!-- <button class="btn cart-btn" value='/my_cart/${bok.id}'/>>Add to Cart</button>-->
                        <form action="/my_cart/${bok.id}" method="post">
    <button type="submit" class="btn cart-btn">Add to Cart</button>
</form>
                        
                    </div>
                </div>
                            </c:forEach>
                </div>
                <!-- Add more book items as needed -->
           
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Bookstore Management System. All rights reserved.</p>
    </footer>

    
</body>
</html>