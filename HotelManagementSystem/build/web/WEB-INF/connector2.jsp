<%-- 
    Document   : connector2
    Created on : Jan 2, 2025, 12:30:44 PM
    Author     : Ryandika
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%
    String dbURL = "jdbc:mysql://localhost:3306/chec";
    String dbUser = "root"; // Ganti dengan username MySQL Anda
    String dbPassword = ""; // Ganti dengan password MySQL Anda

    Connection conn = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPassword);
    } catch (ClassNotFoundException | SQLException e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
