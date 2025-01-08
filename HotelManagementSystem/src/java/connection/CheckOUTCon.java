/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.CheckOUT;

public class CheckOUTCon {

    // Konfigurasi Database
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Membuat koneksi ke database
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // Menampilkan semua data Check-OUT
    public List<CheckOUT> getAllCheckOUT() {
        List<CheckOUT> checkOutList = new ArrayList<>();

        String sql = "SELECT * FROM checkout";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                CheckOUT co = new CheckOUT(
                        rs.getString("idKtp"),
                        rs.getString("nama"),
                        rs.getString("checkIN_Date"),
                        rs.getString("checkOUT_Date"),
                        rs.getInt("jumlahHari"),
                        rs.getDouble("totalHarga"),
                        rs.getString("email")
                );
                checkOutList.add(co);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checkOutList;
    }

    // Menambahkan data Check-OUT
    public boolean addCheckOUT(CheckOUT co) {
        String sql = "INSERT INTO checkout (idKtp, nama, checkIN_Date, checkOUT_Date, jumlahHari, totalHarga, email) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, co.getIdKtp());
            ps.setString(2, co.getNama());
            ps.setString(3, co.getCheckIN_Date());
            ps.setString(4, co.getCheckOUT_Date());
            ps.setInt(5, co.getJumlahHari());
            ps.setDouble(6, co.getTotalHarga());
            ps.setString(7, co.getEmail());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Mengupdate data Check-OUT
    public boolean updateCheckOUT(CheckOUT co) {
        String sql = "UPDATE checkout SET nama = ?, checkIN_Date = ?, checkOUT_Date = ?, jumlahHari = ?, totalHarga = ?, email = ? WHERE idKtp = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, co.getNama());
            ps.setString(2, co.getCheckIN_Date());
            ps.setString(3, co.getCheckOUT_Date());
            ps.setInt(4, co.getJumlahHari());
            ps.setDouble(5, co.getTotalHarga());
            ps.setString(6, co.getEmail());
            ps.setString(7, co.getIdKtp());
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Menghapus data Check-OUT berdasarkan ID/KTP
    public boolean deleteCheckOUT(String idKtp) {
        String sql = "DELETE FROM checkout WHERE idKtp = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, idKtp);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Mengambil data Check-OUT berdasarkan ID/KTP
    public CheckOUT getCheckOUTById(String idKtp) {
        String sql = "SELECT * FROM check_out WHERE idKtp = ?";
        CheckOUT co = null;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, idKtp);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                co = new CheckOUT(
                        rs.getString("idKtp"),
                        rs.getString("nama"),
                        rs.getString("checkIN_Date"),
                        rs.getString("checkOUT_Date"),
                        rs.getInt("jumlahHari"),
                        rs.getDouble("totalHarga"),
                        rs.getString("email")
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return co;
    }
}
