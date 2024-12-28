<%-- 
    Document   : kelolaKamar
    Created on : Dec 26, 2024, 10:56:34 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kelola Kamar</title>
        <style>
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
                color: #2c3e50;
            }

            h1 {
                text-align: center;
                margin-top: 30px;
                color: #3498db;
            }

            table {
                width: 80%;
                margin: 20px auto;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            table th, table td {
                padding: 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            table th {
                background-color: #3498db;
                color: white;
                font-weight: bold;
            }

            table td {
                color: #333;
            }

            .btn {
                padding: 10px 15px;
                margin: 5px;
                border: none;
                cursor: pointer;
                border-radius: 5px;
                font-size: 14px;
            }

            .btn-edit {
                background-color: #2ecc71;
                color: white;
            }

            .btn-delete {
                background-color: #e74c3c;
                color: white;
            }

            .btn-add {
                display: block;
                width: 150px;
                margin: 20px auto;
                background-color: #3498db;
                color: white;
                text-align: center;
                padding: 10px;
                border-radius: 5px;
                text-decoration: none;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
            }

            .form-group input, .form-group select {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 14px;
            }

            .container {
                width: 60%;
                margin: 20px auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <h1>Kelola Kamar Hotel</h1>

        <!-- Tabel untuk menampilkan kamar -->
        <table>
            <thead>
                <tr>
                    <th>Nomor Kamar</th>
                    <th>Tipe Kamar</th>
                    <th>Tipe Bed</th>
                    <th>Harga (Rupiah)</th>
                    <th>Status</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    // Koneksi ke database
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM status";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            int nomorKamar = rs.getInt("nomorKamar");
                            String tipeKamar = rs.getString("tipeKamar");
                            String tipeBed = rs.getString("tipeBed");
                            int harga = rs.getInt("harga");
                            String status = rs.getString("status");
                %>
                <tr>
                    <td><%= nomorKamar %></td>
                    <td><%= tipeKamar %></td>
                    <td><%= tipeBed %></td>
                    <td>Rp. <%= String.format("%,d", harga) %></td>
                    <td><%= status %></td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>

       

    </body>
</html>
