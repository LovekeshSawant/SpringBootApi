<!DOCTYPE html>
<%@ page import="com.entity.docdetails" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<html>
<head>
    <title>Book Appointment</title>
    <style>
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            color: #fff;
            padding: 10px;
        }

        .content {
            padding: 20px;
        }

        .form-container {
            width: 50%;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        input[type="text"], input[type="date"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
        }

        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Book Appointment</h1>
        <button><a href="/">Logout</a></button>
    </div>

    <div class="content">
        <div class="form-container">
            <form action="/successful" method="post">
                <div class="form-group">
                    <label for="doctorName">Doctor's Name:</label>
                    <input type="text" id="doctorName" name="dname" value="${doctorname}" readonly>
                </div>

                <div class="form-group">
                    <label for="appointmentDate">Appointment Date:</label>
                    <input type="date" id="appointmentDate" name="date" placeholder="dd-mm-yyy" required>
                </div>

                <!-- Display fixed appointment times -->
                <div class="form-group">
                    <label for="appointmentTime">Select Appointment Time:</label>
                    <select id="appointmentTime" name="time" required>
                        <option value="4:00">4:00 PM</option>
                        <option value="5:00">5:00 PM</option>
                        <option value="6:00">6:00 PM</option>
                    </select>
                </div>
				<br><a href="/welcome"><-Back</a></br>
                <center><input type="submit" value="Book Appointment"></center>
                <center><span style="color:red;font-size:larger">${message}</span></center>
            </form>
        </div>
        
    </div>
</body>
</html>
