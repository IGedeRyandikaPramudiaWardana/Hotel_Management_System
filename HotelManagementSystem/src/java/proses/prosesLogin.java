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
import model.user;
import connection.userCon;
/**
 *
 * @author ASUS
 */
@WebServlet(name = "prosesLogin", urlPatterns = {"/prosesLogin"})
public class prosesLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get username and password from request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Create User object and validate using DAO
        user user = new user(username, password);
        userCon userDAO = new userCon();
        boolean isValid = userDAO.validateUser(user);

        if (isValid) {
            // Redirect to home page or dashboard
            response.sendRedirect(request.getContextPath() + "/mainPageServlet");
        } else {
            // Redirect back to login with error message
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=true");
        }
    }
}
