<%-- 
    Document   : editKamar
    Created on : Jan 7, 2025, 10:14:38 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Kamar</title>
</head>
<body>
    <h1>Edit Kamar</h1>
    <form action="/proses/kelolaKamarServlet" method="post">
    <div>
        <label for="nomorKamar">Nomor Kamar:</label>
        <input type="text" id="nomorKamar" name="nomorKamar" required>
    </div>
    <div>
        <label for="tipeKamar">Tipe Kamar:</label>
        <select id="tipeKamar" name="tipeKamar" required>
            <option value="">Pilih Tipe</option>
            <option value="Standard">Standard</option>
            <option value="Deluxe">Deluxe</option>
        </select>
    </div>
    <div>
        <label for="tipeBed">Tipe Bed:</label>
        <select id="tipeBed" name="tipeBed" required>
            <option value="">Pilih Bed</option>
            <option value="Single">Single</option>
            <option value="Double">Double</option>
        </select>
    </div>
    <div>
        <label for="harga">Harga:</label>
        <input type="text" id="harga" name="harga" required>
    </div>
    <div>
        <label for="status">Status:</label>
        <select id="status" name="status" required>
            <option value="">Pilih Status</option>
            <option value="Available">Available</option>
            <option value="Occupied">Occupied</option>
        </select>
    </div>
    <button type="submit">Submit</button>
</form>

</body>
</html>

