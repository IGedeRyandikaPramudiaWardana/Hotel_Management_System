/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

import model.CheckIN;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * DAO untuk CheckIN
 * Mengelola operasi CRUD pada tabel 'checkin'
 */
public class CheckINCon {

    // Konfigurasi database
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    // Membuat koneksi ke database
    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    // 1. Tambah Data Check-IN
    public boolean addCheckIN(CheckIN checkIN) {
        String sql = "INSERT INTO checkin (nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            // Mengatur parameter query
            ps.setString(1, checkIN.getNama());
            ps.setString(2, checkIN.getNomorTelepon());
            ps.setString(3, checkIN.getKewarganegaraan());
            ps.setString(4, checkIN.getGender());
            ps.setString(5, checkIN.getEmail());
            ps.setString(6, checkIN.getIdKtp());
            ps.setString(7, checkIN.getAlamat());
            ps.setString(8, checkIN.getCheckIN_Date());
            ps.setString(9, checkIN.getBed());
            ps.setString(10, checkIN.getTipeKamar());
            ps.setString(11, checkIN.getNomorKamar());
            ps.setInt(12, checkIN.getHarga());

            // Eksekusi query
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 2. Menampilkan Semua Data Check-IN
    public List<CheckIN> getAllCheckIN() {
        List<CheckIN> checkINList = new ArrayList<>();
        String sql = "SELECT * FROM checkin";

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                CheckIN checkIN = new CheckIN(
                        rs.getString("nama"),
                        rs.getString("nomorTelepon"),
                        rs.getString("kewarganegaraan"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("idKtp"),
                        rs.getString("alamat"),
                        rs.getString("checkIN_Date"),
                        rs.getString("bed"),
                        rs.getString("tipeKamar"),
                        rs.getString("nomorKamar"),
                        rs.getInt("harga")
                );
                checkINList.add(checkIN);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checkINList;
    }

    // 3. Mengambil Data Berdasarkan ID/KTP
    public CheckIN getCheckINById(String idKtp) {
        String sql = "SELECT * FROM checkin WHERE idKtp = ?";
        CheckIN checkIN = null;

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, idKtp);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                checkIN = new CheckIN(
                        rs.getString("nama"),
                        rs.getString("nomorTelepon"),
                        rs.getString("kewarganegaraan"),
                        rs.getString("gender"),
                        rs.getString("email"),
                        rs.getString("idKtp"),
                        rs.getString("alamat"),
                        rs.getString("checkIN_Date"),
                        rs.getString("bed"),
                        rs.getString("tipeKamar"),
                        rs.getString("nomorKamar"),
                        rs.getInt("harga")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return checkIN;
    }

    // 4. Mengupdate Data Check-IN
    public boolean updateCheckIN(CheckIN checkIN) {
        String sql = "UPDATE checkin SET nama = ?, nomorTelepon = ?, kewarganegaraan = ?, gender = ?, email = ?, alamat = ?, checkIN_Date = ?, bed = ?, tipeKamar = ?, nomorKamar = ?, harga = ? WHERE idKtp = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, checkIN.getNama());
            ps.setString(2, checkIN.getNomorTelepon());
            ps.setString(3, checkIN.getKewarganegaraan());
            ps.setString(4, checkIN.getGender());
            ps.setString(5, checkIN.getEmail());
            ps.setString(6, checkIN.getAlamat());
            ps.setString(7, checkIN.getCheckIN_Date());
            ps.setString(8, checkIN.getBed());
            ps.setString(9, checkIN.getTipeKamar());
            ps.setString(10, checkIN.getNomorKamar());
            ps.setInt(11, checkIN.getHarga());
            ps.setString(12, checkIN.getIdKtp());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // 5. Menghapus Data Check-IN
    public boolean deleteCheckIN(String idKtp) {
        String sql = "DELETE FROM checkin WHERE idKtp = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, idKtp);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
