<%-- 
    Document   : connector
    Created on : Dec 25, 2024, 7:30:19 PM
    Author     : Ryandika
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%
    String dbURL = "jdbc:mysql://localhost:3306/test3";
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
