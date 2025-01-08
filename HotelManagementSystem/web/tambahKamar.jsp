<%-- 
    Document   : tambahKamar.jsp
    Created on : Jan 7, 2025, 10:34:47 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tambah Kamar Baru</title>
        <style>
            body { font-family: 'Roboto', sans-serif; background-color: #f4f4f4; color: #2c3e50; padding: 20px; }
            .container { background: white; padding: 20px; border-radius: 5px; box-shadow: 0 2px 5px rgba(0,0,0,0.2); max-width: 600px; margin: 0 auto; }
            h2 { text-align: center; color: #3498db; }
            .form-group { margin-bottom: 15px; }
            label { display: block; margin-bottom: 5px; }
            input, select { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
            button { background-color: #3498db; color: white; border: none; padding: 10px 15px; border-radius: 5px; cursor: pointer; }
            button:hover { background-color: #2980b9; }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Tambah Kamar Baru</h2>
            <form action="<%= request.getContextPath() %>/proses/kelolaKamarServlet" method="post">
                <input type="hidden" name="action" value="add">
                <div class="form-group">
                    <label>Nomor Kamar:</label>
                    <input type="text" name="nomorKamar" required>
                </div>
                <div class="form-group">
                    <label>Tipe Kamar:</label>
                    <input type="text" name="tipeKamar" required>
                </div>
                <div class="form-group">
                    <label>Tipe Bed:</label>
                    <input type="text" name="tipeBed" required>
                </div>
                <div class="form-group">
                    <label>Harga:</label>
                    <input type="number" name="harga" step="0.01" required>
                </div>
                <div class="form-group">
                    <label>Status:</label>
                    <select name="status" required>
                        <option value="Available">Available</option>
                        <option value="Occupied">Occupied</option>
                    </select>
                </div>
                <button type="submit">Simpan</button>
            </form>
        </div>
    </body>
</html>


