<%-- 
    Document   : checkOut
    Created on : Dec 27, 2024, 2:40:19 PM
    Author     : Bramandita
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Check-OUT</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            color: #3498db;
        }
        .form-container {
            width: 800px;
            margin: 50px auto;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 20px 40px;
        }
        .form-container h1 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
            font-size: 28px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-group label {
            font-weight: bold;
            color: #333333;
        }
        .form-group input, 
        .form-group select, 
        .form-group button {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-top: 8px;
        }
        .form-group input:focus, 
        .form-group select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }
        .button-group {
            text-align: center;
        }
        .button-group button {
            width: 30%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin: 5px;
            color: #ffffff;
        }
        .button-group button:hover {
            opacity: 0.9;
        }
        .btn-confirm {
            background-color: #28a745;
        }
        .btn-reset {
            background-color: #dc3545;
        }
        .btn-back {
            background-color: #007bff;
        }
        .banner {
            text-align: center;
            background-color: #007bff;
            color: #ffffff;
            padding: 10px;
            border-radius: 10px 10px 0 0;
        }
    </style>
</head>
<body>
    
    
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/check"); // ganti dengan database yang digunakan
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    
    
    
    <div class="form-container">
        <!-- Banner -->
        <div class="banner">
            <h1>Manajemen Reservasi Hotel</h1>
        </div>
        <!-- Judul Halaman -->
        <h1>Customer Check-OUT</h1>
        
        <!-- Form Check-OUT -->
        <form action="CheckOUTHandler.jsp" method="post">
            <div class="form-group">
                <label for="idKtp">ID/KTP:</label>
                    <select id="idKtp" name="idKtp">
                <%
                    try {
                        stmt = conn.createStatement();
                        String sql = "SELECT DISTINCT idKtp FROM `check-in`";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String idKtp = rs.getString("idKtp");
                %>
                <option value="<%= idKtp %>"><%= idKtp %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
                    </select>
            </div>
            <div class="form-group">
                <label for="nama">Nama Pelanggan:</label>
                    <select id="nama" name="nama">
                    <%
                        try {
                            stmt = conn.createStatement();
                            String sql = "SELECT DISTINCT nama FROM `check-in`";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String nama = rs.getString("nama");
                    %>
                    <option value="<%= nama %>"><%= nama %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </select>
            </div>
            <div class="form-group">
                <label for="checkIN_Date">Tanggal Check-IN:</label>
                    <select id="checkIN_Date" name="checkIN_Date">
                    <%
                        try {
                            stmt = conn.createStatement();
                            String sql = "SELECT DISTINCT checkIN_Date FROM `check-in`";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String checkIN_Date = rs.getString("checkIN_Date");
                    %>
                    <option value="<%= checkIN_Date %>"><%= checkIN_Date %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </select>
            </div>
            <div class="form-group">
                <label for="checkOUT_Date">Tanggal Check-OUT:</label>
                <input type="date" id="checkOUT_Date" name="checkOUT_Date" 
                        value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
            </div>
            <div class="form-group">
                <label for="nomorTelepon">Nomor Telepon:</label>
                    <select id="nomorTelepon" name="nomorTelepon">
                    <%
                        try {
                            stmt = conn.createStatement();
                            String sql = "SELECT DISTINCT nomorTelepon FROM `check-in`";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                String nomorTelepon = rs.getString("nomorTelepon");
                    %>
                    <option value="<%= nomorTelepon %>"><%= nomorTelepon %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    </select>
            </div>
            <div class="form-group">
                <label for="harga">Harga Per-Hari:</label>
                <select id="harga" name="harga">
                    <%
                        try {
                            String sql = "SELECT harga FROM `check-in`";
                            rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                int harga = rs.getInt("harga");
                    %>
                    <option value="<%= harga %>">Rp. <%= String.format("%,d", harga) %></option>
                    <%
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="jumlahHari">Jumlah Hari Menginap:</label>
                <input type="number" id="jumlahHari" name="jumlahHari" placeholder="Masukkan jumlah hari" readonly>
            </div>
            <div class="form-group">
                <label for="totalHarga">Total Harga:</label>
                <input type="text" id="totalHarga" name="totalHarga" placeholder="Total harga" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                    <select id="email" name="email">
                        <%
                            try {
                                String sql = "SELECT DISTINCT email FROM `check-in`";
                                rs = stmt.executeQuery(sql);

                                while (rs.next()) {
                                    String email = rs.getString("email");
                        %>
                        <option value="<%= email %>"><%= email %></option>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </select>
            </div>
            <div class="button-group">
                <button type="submit" class="btn-confirm">Konfirmasi</button>
                <button type="reset" class="btn-reset">Bersihkan</button>
                <button type="button" class="btn-back" onclick="window.history.back();">Kembali</button>
            </div>
        </form>
    </div>

                    
        <script>
            function calculateDays() {
                const checkIN_Value = document.getElementById("checkIN_Date").value;
                const checkOUT_Value = document.getElementById("checkOUT_Date").value;

                if (checkIN_Value && checkOUT_Value) {
                    const checkIN_Date = new Date(checkIN_Value); // Tanggal Check-IN
                    const checkOUT_Date = new Date(checkOUT_Value); // Tanggal Check-OUT

                    if (checkOUT_Date >= checkIN_Date) {
                        const timeDiff = Math.abs(checkOUT_Date - checkIN_Date);
                        const daysDiff = Math.ceil(timeDiff / (1000 * 60 * 60 * 24)); // Konversi ke hari
                        document.getElementById("jumlahHari").value = daysDiff;

                        // Ambil harga per hari
                        const harga = parseInt(document.getElementById("harga").value) || 0;
                        const totalHarga = daysDiff * harga;
                        document.getElementById("totalHarga").value = `Rp. ${totalHarga.toLocaleString()}`;
                    } else {
                        alert("Tanggal Check-OUT tidak boleh lebih awal dari tanggal Check-IN.");
                        document.getElementById("jumlahHari").value = 0;
                        document.getElementById("totalHarga").value = "Rp. 0";
                    }
                }
            }

            // Event listener untuk otomatis menghitung saat tanggal berubah
            document.getElementById("checkOUT_Date").addEventListener("change", calculateDays);
        </script>


</body>
</html>
