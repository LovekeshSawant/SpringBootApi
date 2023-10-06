<%@ page import="java.util.List" %>
<%@ page import="com.entity.docdetails" %>
<html>
<head>
    <title>Welcome Page</title>
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

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid #ddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        /* Add a style for the buttons */
        .action-button {
            padding: 5px 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Welcome ${userName}</h1>
        <button><a href="/">Logout</a></button>
    </div>

    <div class="content">
        <!-- Display the table data sent from the controller -->
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Location</th>
                    <th>Action</th> <!-- Add a new column for buttons -->
                </tr>
            </thead>
            <tbody>
                <!-- Use JSP scriptlets to iterate through the data -->
                <%
                    List<docdetails> tableData = (List<docdetails>) request.getAttribute("tableData");
                    if (tableData != null) {
                        for (docdetails row : tableData) {
                            %>
                            <tr>
                                <td><%= row.getId() %></td>
                                <td><%= row.getDname() %></td>
                                <td><%= row.getDlocation() %></td>
                                <!-- Add buttons for Details and Book Appointment -->
                                <td>
                                    <form action="/details" method="get" style="display: inline;">
                                        <input type="hidden" name="doctorId" value="<%= row.getId() %>">
                                        <button class="action-button" type="submit">Details</button>
                                    </form>
                                    <form action="/bookAppointment" method="post" style="display: inline;">
                                        <input type="hidden" name="doctorId" value="<%= row.getDname() %>">
                                        <button class="action-button" type="submit">Book Appointment</button>
                                    </form>
                                </td>
                                <!-- Add more columns as needed -->
                            </tr>
                            <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
