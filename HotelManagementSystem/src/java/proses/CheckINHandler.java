/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Import Model dan DAO
import model.CheckIN;
import connection.CheckINCon;

@WebServlet("/CheckINHandler") // Mapping URL untuk servlet
public class CheckINHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Metode POST untuk menangani pengiriman data
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set response untuk UTF-8
        response.setContentType("text/html;charset=UTF-8");

        try {
            // Ambil data dari form HTML
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
            int harga = Integer.parseInt(request.getParameter("harga")); // Konversi harga ke integer

            // Validasi input
            if (nama == null || nama.isEmpty() || nomorTelepon == null || nomorTelepon.isEmpty()) {
                response.getWriter().println("<h1>Error: Nama dan Nomor Telepon wajib diisi.</h1>");
                return;
            }

            // Membuat objek model CheckIN
            CheckIN checkIN = new CheckIN(nama, nomorTelepon, kewarganegaraan, gender, email,
                    idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga);

            // Menggunakan DAO untuk menyimpan data
            CheckINCon dao = new CheckINCon();
            boolean isAdded = dao.addCheckIN(checkIN); // Simpan data ke database

            // Memberikan respon ke pengguna
            if (isAdded) {
                response.getWriter().println("<h1>Check-IN berhasil!</h1>");
                response.getWriter().println("<meta http-equiv='refresh' content='3;url=/HotelManagementSystem'>");
            } else {
                response.getWriter().println("<h1>Gagal menyimpan data Check-IN.</h1>");
            }

        } catch (NumberFormatException e) {
            response.getWriter().println("<h1>Error: Harga harus berupa angka.</h1>");
        /*} catch (SQLException e) {
            response.getWriter().println("<h1>Error pada database: " + e.getMessage() + "</h1>");*/
        } catch (Exception e) {
            response.getWriter().println("<h1>Error tidak terduga: " + e.getMessage() + "</h1>");
        }
    }
}
