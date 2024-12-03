package com.hospital;

import java.sql.Connection;
import java.sql.SQLException;

public class TestDBConnection {
    public static void main(String[] args) {
        try {
            // Try to establish a connection using the DBConnection class
            Connection connection = DBConnection.getConnection();

            // Check if the connection is successful
            if (connection != null) {
                System.out.println("Connection established successfully.");
            } else {
                System.out.println("Failed to establish connection.");
            }

            // Close the connection after the test
            connection.close();
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace(); // Print stack trace for debugging
        }
    }
}
