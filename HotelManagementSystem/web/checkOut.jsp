<%-- 
    Document   : checkInjsp
    Created on : Dec 27, 2024, 2:40:19 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Check-OUT</title>
    <style>
        body {
            font-family: "Arial", sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
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
                <label for="nama">Nama Pelanggan:</label>
                <input type="text" id="nama" name="nama" placeholder="Masukkan nama pelanggan" required>
            </div>
            <div class="form-group">
                <label for="checkinDate">Tanggal Check-IN:</label>
                <input type="date" id="checkinDate" name="checkinDate" required>
            </div>
            <div class="form-group">
                <label for="checkoutDate">Tanggal Check-OUT:</label>
                <input type="date" id="checkoutDate" name="checkoutDate" required>
            </div>
            <div class="form-group">
                <label for="telepon">Nomor Telepon:</label>
                <input type="text" id="telepon" name="telepon" placeholder="Masukkan nomor telepon" required>
            </div>
            <div class="form-group">
                <label for="harga">Harga Per-Hari:</label>
                <input type="text" id="harga" name="harga" placeholder="Masukkan harga per hari" required>
            </div>
            <div class="form-group">
                <label for="jumlahHari">Jumlah Hari Menginap:</label>
                <input type="number" id="jumlahHari" name="jumlahHari" placeholder="Masukkan jumlah hari" required>
            </div>
            <div class="form-group">
                <label for="totalHarga">Total Harga:</label>
                <input type="text" id="totalHarga" name="totalHarga" placeholder="Total harga" readonly>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Masukkan alamat email" required>
            </div>
            <div class="button-group">
                <button type="submit" class="btn-confirm">Konfirmasi</button>
                <button type="reset" class="btn-reset">Bersihkan</button>
                <button type="button" class="btn-back" onclick="window.history.back();">Kembali</button>
            </div>
        </form>
    </div>
</body>
</html>
