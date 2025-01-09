package proses;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import connection.checkINCon;  // Pastikan untuk mengimpor class koneksi yang benar

@WebServlet("/CheckINHandler2") // Mapping URL untuk servlet
public class CheckINHandler2 extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Ambil data dari form
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
            String nomorKamar = request.getParameter("nomorKamar");
            double harga = Double.parseDouble(request.getParameter("harga"));

            // Validasi input
            if (nama == null || nama.isEmpty() || nomorTelepon == null || nomorTelepon.isEmpty()) {
                out.println("<h1>Error: Nama dan nomor telepon wajib diisi.</h1>");
                return;
            }

            // Koneksi ke database menggunakan checkINCon
            Connection conn = checkINCon.getConnection();  // Pastikan method getConnection() ada di class checkINCon

            // Query SQL untuk menyimpan data
            String sql = "INSERT INTO `checkin` (nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set parameter query
            ps.setString(1, nama);
            ps.setString(2, nomorTelepon);
            ps.setString(3, kewarganegaraan);
            ps.setString(4, gender);
            ps.setString(5, email);
            ps.setString(6, idKtp);
            ps.setString(7, alamat);
            ps.setString(8, checkIN_Date);
            ps.setString(9, bed);
            ps.setString(10, tipeKamar);
            ps.setString(11, nomorKamar);
            ps.setDouble(12, harga);

            // Eksekusi query
            int result = ps.executeUpdate();

            // Respon ke pengguna
            if (result > 0) {
                out.println("<h1>Check-in berhasil!</h1>");
                out.println("<meta http-equiv='refresh' content='3;url=/HotelManagementSystem'>");
            } else {
                out.println("<h1>Gagal menyimpan data.</h1>");
            }

            // Tutup koneksi
            ps.close();
            conn.close();
        } catch (NumberFormatException e) {
            out.println("<h1>Error: Harga harus berupa angka.</h1>");
        } catch (SQLException e) {
            out.println("<h1>Error pada database: " + e.getMessage() + "</h1>");
        } catch (Exception e) {
            out.println("<h1>Error tidak terduga: " + e.getMessage() + "</h1>");
        }
    }
}
