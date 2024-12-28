<%-- 
    Document   : CheckINHandler
    Created on : Dec 27, 2024, 6:05:39 PM
    Author     : ASUS
--%>

<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    String nama = request.getParameter("nama");
    String nomorTelepon = request.getParameter("nomorTelepon");
    String kewarganegaraan = request.getParameter("kewarganegaraan");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String idKtp = request.getParameter("idKtp");
    String alamat = request.getParameter("alamat");
    String checkIN_Date = request.getParameter("checkIN_Date");
    String bed = request.getParameter("bed");
    String tipeKamar = request.getParameter("tipeKamar");
    int nomorKamar = Integer.parseInt(request.getParameter("nomorKamar"));
    float harga = Float.parseFloat(request.getParameter("harga"));

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        // Koneksi ke database 'check'
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/check");

        // Simpan data check-in
        String insertSql = "INSERT INTO checkin (nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        ps = conn.prepareStatement(insertSql);
        ps.setString(1, nama);
        ps.setString(2, nomorTelepon);
        ps.setString(3, kewarganegaraan);
        ps.setString(4, gender);
        ps.setString(5, email);
        ps.setString(6, idKtp);
        ps.setString(7, alamat);
        ps.setDate(8, java.sql.Date.valueOf(checkIN_Date));
        ps.setString(9, bed);
        ps.setString(10, tipeKamar);
        ps.setInt(11, nomorKamar);
        ps.setFloat(12, harga);
        ps.executeUpdate();

        // Ubah status kamar menjadi "check-in" di database 'test'
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "password");
        String updateStatusSql = "UPDATE status SET status = 'check-in' WHERE nomorKamar = ?";
        ps = conn.prepareStatement(updateStatusSql);
        ps.setInt(1, nomorKamar);
        ps.executeUpdate();

        // Tampilkan konfirmasi
        out.println("<h1>Check-in Berhasil!</h1>");
        out.println("<p>Nama: " + nama + "</p>");
        out.println("<p>Nomor Telepon: " + nomorTelepon + "</p>");
        out.println("<p>Kewarganegaraan: " + kewarganegaraan + "</p>");
        out.println("<p>Gender: " + gender + "</p>");
       
        out.println("<p>Email: " + email + "</p>");
        out.println("<p>ID/KTP: " + idKtp + "</p>");
        out.println("<p>Alamat: " + alamat + "</p>");
        out.println("<p>Tanggal Check-IN: " + checkIN_Date + "</p>");
        out.println("<p>Bed: " + bed + "</p>");
        out.println("<p>Tipe Kamar: " + tipeKamar + "</p>");
        out.println("<p>Nomor Kamar: " + nomorKamar + "</p>");
        out.println("<p>Harga: Rp. " + String.format("%,.2f", harga) + "</p>");
        //out.println("<a href='checkin.jsp'>Kembali ke Form Check-IN</a>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Terjadi Kesalahan!</h1>");
        out.println("<p>" + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
