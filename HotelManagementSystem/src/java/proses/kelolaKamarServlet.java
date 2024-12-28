/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.kamar;
import connection.DatabaseConnection;
import connection.kamarCon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "kelolaKamarServlet", urlPatterns = {"/kelolaKamarServlet"})
public class kelolaKamarServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(kelolaKamarServlet.class.getName());
    private kamarCon kamarCon = new kamarCon();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doGet called");
        List<kamar> kamarList = kamarCon.getAllKamar();
        request.setAttribute("kamarList", kamarList);
        request.getRequestDispatcher("kelolaKamar.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LOGGER.info("doPost called");
        
        // Ambil data dari form
        String nomorKamar = request.getParameter("nomorKamar");
        String tipeKamar = request.getParameter("tipeKamar");
        String tipeBed = request.getParameter("tipeBed");
        //int harga = Integer.parseInt(request.getParameter(""));
        double harga = Double.parseDouble(request.getParameter("harga").replace("Rp ", "").replace(".", "").replace(",", ""));
        String status = request.getParameter("status");

        LOGGER.info("Data diterima: " + nomorKamar + ", " + tipeKamar + ", " + tipeBed + ", " + harga + ", " + status);

        // Buat objek kendaraan dan simpan ke database
        kamar kamar = new kamar(nomorKamar, tipeKamar, tipeBed, harga, status);
        kamarCon.addKamar(kamar);

        // Redirect kembali ke halaman daftar kendaraan
        response.sendRedirect("KendaraanServlet");
    }
}