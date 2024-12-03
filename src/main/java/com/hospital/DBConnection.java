package com.hospital;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    // Oracle database connection details
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:orcl"; // Replace with your Oracle DB details
    private static final String USER = "sys as sysdba";
    private static final String PASSWORD = "Krishna@123"; // Replace with your Oracle password

    public static Connection getConnection() throws SQLException {
        try {
            // Load the Oracle JDBC driver
            Class.forName("oracle.jdbc.OracleDriver"); // Oracle driver class
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Oracle JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
            throw new SQLException("Driver not found", e);
        } catch (SQLException e) {
            System.out.println("Failed to create the database connection. Error: " + e.getMessage());
            e.printStackTrace();  // Print the detailed error stack trace for debugging
            throw e;  // Rethrow the exception to help in debugging
        }
    }
}
