<%-- 
    Document   : checkin
    Created on : Dec 27, 2024, 4:14:51?PM
    Author     : anggafrydayana
--%>

<!DOCTYPE html>
<html>
<head>
    <title>Customer Check-IN</title>
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
        <div class="banner">
            <h1>Manajemen Reservasi Hotel</h1>
        </div>
        <h1>Customer Check-IN</h1>
        <form action="CheckINHandler.jsp" method="post">
            <div class="form-group">
                <label for="name">Nama:</label>
                <input type="text" id="name" name="name" placeholder="Masukkan nama lengkap" required>
            </div>
            <div class="form-group">
                <label for="phone">Nomor Telepon:</label>
                <input type="text" id="phone" name="phone" placeholder="Masukkan nomor telepon" required>
            </div>
            <div class="form-group">
                <label for="nationality">Kewarganegaraan:</label>
                <input type="text" id="nationality" name="nationality" placeholder="Masukkan kewarganegaraan" required>
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
                <label for="id">ID/KTP:</label>
                <input type="text" id="id" name="id" placeholder="Masukkan nomor ID/KTP" required>
            </div>
            <div class="form-group">
                <label for="address">Alamat:</label>
                <input type="text" id="address" name="address" placeholder="Masukkan alamat lengkap" required>
            </div>
            <div class="form-group">
                <label for="checkinDate">Tanggal Check-IN (Hari ini):</label>
                <input type="date" id="checkinDate" name="checkinDate" 
                       value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>
            </div>
            <div class="form-group">
                <label for="bed">Bed:</label>
                <select id="bed" name="bed">
                    <option value="Single">Single</option>
                    <option value="Double">Double</option>
                    <option value="Queen Size">Queen Size</option>
                    <option value="King Size">King Size</option>
                </select>
            </div>
            <div class="form-group">
                <label for="roomType">Tipe Kamar:</label>
                <select id="roomType" name="roomType">
                    <option value="Non-AC">Non-AC</option>
                    <option value="AC">AC</option>
                </select>
            </div>
            <div class="form-group">
                <label for="roomNumber">Nomor Kamar:</label>
                <select id="roomNumber" name="roomNumber">
                    <option value="001">001</option>
                    <option value="002">002</option>
                    <option value="003">003</option>
                    <option value="004">004</option>
                </select>
            </div>
            <div class="form-group">
                <label for="price">Harga:</label>
                <input type="text" id="price" name="price" placeholder="Masukkan harga kamar" required>
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

