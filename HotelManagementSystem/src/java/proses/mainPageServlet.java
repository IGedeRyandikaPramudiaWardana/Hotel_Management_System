/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "mainPageServlet", urlPatterns = {"/mainPageServlet"})
public class mainPageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int jumlahKendaraan = 0;
        int jumlahPeminjam = 0;
        int jumlahPengembalian = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/test3", "root", "");

            /*
            // Menghitung jumlah kendaraan
            PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM kendaraan");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                jumlahKendaraan = rs.getInt(1);
            }

            // Menghitung jumlah peminjam
            ps = conn.prepareStatement("SELECT COUNT(*) FROM peminjaman");
            rs = ps.executeQuery();
            if (rs.next()) {
                jumlahPeminjam = rs.getInt(1);
            }

            // Menghitung jumlah pengembalian
            ps = conn.prepareStatement("SELECT COUNT(*) FROM pengembalian");
            rs = ps.executeQuery();
            if (rs.next()) {
                jumlahPengembalian = rs.getInt(1);
            }
            
            */
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        /*
        request.setAttribute("jumlahKendaraan", jumlahKendaraan);
        request.setAttribute("jumlahPeminjam", jumlahPeminjam);
        request.setAttribute("jumlahPengembalian", jumlahPengembalian);
        */
        
        request.getRequestDispatcher("/mainPage.jsp").forward(request, response);
    }
}