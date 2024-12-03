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

@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DoctorServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String experience = request.getParameter("experience");
        String contact = request.getParameter("contact");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO doctors (doctor_name, specialization, experience, contact_number) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, specialization);
            ps.setInt(3, Integer.parseInt(experience));
            ps.setString(4, contact);
            ps.executeUpdate();
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error adding doctor: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
