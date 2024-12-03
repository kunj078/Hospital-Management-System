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

@WebServlet("/DepartmentServlet")
public class DepartmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public DepartmentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String departmentName = request.getParameter("department_name");
        String headOfDepartment = request.getParameter("head_of_department");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO departments (department_name, head_of_department) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, departmentName);
            ps.setInt(2, Integer.parseInt(headOfDepartment));
            ps.executeUpdate();
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error adding department: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
