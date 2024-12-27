<%-- 
    Document   : kelolaKamar
    Created on : Dec 26, 2024, 10:56:34 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kelola Kamar</title>
    <style>
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
        }

        .btn-edit, .btn-save {
            background-color: #2ecc71;
            color: white;
        }

        .btn-delete {
            background-color: #e74c3c;
            color: white;
        }

        .btn-add {
            display: block;
            width: 150px;
            margin: 20px auto;
            background-color: #3498db;
            color: white;
            text-align: center;
            padding: 10px;
            border-radius: 5px;
            text-decoration: none;
        }

        .editable {
            background-color: #f0f0f0;
            border: 1px solid #ddd;
            padding: 5px;
            cursor: text;
        }
    </style>
</head>
<body>
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
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    // Koneksi ke database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
                    stmt = conn.createStatement();
                    String sql = "SELECT * FROM status";
                    rs = stmt.executeQuery(sql);

                    // Tampilkan data kamar
                    while (rs.next()) {
                        int nomorKamar = rs.getInt("nomorKamar");
                        String tipeKamar = rs.getString("tipeKamar");
                        String tipeBed = rs.getString("tipeBed");
                        int harga = rs.getInt("harga");
                        String status = rs.getString("status");
            %>
            <tr id="row-<%= nomorKamar %>">
                <td><%= nomorKamar %></td>
                <td id="tipeKamar-<%= nomorKamar %>"><%= tipeKamar %></td>
                <td id="tipeBed-<%= nomorKamar %>"><%= tipeBed %></td>
                <td id="harga-<%= nomorKamar %>">Rp. <%= String.format("%,d", harga) %></td>
                <td id="status-<%= nomorKamar %>"><%= status %></td>
                <td>
                    <button class="btn btn-edit" onclick="enableEdit(<%= nomorKamar %>)">Edit</button>
                    <button class="btn btn-save" onclick="saveData(<%= nomorKamar %>)" style="display:none;">Simpan</button>
                    <button class="btn btn-delete" onclick="deleteKamar(<%= nomorKamar %>)">Delete</button>
                </td>
            </tr>
            <%
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>
        </tbody>
    </table>

    <a href="tambahKamar.jsp" class="btn-add">Tambah Kamar Baru</a>

    <script>
        // Mengubah kolom menjadi editable
        function enableEdit(nomorKamar) {
            document.getElementById("tipeKamar-" + nomorKamar).setAttribute("contenteditable", "true");
            document.getElementById("tipeBed-" + nomorKamar).setAttribute("contenteditable", "true");
            document.getElementById("harga-" + nomorKamar).setAttribute("contenteditable", "true");
            document.getElementById("status-" + nomorKamar).setAttribute("contenteditable", "true");

            // Ganti tombol Edit menjadi Simpan
            document.querySelector(`#row-${nomorKamar} .btn-edit`).style.display = "none";
            document.querySelector(`#row-${nomorKamar} .btn-save`).style.display = "inline-block";
        }

        // Menyimpan data ke database
        function saveData(nomorKamar) {
            var tipeKamar = document.getElementById("tipeKamar-" + nomorKamar).innerText;
            var tipeBed = document.getElementById("tipeBed-" + nomorKamar).innerText;
            var harga = document.getElementById("harga-" + nomorKamar).innerText.replace('Rp. ', '').replace(/,/g, '');
            var status = document.getElementById("status-" + nomorKamar).innerText;

            // Mengirimkan data menggunakan AJAX ke server
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "", true);
            xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            xhr.send("action=update&nomorKamar=" + nomorKamar + "&tipeKamar=" + encodeURIComponent(tipeKamar) +
                     "&tipeBed=" + encodeURIComponent(tipeBed) + "&harga=" + encodeURIComponent(harga) +
                     "&status=" + encodeURIComponent(status));

            xhr.onload = function() {
                if (xhr.status === 200) {
                    alert("Data berhasil diperbarui!");

                    // Kembalikan tampilan ke non-edit mode
                    document.getElementById("tipeKamar-" + nomorKamar).removeAttribute("contenteditable");
                    document.getElementById("tipeBed-" + nomorKamar).removeAttribute("contenteditable");
                    document.getElementById("harga-" + nomorKamar).removeAttribute("contenteditable");
                    document.getElementById("status-" + nomorKamar).removeAttribute("contenteditable");

                    // Kembalikan tombol Simpan menjadi Edit
                    document.querySelector(`#row-${nomorKamar} .btn-save`).style.display = "none";
                    document.querySelector(`#row-${nomorKamar} .btn-edit`).style.display = "inline-block";
                } else {
                    alert("Terjadi kesalahan saat memperbarui data.");
                }
            };
        }

        // Menghapus kamar
        function deleteKamar(nomorKamar) {
            if (confirm("Apakah Anda yakin ingin menghapus kamar ini?")) {
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "", true);
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                xhr.send("action=delete&nomorKamar=" + nomorKamar);

                xhr.onload = function() {
                    if (xhr.status === 200) {
                        alert("Kamar berhasil dihapus!");
                        location.reload();
                    } else {
                        alert("Terjadi kesalahan saat menghapus kamar.");
                    }
                };
            }
        }
    </script>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String action = request.getParameter("action");
            int nomorKamar = Integer.parseInt(request.getParameter("nomorKamar"));

            if ("update".equals(action)) {
                String tipeKamar = request.getParameter("tipeKamar");
                String tipeBed = request.getParameter("tipeBed");
                int harga = Integer.parseInt(request.getParameter("harga"));
                String status = request.getParameter("status");

                try {
                    // Update data kamar di database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
                    stmt = conn.createStatement();
                    String updateSql = "UPDATE status SET tipeKamar=?, tipeBed=?, harga=?, status=? WHERE nomorKamar=?";
                    PreparedStatement pstmt = conn.prepareStatement(updateSql);
                    pstmt.setString(1, tipeKamar);
                    pstmt.setString(2, tipeBed);
                    pstmt.setInt(3, harga);
                    pstmt.setString(4, status);
                    pstmt.setInt(5, nomorKamar);
                    pstmt.executeUpdate();

                    out.print("Data berhasil diperbarui!");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else if ("delete".equals(action)) {
                try {
                    // Hapus kamar dari database
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test");
                    stmt = conn.createStatement();
                    String deleteSql = "DELETE FROM status WHERE nomorKamar=?";
                    PreparedStatement pstmt = conn.prepareStatement(deleteSql);
                    pstmt.setInt(1, nomorKamar);
                    pstmt.executeUpdate();

                    out.print("Kamar berhasil dihapus!");
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    %>
</body>
</html>
