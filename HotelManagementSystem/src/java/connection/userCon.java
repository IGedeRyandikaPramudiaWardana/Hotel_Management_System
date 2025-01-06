/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

/**
 *
 * @author ASUS
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.user;


public class userCon {
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "";

    public boolean validateUser(user user) {
        boolean isValid = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            //Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            Connection conn = DatabaseConnection.getConnection();

            String sql = "SELECT * FROM admin WHERE nama = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUsername());
            ps.setString(2, user.getPassword());
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                isValid = true;
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
}
