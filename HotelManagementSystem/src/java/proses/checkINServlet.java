/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import connection.checkINCon;
import connection.kamarCon;
import jakarta.servlet.RequestDispatcher;
import model.checkIN;
import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.logging.Logger;
import model.kamar;

@WebServlet("/checkINServlet")
public class checkINServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(kelolaKamarServlet.class.getName());
    private kamarCon kamarCon = new kamarCon();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Ambil data kamar dari database melalui kamarCon
            List<String> bedList = kamarCon.getAllBedTypes();  // Mendapatkan tipe bed
            List<String> tipeKamarList = kamarCon.getAllRoomTypes();  // Mendapatkan tipe kamar
            List<String> nomorKamarList = kamarCon.getAvailableRoomNumbers();  // Mendapatkan nomor kamar
            List<Double> hargaList = kamarCon.getRoomPrices();  // Mendapatkan harga kamar

            // Set data sebagai atribut untuk dikirim ke JSP
            request.setAttribute("bedList", bedList);
            request.setAttribute("tipeKamarList", tipeKamarList);
            request.setAttribute("nomorKamarList", nomorKamarList);
            request.setAttribute("hargaList", hargaList);

            // Forward ke JSP untuk ditampilkan
            RequestDispatcher dispatcher = request.getRequestDispatcher("checkin.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            LOGGER.severe("Error in database operation: " + e.getMessage());
            throw new ServletException("Database error", e);
        }
    }

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
        double harga = Double.parseDouble(request.getParameter("harga"));

        // Buat objek checkIN
        checkIN checkIN = new checkIN(nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga);

        // Simpan ke database
        checkINCon dao = new checkINCon();
        try {
            dao.insertCheckIN(checkIN);
            response.sendRedirect("checkin.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("checkin_failure.jsp");
        }
    }
}
