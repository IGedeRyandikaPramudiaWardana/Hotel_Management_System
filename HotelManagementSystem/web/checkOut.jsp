<%-- 
    Document   : checkInjsp
    Created on : Dec 27, 2024, 2:40:19 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Check Out</title>
        <link rel="stylesheet" type="text/css" href="style.css"> <!-- Masukkan file CSS ini -->
        
        <style>
            /* CSS Desain untuk Form Check-Out */
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #e0e0e0;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 80%;
                margin: 0 auto;
                padding: 20px;
                background: #f2f2f2;
                border-radius: 8px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            header {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
            }

            label {
                font-weight: bold;
                margin-bottom: 5px;
                display: block;
            }

            input[type="text"] {
                width: calc(25% - 20px);
                padding: 8px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            button {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }

            button.confirm {
                background-color: #4CAF50;
                color: white;
            }

            button.clear {
                background-color: #f44336;
                color: white;
            }

            button.back {
                background-color: #008CBA;
                color: white;
            }

            button:hover {
                opacity: 0.8;
            }

            .table-container {
                margin-top: 20px;
                overflow-x: auto;
            }

            .table-container table {
                width: 100%;
                border-collapse: collapse;
            }

            .table-container th, .table-container td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            .table-container th {
                background-color: #4CAF50;
                color: white;
            }

            .table-container tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .table-container tr:hover {
                background-color: #ddd;
            }
            </style>
    </head>
    <body>
    <header>Check-OUT</header>
    <div class="form-container">
        <div>
            <label for="nama">Nama Pelanggan</label>
            <input type="text" id="nama" placeholder="Masukkan Nama">
        </div>
        <div>
            <label for="checkin">Tanggal Check-IN</label>
            <input type="text" id="checkin" placeholder="yyyy-mm-dd">
        </div>
        <div>
            <label for="checkout">Tanggal Check-OUT</label>
            <input type="text" id="checkout" placeholder="yyyy-mm-dd">
        </div>
        <div>
            <label for="telepon">Nomor Telepon</label>
            <input type="text" id="telepon" placeholder="Nomor Telepon">
        </div>
        <div>
            <label for="harga">Harga Per-Hari</label>
            <input type="text" id="harga" placeholder="Rp">
        </div>
        <div>
            <label for="jumlah">Jumlah Hari Menginap</label>
            <input type="text" id="jumlah" placeholder="Hari">
        </div>
        <div>
            <label for="total">Total Harga</label>
            <input type="text" id="total" placeholder="Rp">
        </div>
        <div>
            <label for="email">Email</label>
            <input type="text" id="email" placeholder="Alamat Email">
        </div>
    </div>
    <button class="konfirmasi">Konfirmasi</button>
    <button class="clear">Clear</button>

    
</body>
</html>