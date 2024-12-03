<%@ page import="java.sql.*, com.hospital.DBConnection" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Appointments List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0f7fa;
            margin: 0;
            padding: 20px;
        }

        h2 {
            color: #00796b;
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
            border: 1px solid #b2dfdb;
        }

        th {
            background-color: #00796b;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f0f4f4;
        }

        tr:hover {
            background-color: #b2dfdb;
        }

        .back-home {
            margin: 20px auto;
            text-align: center;
        }

        .back-home a {
            color: #00796b;
            text-decoration: none;
            font-weight: bold;
        }

        .back-home a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <h2>Appointments List</h2>
    <table>
        <tr>
            <th>Appointment ID</th>
            <th>Doctor ID</th>
            <th>Patient ID</th>
            <th>Appointment Date</th>
        </tr>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            try {
                con = DBConnection.getConnection();  // Get database connection
                if (con != null) {
                    String sql = "SELECT * FROM appointments";  // SQL query to fetch appointment details
                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();
                    
                    // Loop through each record and display in the table
                    while (rs.next()) {
                        int appointmentId = rs.getInt("appointment_id");
                        int doctorId = rs.getInt("doctor_id");
                        int patientId = rs.getInt("patient_id");
                        Date appointmentDate = rs.getDate("appointment_date");
                        
        %>
        <tr>
            <td><%= appointmentId %></td>
            <td><%= doctorId %></td>
            <td><%= patientId %></td>
            <td><%= appointmentDate %></td>
        </tr>
        <%
                    }
                } else {
        %>
        <tr>
            <td colspan="4">Failed to connect to the database.</td>
        </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();  // Print stack trace to server logs
        %>
        <tr>
            <td colspan="4">Error fetching appointment details: <%= e.getMessage() %></td>
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
