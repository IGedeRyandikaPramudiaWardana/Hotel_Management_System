/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Import model dan DAO
import model.CheckOUT;
import connection.CheckOUTCon;

@WebServlet("/CheckOUTHandler") // URL Mapping Servlet
public class CheckOUTHandler extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        try {
            // Ambil Data dari Form
            String idKtp = request.getParameter("idKtp");
            String nama = request.getParameter("nama");
            String checkIN_Date = request.getParameter("checkIN_Date");
            String checkOUT_Date = request.getParameter("checkOUT_Date");
            int jumlahHari = Integer.parseInt(request.getParameter("jumlahHari"));

            // Menghapus simbol "Rp. " dan format angka dari harga
            double totalHarga = Double.parseDouble(request.getParameter("totalHarga").replace("Rp. ", "").replace(",", ""));
            String email = request.getParameter("email");

            // Validasi Input
            if (idKtp == null || idKtp.isEmpty() || nama == null || nama.isEmpty()) {
                out.println("<h1>Error: Data tidak lengkap.</h1>");
                return;
            }

            // Buat Objek CheckOUT dari Model
            CheckOUT checkOUT = new CheckOUT(idKtp, nama, checkIN_Date, checkOUT_Date, jumlahHari, totalHarga, email);

            // Proses Check-OUT menggunakan DAO
            CheckOUTCon dao = new CheckOUTCon();
            boolean isAdded = dao.addCheckOUT(checkOUT); // Menyimpan data CheckOUT

            if (isAdded) {
                // Hapus data dari tabel Check-IN setelah berhasil Check-OUT
                boolean isDeleted = dao.deleteCheckOUT(idKtp); // Menghapus dari check-in

                if (isDeleted) {
                    out.println("<h1>Check-OUT Berhasil!</h1>");
                    out.println("<meta http-equiv='refresh' content='3;url=/HotelManagementSystem'>");
                } else {
                    out.println("<h1>Gagal menghapus data Check-IN.</h1>");
                }
            } else {
                out.println("<h1>Gagal menyimpan data Check-OUT.</h1>");
            }
        } catch (NumberFormatException e) {
            out.println("<h1>Error: Format angka salah.</h1>");
        /*} catch (SQLException e) {
            out.println("<h1>Error pada database: " + e.getMessage() + "</h1>");*/
        } catch (Exception e) {
            out.println("<h1>Error tidak terduga: " + e.getMessage() + "</h1>");
        }
    }
}
