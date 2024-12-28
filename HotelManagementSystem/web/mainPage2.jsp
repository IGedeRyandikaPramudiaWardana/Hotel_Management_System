<%-- 
    Document   : mainPage
    Created on : Dec 25, 2024, 7:27:22 PM
    Author     : Ryandika
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Halaman Utama</title>
        <link rel="stylesheet" type="text/css" href="style.css"> <!-- Masukkan file CSS ini -->
        
        <style>
            /* General Styles */
            body {
                font-family: 'Roboto', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
                color: #3498db;
            }

            h1 {
                text-align: center;
                margin-top: 50px;
                color: #444;
            }

            /* Header */
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
        </style>
    </head>
    <body>
        <!-- Header -->
        <div class="header">Hotel Management System</div>
        
        <!-- Tombol Buka Sidebar -->
        <button class="open-sidebar-btn" onclick="toggleSidebar()">☰ Menu</button>
        
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="pilihanMenu">
                <!-- Menu Main Page -->
                <a href="#" onclick="loadMainPage()">Main Page</a>
                <a href="#" onclick="loadContent('kelolaKamar2.jsp')">Kelola Kamar</a>
                <a href="#" onclick="loadContent('checkin.jsp')">Check-In</a>
                <a href="#" onclick="loadContent('checkOut.jsp')">Check-Out</a>
                <a href="#">Detail Pembayaran</a>
                <a href="login.jsp">Logout</a>
                
            </div>
        </div>
        
        <!-- Overlay -->
        <div class="overlay" id="overlay" onclick="toggleSidebar()"></div>
        
        <!-- Area Konten -->
        <div class="content" id="content-area">
            <h1>Selamat Datang di Hotel Management System</h1>
            <p>Konten halaman utama akan ditampilkan di sini.</p>
        </div>

        <!-- Script untuk toggle Sidebar -->
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
