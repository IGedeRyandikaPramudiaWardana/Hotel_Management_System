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
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "kelolaKamar", urlPatterns = {"/kelolaKamar"})
public class kelolaKamar extends HttpServlet {

//    private Connection connectToDatabase() throws ClassNotFoundException, SQLException {
//        Class.forName("com.mysql.cj.jdbc.Driver");
//        String url = "jdbc:mysql://localhost:3306/test3";
//        String user = "root";
//        String password = "";
//        return DriverManager.getConnection(url, user, password);
//    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        ArrayList<kamar> daftarKamar = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection()) {
            String query = "SELECT * FROM avaibility";
            try (PreparedStatement ps = conn.prepareStatement(query);
                 ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {
                    kamar k = new kamar(
                            rs.getString("nomorKamar"),
                            rs.getString("tipeKamar"),
                            rs.getString("tipeBed"),
                            rs.getInt("harga"),
                            rs.getString("status")
                    );
                    daftarKamar.add(k);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        }

        request.setAttribute("daftarKamar", daftarKamar);
        request.getRequestDispatcher("kelolaKamar.jsp").forward(request, response);
    }
}