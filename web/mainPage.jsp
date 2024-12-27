<%-- 
    Document   : mainPage
    Created on : Dec 25, 2024, 7:27:22 PM
    Author     : ASUS
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
                color: #333;
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
                background-color: #333;
                color: #fff;
                padding: 15px 0;
                text-align: center;
                font-size: 24px;
                z-index: 1000;
            }

            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                left: -250px; /* Hidden by default */
                width: 250px;
                height: 100%;
                background-color: #222;
                color: #fff;
                overflow-y: auto;
                transition: left 0.3s ease;
                z-index: 999;
            }

            .sidebar a {
                display: block;
                color: #ddd;
                padding: 15px 20px;
                text-decoration: none;
                border-bottom: 1px solid #444;
            }

            .sidebar a:hover {
                background-color: #444;
                color: #fff;
            }

            .sidebar .close-btn {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 20px;
                cursor: pointer;
                color: #fff;
            }

            /* Open Sidebar Button */
            .open-sidebar-btn {
                position: fixed;
                top: 10px;
                left: 10px;
                background-color: #333;
                color: #fff;
                padding: 10px 15px;
                border: none;
                cursor: pointer;
                z-index: 1001;
                border-radius: 5px;
                font-size: 16px;
            }

            .open-sidebar-btn:hover {
                background-color: #444;
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
                left: 0;
            }

        </style>
    </head>
    <body>
        <div class="header">Hotel Management System</div>
        
        <button class="open-sidebar-btn" onclick="toggleSidebar()">☰ Menu</button>
        
        <div class="sidebar" id="sidebar">
            <span class="close-btn" onclick="toggleSidebar()">×</span>
            <a href="#">Dashboard</a>

            <!-- Menu Dropdown untuk Reservations -->
            <a href="#" onclick="toggleDropdown()">Reservations ▾</a>
            <div id="reservation-menu" style="display: none; padding-left: 20px;">
                <a href="checkin.html">Check-In</a>
                <a href="checkOut.jsp">Check-Out</a>
            </div>

            <a href="#">Rooms</a>
            <a href="#">Customers</a>
            <a href="#">Reports</a>
            <a href="#">Settings</a>
        </div>

        
        <div class="content">
            <h1>Selamat Datang di Halaman Utama!</h1>
            <p>Login berhasil, Anda sekarang berada di halaman utama.</p>
        </div>
         
        <script>
            function toggleSidebar() {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('active');
            }

            function toggleDropdown() {
                const menu = document.getElementById('reservation-menu');
                if (menu.style.display === "none") {
                    menu.style.display = "block"; // Tampilkan submenu
                } else {
                    menu.style.display = "none";  // Sembunyikan submenu
                }
            }
        </script>

    </body>
</html>

