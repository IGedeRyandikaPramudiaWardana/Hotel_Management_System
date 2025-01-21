/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import connection.kamarCon;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Logger;
import model.kamar;

@WebServlet(name = "EditKamarServlet", urlPatterns = {"/EditKamarServlet"})
public class EditKamarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(DeleteServlet.class.getName());
    private kamarCon kamarCon = new kamarCon();

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doPost called");
        
        // Ambil data dari form
        String nomorKamar = request.getParameter("nomorKamar");
        String nomorKamarLama = request.getParameter("nomorKamarLama");
        String tipeKamar = request.getParameter("tipeKamar");
        String tipeBed = request.getParameter("tipeBed");
        //int harga = Integer.parseInt(request.getParameter(""));
        double harga = Double.parseDouble(request.getParameter("harga").replace("Rp ", "").replace(".", "").replace(",", ""));
        String status = request.getParameter("status");

        LOGGER.info("Data diterima: " + nomorKamar + ", " + tipeKamar + ", " + tipeBed + ", " + harga + ", " + status);

        // Buat objek kendaraan dan simpan ke database
        kamar k = new kamar(nomorKamar, tipeKamar, tipeBed, harga, status);
        kamarCon.updateKamar(nomorKamarLama, k);

        // Redirect kembali ke halaman daftar kendaraan
        response.sendRedirect("kelolaKamarServlet");
    }
}
