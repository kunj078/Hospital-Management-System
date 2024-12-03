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

@WebServlet("/RoomAssignmentServlet")
public class RoomAssignmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RoomAssignmentServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String roomType = request.getParameter("room_type");
        String availabilityStatus = request.getParameter("availability_status");

        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO rooms (room_type, availability_status) VALUES (?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, roomType);
            ps.setString(2, availabilityStatus);
            ps.executeUpdate();
        } catch (SQLException e) {
            request.getSession().setAttribute("errorMessage", "Error adding room: " + e.getMessage());
            response.sendRedirect("index.jsp");
            return;
        }

        response.sendRedirect("index.jsp");
    }
}
