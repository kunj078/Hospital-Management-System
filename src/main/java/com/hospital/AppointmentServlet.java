package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AppointmentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String doctorId = request.getParameter("doctorId");
        String patientId = request.getParameter("patientId");
        String appointmentDateStr = request.getParameter("appointmentDate"); // Changed to match JSP input name

        // Validate and convert the date string to java.sql.Date
        Date appointmentDate = null;
        try {
            appointmentDate = Date.valueOf(appointmentDateStr); // Expect yyyy-mm-dd format
        } catch (IllegalArgumentException e) {
            request.getSession().setAttribute("errorMessage", "Invalid date format. Please use yyyy-mm-dd.");
            response.sendRedirect("index.jsp");
            return;
        }

        // Proceed with database operation
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO appointments (doctor_id, patient_id, appointment_date) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setInt(1, Integer.parseInt(doctorId));
                ps.setInt(2, Integer.parseInt(patientId));
                ps.setDate(3, appointmentDate);
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error scheduling appointment: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        // Redirect to index page after successful operation
        response.sendRedirect("index.jsp");
    }
}
