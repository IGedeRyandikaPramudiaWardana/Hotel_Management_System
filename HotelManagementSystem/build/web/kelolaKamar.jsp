<%-- 
    Document   : kelolaKamar
    Created on : Dec 26, 2024, 10:56:34 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.List" %>
<%@page import="model.kamar" %>
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
                    <th>Aksi</th>
                </tr>
            </thead>
            <tbody>
                    <%
                        List<kamar> kamarList = (List<kamar>) request.getAttribute("kamarList");
                        if (kamarList != null && !kamarList.isEmpty()) {
                            for (kamar kamar : kamarList) {
                    %>
                                <tr onclick="selectKamar('<%= kamar.getNomorKamar() %>', '<%= kamar.getTipeKamar() %>', '<%= kamar.getTipeBed() %>', '<%= kamar.getHarga() %>')">
                                    <td><%= kamar.getNomorKamar() %></td>
                                    <td><%= kamar.getTipeKamar() %></td>
                                    <td><%= kamar.getTipeBed() %></td>
                                    <td>Rp <%= String.format("%,.2f", kamar.getHarga()) %></td>
                                    <td><%= kamar.getStatus() %></td>
                                </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="6">Tidak ada data kamar.</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            
        </table>

        <!-- Tambah Kamar Baru -->
        <a href="tambahKamar.jsp" class="btn-add">Tambah Kamar Baru</a>

    </body>
</html>