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
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.kamar;
import connection.DatabaseConnection;



public class kamarCon {
//    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
//    private static final String DB_USER = "root";
//    private static final String DB_PASSWORD = "";

    // Menampilkan semua data kamar
    public List<kamar> getAllKamar() {
        List<kamar> kamarList = new ArrayList<>();
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM avaibility")) {

            while (rs.next()) {
                kamar k = new kamar(
                        rs.getString("nomorKamar"),
                        rs.getString("tipeKamar"),
                        rs.getString("tipeBed"),
                        rs.getInt("harga"),
                        rs.getString("status")
                );
                kamarList.add(k);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return kamarList;
    }

    // Menambahkan kamar baru
    public boolean addKamar(kamar k) {
        String sql = "INSERT INTO avaibility (nomorKamar, tipeKamar, tipeBed, harga, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, k.getNomorKamar());
            ps.setString(2, k.getTipeKamar());
            ps.setString(3, k.getTipeBed());
            ps.setInt(4, k.getHarga());
            ps.setString(5, k.getStatus());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Mengedit data kamar
    public boolean updateKamar(kamar k) {
        String sql = "UPDATE avaibility SET tipeKamar = ?, tipeBed = ?, harga = ?, status = ? WHERE nomorKamar = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, k.getTipeKamar());
            ps.setString(2, k.getTipeBed());
            ps.setInt(3, k.getHarga());
            ps.setString(4, k.getStatus());
            ps.setString(5, k.getNomorKamar());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Menghapus data kamar
    public boolean deleteKamar(String nomorKamar) {
        String sql = "DELETE FROM avaibility WHERE nomorKamar = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nomorKamar);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}