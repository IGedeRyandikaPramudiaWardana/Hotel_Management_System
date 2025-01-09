/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import connection.checkINCon;
import model.checkIN;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/checkINServlet")
public class checkINServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
        int harga = Integer.parseInt(request.getParameter("harga"));

        // Buat objek checkIN
        checkIN checkIN = new checkIN(nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga);

        // Simpan ke database
        checkINCon dao = new checkINCon();
        try {
            dao.insertCheckIN(checkIN);
            response.sendRedirect("checkin_success.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("checkin_failure.jsp");
        }
    }
}
