<%-- 
    Document   : CheckINHandler
    Created on : Dec 27, 2024, 6:05:39 PM
    Author     : ASUS
--%>

<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>


<%
    String nama = request.getParameter("nama");
    String nomorTelepon = request.getParameter("nomorTelepon");
    String kewarganegaraan = request.getParameter("kewarganegaraan");
    String gender = request.getParameter("gender");
    String email = request.getParameter("email");
    String idKtp = request.getParameter("id/Ktp");
    String alamat = request.getParameter("alamat");
    String checkIN_Date = request.getParameter("check-in_Date");
    String bed = request.getParameter("bed");
    String tipeKamar = request.getParameter("tipeKamar");
    String nomorKamar = request.getParameter("nomorKamar");
    int harga = Integer.parseInt(request.getParameter("harga"));

    // Hitung jumlah malam
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date checkin = null;
    try {
        checkin = sdf.parse(checkIN_Date);
    } catch (ParseException e) {
        e.printStackTrace();
        out.println("<h1>Format tanggal tidak valid!</h1>");
        return; // Hentikan eksekusi jika terjadi kesalahan
    }
    
    /*
    long diffInMillies = Math.abs(checkout.getTime() - checkin.getTime());
    long diffDays = diffInMillies / (1000 * 60 * 60 * 24);
    */
    
    // Total harga
    //float totalPrice = (float) (diffDays * price);

    Connection conn = null;
    PreparedStatement ps = null;
    java.sql.Date sqlCheckIN_Date = new java.sql.Date(checkin.getTime());

    try {
        // Koneksi ke database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test");

        // Simpan data check-in
        String insertSql = "INSERT INTO `check-in` (`nama`, `nomorTelepon`, `kewarganegaraan`, `gender`, `email`, `id/Ktp`, `alamat`, `check-in_Date`, `bed`, `tipeKamar`, `nomorKamar`, `harga`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        System.out.println("Query: " + insertSql); // Cek query
        
        ps = conn.prepareStatement(insertSql);
        ps.setString(1, nama);
        ps.setString(2, nomorTelepon);
        ps.setString(3, kewarganegaraan);
        ps.setString(4, gender);
        ps.setString(5, email);
        ps.setString(6, idKtp);
        ps.setString(7, alamat);
        ps.setDate(8, sqlCheckIN_Date);
        ps.setString(9, bed);
        ps.setString(10, tipeKamar);
        ps.setString(11, nomorKamar);
        ps.setInt(12, harga);
        ps.executeUpdate();

        // Ubah status kamar menjadi "Check-in"
        String updateStatusSql = "UPDATE status SET status = 'check-in' WHERE nomorKamar = ?";
        ps = conn.prepareStatement(updateStatusSql);
        ps.setString(1, nomorKamar);
        ps.executeUpdate();

        // Tampilkan konfirmasi ke halaman
        out.println("<h1>Check-in Berhasil!</h1>");
        out.println("<p>Nama: " + nama + "</p>");
        out.println("<p>Nomor Telepon: " + nomorTelepon + "</p>");
        out.println("<p>Kewarganegaraan: " + kewarganegaraan + "</p>");
        out.println("<p>Gender: " + gender + "</p>");
        out.println("<p>E-mail: " + email + "</p>");
        out.println("<p>ID/KTP: " + idKtp + "</p>");
        out.println("<p>Alamat: " + alamat + "</p>");
        out.println("<p>Tanggal Check-in: " + checkIN_Date + "</p>");
        out.println("<p>Bed: " + bed + "</p>");
        out.println("<p>Tipe Kamar: " + tipeKamar + "</p>");
        out.println("<p>Nomor Kamar: " + nomorKamar + "</p>");
        out.println("<p>Total Harga: Rp. " + harga + "</p>");
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h1>Terjadi kesalahan!</h1>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>