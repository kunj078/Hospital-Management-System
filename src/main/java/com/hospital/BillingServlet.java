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

@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BillingServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String patientId = request.getParameter("patient_id");
        String amount = request.getParameter("amount");
        String paymentDate = request.getParameter("payment_date");
        String paymentStatus = request.getParameter("payment_status");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO billing (patient_id, amount, payment_date, payment_status) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(patientId));
            ps.setDouble(2, Double.parseDouble(amount));
            ps.setDate(3, java.sql.Date.valueOf(paymentDate));
            ps.setString(4, paymentStatus);
            ps.executeUpdate();
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error adding billing record: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
