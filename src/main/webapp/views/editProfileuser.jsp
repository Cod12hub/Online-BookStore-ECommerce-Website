<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
</head>
 <style>
        form {
            max-width: 500px;
            margin: 20px auto;
            padding: 20px;
            background: #f9f9f9;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        form label {
            font-weight: bold;
        }

        form input, form button {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
        }

        .btn-submit {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2 style="text-align: center;">Edit Profile</h2>
    <form action="/editproupdate" method="post">
    <input type="hidden" name="id" value="${user.id}">
    
           <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" value="${user.firstName}" required>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" value="${user.lastName}" required>

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="${user.email}" required>

    <label for="mobileNumber">Mobile Number:</label>
    <input type="tel" id="mobileNumber" name="mobileNumber" value="${user.mobileNumber}" pattern="[0-9]{10}" required>

    <label for="address">Address:</label>
    <textarea id="address" name="address" rows="3" required>${user.address}</textarea><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" value="${user.password}" required>

    <button type="submit">Update Profile</button>
</form>

</body>
</html>