<%-- 
    Document   : kelolaCheckIN
    Created on : Dec 29, 2024, 9:24:09 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kelola Check-in</title>
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
            
            .table-container{
                width: 100%;
                overflow-x: auto;
                margin: 20px 0;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                background-color: #fff;
                border-radius: 8px;
                overflow: hidden;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                min-width: 1200px;
            }
            
            table td .btn {
                display: inline-block;
                padding: 8px 12px;
                margin: 2px; /* Memberikan jarak antar tombol */
                text-align: center;
                border-radius: 4px;
                font-size: 14px;
                cursor: pointer;
                text-decoration: none;
            }

            table th, table td {
                padding: 10px;
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
                white-space: nowrap;
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
        </style>
    </head>
    <body>
        <h1>Kelola Check-IN</h1>

        <!-- Tabel untuk menampilkan kamar -->
        <table>
            <thead>
                <tr>
                    <th>Nama</th>
                    <th>Nomor Telepon</th>
                    <th>Kewarganegaraan</th>
                    <th>Gender</th>
                    <th>E-mail</th>
                    <th>ID/KTP</th>
                    <th>Alamat</th>
                    <th>Check-IN Date</th>
                    <th>Bed</th>
                    <th>Tipe Kamar</th>
                    <th>Nomor Kamar</th>
                    <th>Harga</th>
                    
                </tr>
            </thead>
            <tbody>
                <%
                    // Koneksi ke database
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load driver
                        Class.forName("com.mysql.cj.jdbc.Driver");

                        // Ubah username dan password sesuai dengan database Anda
                        String url = "jdbc:mysql://localhost:3306/check";
                        String user = "root"; // username MySQL Anda
                        String password = ""; // password MySQL Anda (kosong jika default)

                        conn = DriverManager.getConnection(url, user, password);
                        stmt = conn.createStatement();
                        String sql = "SELECT * FROM `check-in`";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String nama = rs.getString("nama");
                            String nomorTelepon = rs.getString("nomorTelepon");
                            String kewarganegaraan = rs.getString("kewarganegaraan");
                            String gender = rs.getString("gender");
                            String email = rs.getString("email");
                            String idKtp = rs.getString("idKtp");
                            String alamat = rs.getString("alamat");
                            String checkIN_Date = rs.getString("checkIN_Date");
                            String bed = rs.getString("bed");
                            String tipeKamar = rs.getString("tipeKamar");
                            String nomorKamar = rs.getString("nomorKamar");
                            int harga = rs.getInt("harga");
                            
                %>
                <tr>
                    <td><%= nama %></td>
                    <td><%= nomorTelepon %></td>
                    <td><%= kewarganegaraan %></td>
                    <td><%= gender %></td>
                    <td><%= email %></td>
                    <td><%= idKtp %></td>
                    <td><%= alamat %></td>
                    <td><%= checkIN_Date %></td>
                    <td><%= bed %></td>
                    <td><%= tipeKamar %></td>
                    <td><%= nomorKamar %></td>
                    <td>Rp. <%= String.format("%,d", harga) %></td>

                </tr>
                <%
                        }
                    } catch (ClassNotFoundException e) {
                        out.println("<tr><td colspan='6'>Error: Driver tidak ditemukan!</td></tr>");
                    } catch (SQLException e) {
                        out.println("<tr><td colspan='6'>Error: Tidak dapat terhubung ke database!</td></tr>");
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

        <!-- Tambah Kamar Baru -->


    </body>
</html>