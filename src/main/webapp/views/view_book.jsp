<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>View Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-xxx" crossorigin="anonymous" />

<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
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
            margin-bottom: 1.2rem;
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
        /* Search Input Styling */
   /* Search Input Styling */
/* Search Input Styling */
#search-container {
    text-align: right;
    margin-top: 50px; /* Optional: Adds spacing at the top if needed */
}

#search {
    width: 230px;
    padding: 10px;
    font-size: 16px;
    border: 1px solid black;
    border-radius: 5px;
}

    </style>
    <script>
     function filterBooks() {
    var input = document.getElementById('search');
    var filter = input.value.toLowerCase(); // Convert input to lowercase to make it case-insensitive
    var table = document.getElementById('booksTable');
    var rows = table.getElementsByClassName('bookRow'); // Get all rows with class 'bookRow'

    // Loop through each row and filter based on the title, author, or category
    for (var i = 0; i < rows.length; i++) {
        var id = rows[i].getElementsByClassName('bookId')[0].innerText.toLowerCase();
        var title = rows[i].getElementsByClassName('bookTitle')[0].innerText.toLowerCase();
        var author = rows[i].getElementsByClassName('bookAuthor')[0].innerText.toLowerCase();
        var category = rows[i].getElementsByClassName('bookCategory')[0].innerText.toLowerCase();
        var price = rows[i].getElementsByClassName('bookPrice')[0].innerText.toLowerCase();


        // Check if any of the columns match the input text
        if (id.includes(filter) || title.includes(filter) || author.includes(filter) || category.includes(filter) || price.includes(filter)) {
            rows[i].style.display = ''; // Show row if it matches
        } else {
            rows[i].style.display = 'none'; // Hide row if it doesn't match
        }
    }
}
</script>

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
            <a href="/userOrders">My Order</a>
            
            </c:if>
        </div>
    </div>
</nav>
<center><h2>Available Books</h2></center>

  <div class="container my-5 col-md-8">
    <div id="search-container">
        <label for="search">Search Books:</label>
        <input type="text" id="search" class="form-control" placeholder="Search by Title, Author, or Category" onkeyup="filterBooks()"/>
    </div>
</div>


<div class="container my-5 col-md-8">

    <table id="booksTable">
    
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
       <tbody id="booksTable">
           <c:forEach var="bok" items="${e_data}">
       
        <tr class="bookRow">
        
            <td class="bookId">${bok.id}</td>
           <td class="bookImage"> <img src="${pageContext.request.contextPath}/images/${bok.imageFileName}" alt="${bok.title}" width="100" />
</td>
            <td class="bookTitle">${bok.title}</td>
            <td class="bookAuthor">${bok.author}</td>
            <td class="bookCategory">${bok.category}</td>
            <td class="bookPrice">${bok.price}</td>
            <td>
                <!--<a class="btn btn-secondary btn-sm" href="/regis">Add Book</a>-->
                <form method="post" action="<c:url value='/my_cart/${bok.id}'/>">
                <button type="submit" class="btn btn-secondary btn-sm">Add Cart</button>
            </form>
                
               
                <!--  <a class="btn btn-secondary btn-sm" href="<c:url value='/${bok.id}'/>"class="delete-button">Delete</a> -->
              <!--<a class="btn btn-secondary btn-sm" href="<c:url value='/edit/${bok.id}'/>"class="update-button">Update </a> -->
            </td>
        </tr>
    </c:forEach>
</tbody>

    </table>
                   
</div>

</body>
</html>