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
        <form id="peminjamanForm" action="CheckINHandler" method="post" onsubmit="submitForm(event)">
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


            <div class="button-group">
                <button type="submit" class="btn-confirm" value="CheckINHandler" href="kelolaCheckIN.jsp">Konfirmasi</button>
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

</body>
</html>

