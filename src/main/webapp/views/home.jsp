<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Home Page</title>
    <style>
        .nav-item {
            margin-left: 70px;
        }

        /* Style for the background container */
        .background-container {
            position: relative;
        }

        /* Style for the background image */
        .background-image {
            width: 100%;
            height: auto;
            z-index: 1; /* Set a z-index lower than the book container */
        }

        /* Style for the book container */
        .book-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            margin-top: 20px;
            z-index: 2; /* Set a higher z-index to overlay on top of the background image */
        }

        /* Style for individual book cards */
        .book-card {
            flex: 0 0 calc(33.33% - 20px); /* 3 books in a row with some margin */
            margin: 10px;
            background-color: rgba(255, 255, 255, 0.7);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }
        button
        {
        background-color:orange;
        border-radius:5px;
        border: 1px solid black;
        padding-right:30px;
        padding-left:30px;
        
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand text-white" href="#">ONLINE BOOKSTORE MANAGEMENT SYSTEM</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a class="nav-link text-white" href="/cart">My Cart</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/logins">Admin</a>
                    </li>
                </ul>
                <div>
                    <a class="nav-link text-white" href="/"></a>
                </div>
            </div>
        </div>
    </nav>

    <div class="container text-center my-5 background-container">
       <!--   <h1>WELCOME TO NEW BOOK STORE</h1>-->
        <img src="/img/admin back.gif" class="background-image" alt="Background Image"/>

        <!-- Add the book container -->
        <div class="book-container">
            <!-- Book 1 -->
            <div class="book-card">
                <img src="/img/wing of fire.webp" alt="Book 1" width="100">
                <h5>Wing of Fire</h5>
                 <a href="/view"><button>Add</button></a>
                
            </div>
            
             <div class="book-card">
                <img src="/img/animal book.jpg" alt="Book 1" width="200">
                <h3>Animal </h3>
                 <a href="/view"><button>Add</button></a>
                
            </div>
            
             <div class="book-card">
                <img src="/img/python book.webp" alt="Book 1" width="100">
                <h3>Python Programming</h3>
                 <a href="/view"><button>Add</button></a>
                
            </div>
            
             <div class="book-card">
                <img src="/img/core java book.jpg" alt="Book 1" width="100">
                <h5>Core Java</h5>
                 <a href="/view"><button>Add</button></a>
                
            </div>
            
             <div class="book-card">
                <img src="/img/html css book.jpg" alt="Book 1" width="100">
                <h3>Html Css</h3>
                 <a href="/view"><button>Add</button></a>
            </div>
            
             <div class="book-card">
                <img src="/img/farmer img.jpg" alt="Book 1" width="100">
                <h3>Organic Farming</h3>
                 <a href="/view"><button>Add</button></a>
            </div>
            
          </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

</body>
</html>
