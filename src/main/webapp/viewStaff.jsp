<%@ page import="java.sql.*, com.hospital.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Staff</title>
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

        tr:nth-child(even) {
            background-color: #f0f4f4; /* Light grey for alternate rows */
        }

        tr:hover {
            background-color: #b2dfdb; /* Light teal on hover */
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

    <h2>Staff List</h2>
    <table>
        <tr>
            <th>Staff ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Contact Number</th>
            <th>Hire Date</th>
        </tr>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                con = DBConnection.getConnection();  // Get database connection
                String sql = "SELECT * FROM staff";  // SQL query to fetch staff details
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();

                // Loop through each record and display in the table
                while (rs.next()) {
                    int staffId = rs.getInt("staff_id");
                    String name = rs.getString("staff_name");
                    String role = rs.getString("role");
                    String contact = rs.getString("contact_number");
                    Date hireDate = rs.getDate("hire_date");
        %>
        <tr>
            <td><%= staffId %></td>
            <td><%= name %></td>
            <td><%= role %></td>
            <td><%= contact %></td>
            <td><%= hireDate != null ? hireDate.toString() : "N/A" %></td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                // Handle any exceptions and display error
                e.printStackTrace();
        %>
            <tr>
                <td colspan="5">Error fetching staff details</td>
            </tr>
        <%
            } finally {
                // Close ResultSet, PreparedStatement, and Connection
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        %>
    </table>

    <div class="back-home">
        <a href="index.jsp">Back to Home</a>
    </div>

</body>
</html>
