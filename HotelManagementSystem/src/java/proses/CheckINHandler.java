/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import connection.checkINCon;
import model.checkIN;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.logging.Logger;
import model.kamar;

@WebServlet("/CheckINHandler")
public class CheckINHandler extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(CheckINHandler.class.getName());
    private checkINCon ckin = new checkINCon();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doGet called");

        // Ambil data kendaraan dari database
        List<kamar> kamarList = ckin.getAvailableKamar();
        request.setAttribute("kamarList", kamarList);

        // Teruskan ke halaman JSP
        request.getRequestDispatcher("checkin.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doPost called");
        

        // Ambil data dari form
        String nama = request.getParameter("nama");
        String nomorTelepon = request.getParameter("nomorTelepon");
        String kewarganegaraan = request.getParameter("kewarganegaraan");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String idKtp = request.getParameter("idKtp");
        String alamat = request.getParameter("alamat");
        Date checkIN_Date = Date.valueOf(request.getParameter("checkIN_Date"));
        String bed = request.getParameter("bed");
        String tipeKamar = request.getParameter("tipeKamar");
        String nomorKamar = request.getParameter("nomorKamar");
        double harga = Double.parseDouble(request.getParameter("harga"));

        LOGGER.info("Received data: " + nama + ", " + nomorTelepon + ", " + kewarganegaraan + ", " + gender + ", " + email + ", " + idKtp + ", " + alamat + ", " + checkIN_Date + ", " + bed + ", " + tipeKamar + ", " + nomorKamar + ", " + harga);

        // Buat objek peminjaman dan simpan ke database
        checkIN checkin = new checkIN(nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga);
        ckin.addCheckin(checkin);

        // Redirect kembali ke halaman daftar peminjaman
        response.sendRedirect("CheckINHandler");
    }
}