<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            background-color: #E0E0E0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: white;
            text-align: left;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
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
    </style>
</head>
<body>
    <form action="loginDetails" method="post">
        <h1>Login</h1>
        <% 
        	String message = (String) session.getAttribute("message"); 
        	session.removeAttribute("message");
        %>
        ${message}
        <label for="email">Email:</label>
        <input type="email" id="email" name="pemail" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <!-- Button Container for Centering Login Button -->
        <div class="button-container">
            <input type="submit" value="Login">
        </div>

        <!-- Option for User Registration -->
        <p>Not registered? <a href="paitentsignup">Sign up here</a></p>
        <%
            session.removeAttribute("message");
        %>
    </form>
</body>
</html>
