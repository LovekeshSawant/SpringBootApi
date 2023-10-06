<%@ page import="com.entity.docdetails" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Doctor Details</title>
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

        .details-container {
            width: 50%;
            margin: 0 auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
        }

        .details-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
        }

        .details-label {
            font-weight: normal;
        }

        a {
            text-decoration: none;
            color: black;
            padding: 10px 20px;
            border: none;
            margin-right: 10px;
            cursor: pointer;
        }

        .button-container {
            text-align: center;
        }

        .button-container a,
        .button-container button {
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            padding: 10px 20px;
            border: none;
            margin-right: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Doctor Details</h1>
        <button><a href="/">Logout</a></button>
    </div>

    <div class="content">
        <div class="details-container">
        <%
        	docdetails row = (docdetails)request.getAttribute("doctorData");
        
        %>
            <div class="details-group">
                <label>Name:</label>
                <span class="details-label"><%= row.getDname() %></span>
            </div>

            <div class="details-group">
                <label>Email:</label>
                <span class="details-label"><%= row.getDemail() %></span>
            </div>

            <div class="details-group">
                <label>Location:</label>
                <span class="details-label"><%= row.getDlocation() %></span>
            </div>

            <div class="details-group">
                <label>Qualification:</label>
                <span class="details-label"><%= row.getDqualification() %></span>
            </div>

            <div class="details-group">
                <label>Specialization:</label>
                <span class="details-label"><%= row.getDspecialization() %></span>
            </div>

            <div class="button-container">
                <form action="/bookAppointment" method="post" style="display: inline;">
                    <input type="hidden" name="doctorId" value="<%= row.getDname() %>">
                	<button class="action-button" type="submit">Book Appointment</button>
                </form>
            </div>
     
        </div>
    </div>
</body>
</html>
