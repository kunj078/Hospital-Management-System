<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disease Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa; /* Light teal background */
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #00796b; /* Darker teal for the heading */
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: auto;
            max-width: 800px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #b2dfdb; /* Light teal border */
        }

        th {
            background-color: #00796b; /* Teal for headers */
            color: white;
        }

        .back-home {
            margin: 20px auto;
            text-align: center;
        }

        .back-home a {
            color: #00796b; /* Teal color for the link */
            text-decoration: none; /* Remove underline */
            font-weight: bold; /* Bold text */
        }

        .back-home a:hover {
            text-decoration: underline; /* Underline on hover */
        }
    </style>
</head>
<body>

    <h2>Disease Details</h2>
    <table>
        <tr>
            <th>Disease</th>
            <th>Description</th>
            <th>Treatment</th>
        </tr>
        <%
            ResultSet rs = (ResultSet) request.getAttribute("resultSet");
            if (rs != null) {
                while (rs.next()) {
                    String disease = rs.getString("disease");
                    String description = rs.getString("description");
                    String treatment = rs.getString("treatment");
        %>
        <tr>
            <td><%= disease %></td>
            <td><%= description %></td>
            <td><%= treatment %></td>
        </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="3">No data available</td>
            </tr>
        <%
            }
        %>
    </table>

    <div class="back-home">
        <a href="index.jsp">Back to Home</a>
    </div>

</body>
</html>
