<%-- 
    Document   : checkin
    Created on : Dec 27, 2024, 4:14:51?PM
    Author     : Krisna Anggaradana
--%>


<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Check-IN</title>
    <style>
        h1 {
            text-align: center;
            margin-top: 50px;
            color: #444;
        }

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
        <div class="header">Hotel Management System</div>
            <% if ("admin".equals(akses)) { %>
                <p></p>
            <% } else { %>
                <p></p>
            <% } %>
            <!-- Tombol Buka Sidebar -->
            <button class="open-sidebar-btn" onclick="toggleSidebar()">? Menu</button>

            <!-- Sidebar -->
            <div class="sidebar" id="sidebar">
                <div class="pilihanMenu">
                    <!-- Menu Main Page -->
                    <a onclick="location.href='mainPageServlet'">Main Page</a>
                    <a onclick="location.href='kelolaKamarServlet'">Kelola Kamar</a>
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

    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test3"); // ganti dengan database yang digunakan
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>

    <div class="form-container">
        <div class="banner">
            <h1>Manajemen Reservasi Hotel</h1>
        </div>
        <h1>Customer Check-IN</h1>
        <form action="CheckINHandler2" method="get">
            <div class="form-group">
                <label for="nama">Nama:</label>
                <input type="text" id="nama" name="nama" placeholder="Masukkan nama lengkap" required>
            </div>

            <div class="form-group">
                <label for="nomorTelepon">Nomor Telepon:</label>
                <input type="text" id="nomorTelepon" name="nomorTelepon" placeholder="Masukkan nomor telepon" required>
            </div>
            
            <div class="form-group">
                <label for="kewarganegaraan">Kewarganegaraan:</label>
                <input type="text" id="kewarganegaraan" name="kewarganegaraan" placeholder="Masukkan kewarganegaraan" required>
            </div>
            
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender">
                    <option value="Laki-Laki">Laki-Laki</option>
                    <option value="Perempuan">Perempuan</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Masukkan email" required>
            </div>
            
            <div class="form-group">
                <label for="idKtp">ID/KTP:</label>
                <input type="text" id="idKtp" name="idKtp" placeholder="Masukkan nomor ID/KTP" required>
            </div>
            
            <div class="form-group">
                <label for="alamat">Alamat:</label>
                <input type="text" id="alamat" name="alamat" placeholder="Masukkan alamat lengkap" required>
            </div>
            
            <div class="form-group">
                <label for="checkIN_Date">Tanggal Check-IN (Hari ini):</label>
                <input type="date" id="checkIN_Date" name="checkIN_Date" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" required>
            </div>

            <div class="form-group">
                <label for="bed">Bed:</label>
                    <select id="bed" name="bed">
                        <%
                            try {
                                stmt = conn.createStatement();
                                String sql = "SELECT DISTINCT tipeBed FROM avaibility";
                                rs = stmt.executeQuery(sql);

                                while (rs.next()) {
                                    String tipeBed = rs.getString("tipeBed");
                        %>
                        <option value="<%= tipeBed %>"><%= tipeBed %></option>
                        <%
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                </select>
            </div>

            <div class="form-group">
            <label for="tipeKamar">Tipe Kamar:</label>
            <select id="tipeKamar" name="tipeKamar">
                <%
                    try {
                        String sql = "SELECT DISTINCT tipeKamar FROM avaibility";
                        rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            String tipeKamar = rs.getString("tipeKamar");
                %>
                <option value="<%= tipeKamar %>"><%= tipeKamar %></option>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
        </div>

        <div class="form-group">
        <label for="nomorKamar">Nomor Kamar:</label>
        <select id="nomorKamar" name="nomorKamar">
            <%
                try {
                    String sql = "SELECT nomorKamar FROM avaibility";  // Hanya kamar yang tersedia
                    rs = stmt.executeQuery(sql);

                    while (rs.next()) {
                        int nomorKamar = rs.getInt("nomorKamar");
            %>
            <option value="<%= nomorKamar %>"><%= nomorKamar %></option>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select>
    </div>

            
            <div class="form-group">
                <label for="harga">Harga:</label>
                <select id="harga" name="harga">
                    <%
                        try {
                            String sql = "SELECT harga FROM avaibility";
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
                
                <%
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                %>


            <div class="button-group">
                <button type="submit" class="btn-confirm" value="CheckINHandler2" href="kelolaCheckIN.jsp">Konfirmasi</button>
                <button type="reset" class="btn-reset" onclick="window.history.clear()">Bersihkan</button>
                <button type="button" class="btn-back" onclick="window.history.back();">Kembali</button>
            </div>
        </form>  
    </div>

        <script type="text/javascript">
            $(document).ready(function() {
                $('#tipeKamar').change(function() {
                    var tipeKamar = $(this).val(); // Ambil nilai tipe kamar yang dipilih
                    if (tipeKamar != '') {
                        $.ajax({
                            url: 'RoomDetailsServlet', // Mengarahkan ke servlet
                            type: 'post',
                            data: { tipeKamar: tipeKamar },
                            success: function(response) {
                                var roomDetails = JSON.parse(response);
                                // Mengisi dropdown bed
                                $('#bed').html(roomDetails.bedOptions);
                                // Mengisi dropdown nomor kamar
                                $('#nomorKamar').html(roomDetails.roomOptions);
                                // Menampilkan harga
                                $('#harga').html(roomDetails.priceOptions);
                            }
                        });
                    }
                });
            });
        </script>
        
        
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

