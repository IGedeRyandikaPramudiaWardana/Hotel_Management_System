/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

import model.checkIN;
import model.kamar;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

public class checkINCon {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    private static final Logger LOGGER = Logger.getLogger(checkINCon.class.getName());

    public Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    public void addCheckin(checkIN ckin) {
        String sql = "INSERT INTO checkin (nama, nomorTelepon, kewarganegaraan, gender, email, idKtp, alamat, checkIN_Date, bed, tipeKamar, nomorKamar, harga) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        LOGGER.info("Executing query: " + sql);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, ckin.getNama());
            ps.setString(2, ckin.getNomorTelepon());
            ps.setString(3, ckin.getKewarganegaraan());
            ps.setString(4, ckin.getGender());
            ps.setString(5, ckin.getEmail());
            ps.setString(6, ckin.getIdKtp());
            ps.setString(7, ckin.getAlamat());
            ps.setDate(8, (Date) ckin.getCheckIN_Date());
            ps.setString(9, ckin.getBed());
            ps.setString(10, ckin.getTipeKamar());
            ps.setString(11, ckin.getNomorKamar());
            ps.setDouble(12, ckin.getHarga());  // Perbaiki indeks parameter di sini

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                LOGGER.info("Data berhasil ditambahkan: " + ckin.getIdKtp());
                updateStatusKamar(ckin.getNomorKamar(), "Check In");
            } else {
                LOGGER.warning("Data tidak berhasil ditambahkan: " + ckin.getNomorKamar());
            }
        } catch (SQLException e) {
            LOGGER.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public List<kamar> getAvailableKamar() {
        List<kamar> kamarList = new ArrayList<>();  // Ganti nama variabel menjadi kamarList untuk menghindari konflik
        String sql = "SELECT * FROM avaibility WHERE status='Avaible'";  // Pastikan nama tabel sesuai dengan yang ada di DB

        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                kamar k = new kamar(  // Gantilah nama objek menjadi k
                        rs.getString("nomorKamar"),
                        rs.getString("tipeKamar"),
                        rs.getString("tipeBed"),
                        rs.getDouble("harga"),
                        rs.getString("status")
                );
                kamarList.add(k);  // Tambahkan objek kamar ke daftar
            }
        } catch (SQLException e) {
            LOGGER.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }

        return kamarList;
    }

    private void updateStatusKamar(String nomorKamar, String status) {
        String sql = "UPDATE checkin SET status=? WHERE nomorKamar=?";

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setString(2, nomorKamar);
            ps.executeUpdate();
            LOGGER.info("Status kendaraan berhasil diperbarui: " + nomorKamar + " menjadi " + status);
        } catch (SQLException e) {
            LOGGER.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
