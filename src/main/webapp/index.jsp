<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        header {
            background-color: #4CAF50;
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav {
            background-color: #333;
            padding: 10px 0;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
            text-align: center;
        }

        nav ul li {
            display: inline-block;
            position: relative; /* Required for dropdown positioning */
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
            padding: 10px 15px;
            transition: background-color 0.3s, color 0.3s;
        }

        nav ul li a:hover {
            background-color: #45a049;
            color: white;
            border-radius: 5px;
        }

        .hero-image {
            width: 100%;
            height: auto;
            margin-top: 20px;
        }

        .error-message {
            color: red;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }

        /* Dropdown styling */
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #333;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #575757;
        }

        nav ul li:hover .dropdown-content {
            display: block; /* Show the dropdown on hover */
        }

    </style>
</head>
<body>

    <header>
        <h1>Welcome to the Hospital Management System</h1>
        <nav>
            <ul>
                <!-- Doctors & Appointments Dropdown -->
                <li>
                    <a href="#">Doctors & Appointments</a>
                    <ul class="dropdown-content">
                        <li><a href="doctorForm.jsp">Add Doctor</a></li>
                        <li><a href="viewDoctors.jsp">View Doctors</a></li>
                        <li><a href="appointmentForm.jsp">Schedule Appointment</a></li>
                        <li><a href="viewAppointments.jsp">View Appointments</a></li>
                    </ul>
                </li>
                <!-- Patients & Records Dropdown -->
                <li>
                    <a href="#">Patients & Records</a>
                    <ul class="dropdown-content">
                        <li><a href="patientForm.jsp">Add Patient</a></li>
                        <li><a href="viewPatient.jsp">View Patients</a></li>
                        <li><a href="medical_records.jsp">Medical Records</a></li>
                        <li><a href="viewMedicalRecord.jsp">Show Medical Records</a></li>
                    </ul>
                </li>
                <!-- Staff Management Dropdown -->
                <li>
                    <a href="#">Staff Management</a>
                    <ul class="dropdown-content">
                        <li><a href="staff.jsp">Add Staff</a></li>
                        <li><a href="viewStaff.jsp">View Staff</a></li>
                    </ul>
                </li>
                <!-- Departments & Rooms Dropdown -->
                <li>
                    <a href="#">Departments & Rooms</a>
                    <ul class="dropdown-content">
                        <li><a href="department.jsp">Add Department</a></li>
                        <li><a href="viewDepartments.jsp">View Departments</a></li>
                        <li><a href="roomAssignment.jsp">Assign Room</a></li>
                        <li><a href="viewRoom.jsp">View Rooms</a></li>
                    </ul>
                </li>
                <!-- Billing & Prescriptions Dropdown -->
                <li>
                    <a href="#">Billing & Prescriptions</a>
                    <ul class="dropdown-content">
                        <li><a href="billing.jsp">Billing Details</a></li>
                        <li><a href="viewBilling.jsp">Billing History</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </header>

    <main>
        <img src="https://media.vanguardcommunications.net/Hospital-exterior.jpg" alt="Hospital Image" class="hero-image">
        
        <% if (session.getAttribute("errorMessage") != null) { %>
            <div class="error-message"><%= session.getAttribute("errorMessage") %></div>
            <%
                session.removeAttribute("errorMessage");
            }
        %>
    </main>

</body>
</html>
