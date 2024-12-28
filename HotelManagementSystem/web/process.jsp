<%-- 
    Document   : process
    Created on : Dec 25, 2024, 7:13:41 PM
    Author     : Ryandika
--%>
<%@page import="java.sql.*"%>
<%@include file="WEB-INF/connector.jsp" %>
<% String akses = null; // Deklarasi variabel akses %>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Process Form</title>
</head>
<body>
    <h1>Hasil Form</h1>
    <%
        // Mengambil data dari form
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        boolean isValidUser = false;
        
        
        if (conn != null) {
            String query = "SELECT * FROM admin WHERE Nama = ? AND Password = ?";
            try (PreparedStatement stmt = conn.prepareStatement(query)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                ResultSet rs = stmt.executeQuery();

                if (rs.next()) {
                    // Dapatkan role (akses)
                    akses = rs.getString("akses");
                }
            } catch (SQLException e) {
                out.println("Error: " + e.getMessage());
            }
        }

        if (akses != null) {
            // Redirect berdasarkan tingkat akses
            if ("admin".equalsIgnoreCase(akses)) {
                response.sendRedirect("mainPage.jsp"); // Halaman untuk admin
            } else if ("user".equalsIgnoreCase(akses)) {
                response.sendRedirect("mainPage2.jsp"); // Halaman untuk user
            }
        } else {
    %>
            <script>
                alert("Username atau password salah!");
                window.location.href = "login.jsp";
            </script>
    <%
        }
    %>
    <p>username Anda: <%= username %></p>
    <p>password Anda: <%= password %></p>
</body>
</html>
