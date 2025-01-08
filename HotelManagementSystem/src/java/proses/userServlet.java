/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package proses;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/userServlet")
public class userServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/test3";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = ""; // Ganti dengan password MySQL Anda

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>User List</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("<h1>Daftar Pengguna</h1>");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a database connection
            Connection conn = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);

            // Create a SQL statement
            Statement stmt = conn.createStatement();

            // Execute a query to retrieve user data
            String sql = "SELECT id, nama, password, akses FROM admin";
            ResultSet rs = stmt.executeQuery(sql);

            // Generate the HTML table
//            out.println("<table border='1'>");
//            out.println("<tr>");
//            out.println("<th>ID</th>");
//            out.println("<th>Nama</th>");
//            out.println("<th>Password</th>");
//            out.println("<th>Akses</th>");
//            out.println("</tr>");

            // Populate the table rows with data from the database
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("nama") + "</td>");
                out.println("<td>" + rs.getString("password") + "</td>");
                out.println("<td>" + rs.getString("akses") + "</td>");
                out.println("</tr>");
            }

            out.println("</table>");

            // Close the result set, statement, and connection
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }

        out.println("</body>");
        out.println("</html>");
    }
}
