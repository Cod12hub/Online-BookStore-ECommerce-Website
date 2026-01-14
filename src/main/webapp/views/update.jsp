<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
        crossorigin="anonymous">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: url('/img/bg.png') no-repeat;
            background-size: cover;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            background: url('/img/updateimg.jpeg') center center no-repeat;
    background-size: cover;
        }

        nav {
            width: 100%;
            background-color: #343a40;
        }

        .container {
            margin-top: 20px;
        }

        form {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 1px solid #ccc;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width:50%;
        }

        legend {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
        }

        input,select{
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
        }

        button {
            background-color: #337ab7;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-left: 35%;
        }

        button:hover {
            background-color: #286090;
        }
    </style>
</head>

<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">Book Store</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/view">Available Books</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/admindashboard">Dashboard</a>
                        
                    </li>
                   
                </ul>
                <div>
                    <a class="nav-link text-white" href="/regis">New Book Register</a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container">
        <form action="/update/${book.id}" method="post"  enctype="multipart/form-data">
          <center> <legend>Edit Details</legend></center>
            <label for="Title">Title</label>
            <input type="text" id="name" name="title" value="${book.title}" required>
            <br> <br>
            <label for="author">Author</label>
<input type="text" id="author" name="author" value="${book.author}" required pattern="[A-Za-z\s]+" placeholder="Enter alphabetic characters" title="Please enter alphabetic characters only">
            <br> <br>
            <label for="price">Price</label>
            <input type="number" id="price" name="price" value="${book.price}" required placeholder="enter only numeric" >
            <br> <br>
            
             <label for="category">Category</label>
            <select id="category" name="category" required>
                <option value="" disabled selected> ${book.category}</option>
       <!--   <input type="text" id="category" name="category" value="${book.category}" required placeholder="Enter category">-->
        <option value="Fiction">Fiction</option>
        <option value="Non-Fiction">Non-Fiction</option>
        <option value="Science">Science</option>
        <option value="History">History</option>
        <option value="Technology">Technology</option>
        <option value="Other">Other</option>
        <option value="Horror">Horror</option>
        <option value="Religion">Religion</option>
        <option value="Musical">Musical</option>
        <option value="Crime">Crime</option>
        <option value="Biography">Biography</option>
        <option value="Comic">Comic</option>
        <option value="Comedy">Comedy</option>
        
        </select>
        <br><br>
        
        
        <!-- Image File Name Field 
        <label for="imageFileName">Image File Name</label>
        <input type="text" id="imageFileName" name="imageFileName" value="${book.imageFileName}" placeholder="Enter image file name (e.g., book1.jpg)">
        <br><br>
        -->
    
  <!-- Display the current image -->
  <label for="currentImage">Current Image</label>
  <img src="${pageContext.request.contextPath}/images/${book.imageFileName}" alt="Current Book Image" width="150" />
  <br><br>
  
  <!-- Image upload field -->
  <label for="imageFile">Upload New Image:</label>
  <input type="file" id="imageFile" name="imageFile">
  <br><br>
        
        
        
            
            <button type="submit">Update</button>
        </form>
    </div>

</body>

</html>
