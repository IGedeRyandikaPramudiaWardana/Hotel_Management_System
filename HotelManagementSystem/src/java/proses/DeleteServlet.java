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

@WebServlet(name = "DeleteServlet", urlPatterns = {"/DeleteServlet"})
public class DeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger LOGGER = Logger.getLogger(DeleteServlet.class.getName());
    private kamarCon kamarCon = new kamarCon();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nomorKamar = request.getParameter("nomorKamar");  // Ambil parameter nomor kamar dari form
        // Panggil method delete di kamarCon untuk menghapus data kamar
        kamarCon.deleteKamar(nomorKamar);
        LOGGER.info("Kamar dengan nomor " + nomorKamar + " berhasil dihapus.");
        response.sendRedirect("kelolaKamarServlet");  // Redirect ke halaman checkin.jsp setelah berhasil dihapus
    }
}
