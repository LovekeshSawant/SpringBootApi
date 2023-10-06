<!DOCTYPE html>
<html>
<head>
    <title>Doctor Signup Page</title>
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
    <form action="doctor_signup_process.php" method="post">
        <h1>Doctor Sign Up</h1>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        
        <label for="mobile">Mobile Number:</label>
        <input type="text" id="mobile" name="mobile" required>
        
        <label for="location">Location:</label>
        <input type="text" id="location" name="location" required>
        
        <label for="qualifications">Qualifications:</label>
        <input type="text" id="qualifications" name="qualifications" required>

        <!-- Add Specialization Field -->
        <label for="specialization">Specialization:</label>
        <input type="text" id="specialization" name="specialization" required>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
        
        <label for="confirm_password">Confirm Password:</label>
        <input type="password" id="confirm_password" name="confirm_password" required>

        <!-- Button Container for Centering Signup Button -->
        <div class="button-container">
            <input type="submit" value="Sign Up">
        </div>

        <!-- Option for User Registration Inside Form -->
        <p>Not a doctor? <a href="paitentsignup">Sign up here</a></p>
        <p>Already registered? <a href="/">Login here</a></p>
    </form>
</body>
</html>
