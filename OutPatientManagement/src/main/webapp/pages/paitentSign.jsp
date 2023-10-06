<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Signup Page</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #E0E0E0;
        }
        
        form {
            text-align: left;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: white;
        }

        label,
        input {
            display: block;
            margin-bottom: 10px;
        }

        .button-container {
            text-align: center;
        }

        .button-container input[type="submit"] {
            display: inline-block;
            margin: 0;
        }

        .message-box {
            background-color: #f2f2f2;
            padding: 10px;
            margin-bottom: 10px;
        }

        .message {
            color: green;
            font-size: smaller;
            text-align: center;
        }
    </style>
</head>
<body>
    <form action="/paitentdata" object="${PatientData}" method="post">
        <h1>Patient Sign Up</h1>

        <div class="message-box">
            <div class="message">
                <%
                    String message = (String) session.getAttribute("message");
                %>
                ${message}
            </div>
        </div>

        <label for="name">Name:</label>
        <input type="text" id="name" name="pname" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="pemail" required>
        
        <label for="mobile">Mobile Number:</label>
        <input type="text" id="mobile" name="pmobile" required>
        
        <label for="location">Location:</label>
        <input type="text" id="location" name="plocation" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>

        <div class="button-container">
            <input type="submit" value="Sign Up">
        </div>
 
	    <p>Are you a doctor? <a href="docSignup">Register here</a></p>
	    <p>Already registered? <a href="/">Login here</a></p>

        <%
            session.removeAttribute("message");
        %>
    </form>
</body>
</html>
