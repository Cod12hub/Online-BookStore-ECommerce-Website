<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Add Book</title>
<style>
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
                    background: url('/img/add book.gif') center center no-repeat;
                    background-size:cover;
    
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

.registration-container {
    border: 2px solid black;
    padding: 20px;
    margin: 50px auto;
    max-width: 400px;
background-color: rgba(255, 255, 255, 0.5);
border-radius:5px;
    
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
#category
{
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




</style>
</head>
<body>

<nav class="navbar">
    <div class="container">
        <a class="navbar-brand" href="#">Book Store</a>
        <div class="navbar-links">
            <a href="/">Home</a>
            <a href="/view">Available Books</a>
            <a href="/admindashboard">Dashboard</a>
        </li>
        </div>
    </div>
</nav>

<div class="container registration-container">
    <h4 class="text-center">New Book Register</h4>
    <form action="/success" method="post" class="registration-form" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">Title:</label>
            <input type="text" id="name" name="title" required>
        </div>

        <div class="form-group">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required pattern="[A-Za-z]+"  placeholder="enter only char" title="Please enter alphabetic characters only">
        </div>

        <div class="form-group">
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required placeholder="enter only numeric">
        </div>
        
        <div class="form-group">
          <label for="category">Category:</label>
    <select id="category" name="category" required>
        <option value="" disabled selected>Select a category</option>
        <option value="Other">Other</option>
        <option value="Fiction">Fiction</option>
        <option value="Non-Fiction">Non-Fiction</option>
        <option value="Science">Science</option>
        <option value="History">History</option>
        <option value="Technology">Technology</option>
        <option value="Horror">Horror</option>
        <option value="Religion">Religion</option>
        <option value="Musical">Musical</option>
        <option value="Crime">Crime</option>
        <option value="Biography">Biography</option>
        <option value="Comic">Comic</option>
        <option value="Comedy">Comedy</option>
        
        
    </select>
    </div>
     
     <div>
    <label for="imageFile">Upload Image:</label>
    <input type="file" id="imageFile" name="imageFile">
    </div>

        <center>
            <a href="/admin"><button type="submit">Submit</button></a>
        </center>
    </form>
</div>
	
</body>
</html>