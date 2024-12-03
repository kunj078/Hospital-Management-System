package com.hospital;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MedicalRecordServlet")
public class MedicalRecordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MedicalRecordServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");
        String diagnosis = request.getParameter("diagnosis");
        String treatment = request.getParameter("treatment");
        String recordDate = request.getParameter("record_date");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO medical_records (patient_id, diagnosis, treatment, record_date) VALUES (?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'))";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(patientId)); // Assuming patient_id is an integer
            ps.setString(2, diagnosis);
            ps.setString(3, treatment);
            ps.setString(4, recordDate); // date will be converted using TO_DATE in SQL
            ps.executeUpdate();
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error adding medical record: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
