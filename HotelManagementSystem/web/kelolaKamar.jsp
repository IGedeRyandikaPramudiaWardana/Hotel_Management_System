<%-- 
    Document   : kelolaKamar
    Created on : Dec 26, 2024, 10:56:34 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.List" %>
<%@page import="model.kamar" %>

<% 
    String akses = (String) session.getAttribute("akses");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Kelola Kamar</title>
         <style>
             .header {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                background-color: #3498db;
                color: #fff;
                padding: 20px 0;
                text-align: center;
                font-size: 24px;
                z-index: 1000;
                height: 70px; /* Sesuaikan tinggi header */
                box-sizing: border-box; /* Pastikan padding masuk dalam ukuran elemen */
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0; /* Posisi sidebar dimulai setelah header */
                left: -250px; /* Hidden by default */
                width: 250px;
                height: 100%; /* Sesuaikan tinggi sidebar agar menutupi sisa layar */
                background-color: #3498db;
                color: #fff;
                overflow-y: auto;
                transition: left 0.3s ease;
                z-index: 1001; /* Tetap di depan konten tetapi di bawah header */
                box-sizing: border-box; /* Pastikan padding masuk dalam ukuran elemen */
            }

            .sidebar a {
                display: block;
                padding: 10px 20px;
                color: #ddd;
                text-decoration: none;
                border-bottom: 1px solid #3498db;
                box-sizing: border-box; /* Pastikan padding tidak menyebabkan pergeseran */
            }

            .sidebar a:hover {
                background-color: #2c88c5;
                color: #fff;
            }

            .sidebar .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 50px;
                margin-right: 10px;
                cursor: pointer;
                color: #fff;
            }

            /* Open Sidebar Button */
            .open-sidebar-btn {
                position: fixed;
                top: 10px;
                left: 20px;
                background-color: #3498db;
                color: #fff;
                padding: 5px 10px;
                border: none;
                cursor: pointer;
                z-index: 1002; /* Tombol berada di depan elemen lain */
                border-radius: 5px;
                font-size: 20px;
            }

            .open-sidebar-btn:hover {
                background-color: #2c88c5;
            }

            .sidebar .pilihanMenu {
                margin-top: 55px;
            }

            /* Content Area */
            .content {
                margin: 100px 20px;
                padding: 20px;
                background-color: #fff;
                border-radius: 8px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            /* Sidebar Active State */
            .sidebar.active {
                left: 0; /* Sidebar muncul saat aktif */
            }

            /* Overlay */
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5); /* Transparan hitam */
                z-index: 1000;
                display: none; /* Sembunyikan overlay secara default */
            }

            .overlay.active {
                display: block; /* Tampilkan overlay saat aktif */
            }
            
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
                transition: transform 0.1s ease, background-color 0.1s ease; /* Animasi untuk perubahan */
            }

            .btn-edit {
                background-color: #2ecc71;
                color: white;
            }

            .btn-edit:hover{
                background-color: #17a351;
                color: white;
                transform: scale(1.1); /* Membuat tombol lebih besar */
            }

            .btn-delete {
                background-color: #e74c3c;
                color: white;
            }
            
            .btn-delete:hover{
                background-color: #c62513;
                color: white;
                transform: scale(1.1); /* Membuat tombol lebih besar */

            }
            
            .add-stock button {
                display: block;
                padding: 10px 20px;
                width: 165px;
                margin: 20px auto;
                background-color: #3498db;
                color: white;
                text-align: center;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                margin-top: 20px;
                transition: transform 0.1s ease, background-color 0.1s ease; /* Animasi untuk perubahan */
            }

            .add-stock button:hover{
                background-color: #08629e;
                transform: scale(1.1); /* Membuat tombol lebih besar */

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

            .modal {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                justify-content: center;
                align-items: center;
                z-index: 1000;
            }
            
            .modal.show {
                display: flex; /* Menampilkan modal */
            }
    
            .modal-content {
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                max-width: 500px;
                width: 100%;
                text-align: center;
            }
    
            .modal-content input {
                width: 90%;
                padding: 10px;
                margin: 10px 0;
                border-radius: 4px;
                border: 1px solid #ddd;
            }
    
            .modal-content button {
                margin-top: 10px;
                padding: 10px 20px;
                background-color: #4CAF50;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
    
            .modal-content button:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="header">Hotel Management System</div>

        <% if ("admin".equals(akses)) { %>
            <p>Anda login sebagai Admin. Anda memiliki akses penuh ke semua fitur.</p>
        <% } else { %>
            <p>Anda login sebagai User. Anda memiliki akses terbatas.</p>
        <% } %>
        <!-- Tombol Buka Sidebar -->
        <button class="open-sidebar-btn" onclick="toggleSidebar()">☰ Menu</button>
        
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="pilihanMenu">
                <!-- Menu Main Page -->
                <a onclick="location.href='mainPageServlet'">Main Page</a>
                <a onclick="location.href='proses/kelolaKamarServlet'">Kelola Kamar</a>
                <a href="#" onclick="loadContent('checkin.jsp')">Check-In</a>
                <a href="#" onclick="loadContent('checkOut.jsp')">Check-Out</a>
                <a href="#" onclick="loadContent('detailPembayaran.jsp')">Detail Pembayaran</a>
                <a href="#" onclick="loadContent('kelolaCheckIN.jsp')">Kelola Check-IN</a>
                <a href="login.jsp">Logout</a>
                <% if ("admin".equals(akses)) { %>
                    <!-- Menu khusus admin -->
                    <a href="#" onclick="loadContent('adminPage.jsp')">Admin</a>
                <% } %>
                
            </div>
        </div>
        
        <!-- Overlay -->
        <div class="overlay" id="overlay" onclick="toggleSidebar()"></div>



        
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
                                    <td>
                                        <form action="<%= request.getContextPath() %>/proses/kelolaKamarServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="edit">
                                            <input type="hidden" name="nomorKamar" value="<%= kamar.getNomorKamar() %>">
                                            <button type="submit" class="btn btn-edit">Edit</button>
                                        </form>
                                        <form action="<%= request.getContextPath() %>/proses/kelolaKamarServlet" method="post" style="display:inline;">
                                            <input type="hidden" name="action" value="delete">
                                            <input type="hidden" name="nomorKamar" value="<%= kamar.getNomorKamar() %>">
                                            <button type="submit" class="btn btn-delete" onclick="return confirm('Apakah Anda yakin ingin menghapus kamar ini?')">Delete</button>
                                        </form>
                                    </td>
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

        <div class="add-stock">
            <button onclick="showModal()">Tambah Kamar Baru</button>
            
        </div>
                
                
        <div id="inputModal" class="modal">
            <div class="modal-content">
                <h3>Tambah Kamar Baru</h3>
                <form action="kelolaKamarServlet" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="text" name="nomorKamar" placeholder="TomorKamar" required>
                    <input type="text" name="tipeKamar" placeholder="TipeKamar" required>
                    <input type="text" name="tipeBed" placeholder="TipeBed" required>
                    <input type="text" name="harga" placeholder="Harga" required>
                    <input type="text" name="status" placeholder="Status" value="Avaible" hidden>
                    <button type="submit">Tambah</button>
                </form>
            </div>
        </div>
                
                
                
    <script>
        function showModal() {
            const modal = document.getElementById('inputModal');
            modal.classList.add('show');
            console.log("Modal ditampilkan");
        }

        // Menutup modal saat klik di luar modal
        window.onclick = function(event) {
            const modal = document.getElementById('inputModal');
            if (event.target == modal) {
                modal.classList.remove('show');
                console.log("Modal ditutup");
            }
        };
    </script> 
        <!-- Tambah Kamar Baru -->
<!--        <a href="tambahKamar.jsp" class="btn-add">Tambah Kamar Baru</a>-->
    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const overlay = document.getElementById('overlay');
            sidebar.classList.toggle('active');
            overlay.classList.toggle('active');
        }

        // Fungsi untuk memuat halaman JSP secara dinamis
        function loadContent(page) {
            const xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("content-area").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", page, true);
            xhttp.send();
        }

        // Fungsi untuk menampilkan kembali halaman utama
        function loadMainPage() {
            document.getElementById("content-area").innerHTML = `
                <h1>Selamat Datang di Hotel Management System</h1>
                <p>Konten halaman utama akan ditampilkan di sini.</p>
            `;
        }
    </script>

    </body>
</html>