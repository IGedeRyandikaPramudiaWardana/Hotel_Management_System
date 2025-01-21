/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connection;

/**
 *
 * @author ASUS
 */

import model.kamar;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;



public class kamarCon {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test3";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";
    private static final Logger LOGGER = Logger.getLogger(kamarCon.class.getName());

    private Connection getConnection() throws SQLException {
    return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }
    // Menampilkan semua data kamar
    public List<kamar> getAllKamar() {
        List<kamar> kamarList = new ArrayList<>();
        
        try (Connection conn = getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM avaibility")) {

            while (rs.next()) {
                kamar k = new kamar(
                        rs.getString("nomorKamar"),
                        rs.getString("tipeKamar"),
                        rs.getString("tipeBed"), 
                        rs.getDouble("harga"),
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
    public void addKamar(kamar k) {
        String sql = "INSERT INTO avaibility (nomorKamar, tipeKamar, tipeBed, harga, status) VALUES (?, ?, ?, ?, ?)";
        LOGGER.info("Executing query: " + sql);
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, k.getNomorKamar());
            ps.setString(2, k.getTipeKamar());
            ps.setString(3, k.getTipeBed());
            ps.setDouble(4, k.getHarga());
            ps.setString(5, k.getStatus());
            
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0){
                LOGGER.info("Data berhasil ditambahkan: " + k.getNomorKamar());
            } else {
                LOGGER.warning("Data gagal ditambahkan: " +k.getNomorKamar());
            }

        } catch (SQLException e) {
            LOGGER.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }
        
    }

    // Mengedit data kamar
    public void updateKamar(String kamarLama,kamar k) {
        String sql = "UPDATE avaibility SET nomorKamar = ?, tipeKamar = ?, tipeBed = ?, harga = ?, status = ? WHERE nomorKamar = ?";
        LOGGER.info("Executing query: " + sql);
        
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, k.getNomorKamar());
            ps.setString(2, k.getTipeKamar());
            ps.setString(3, k.getTipeBed());
            ps.setDouble(4, k.getHarga());
            ps.setString(5, k.getStatus());
            
            ps.setString(6, kamarLama);
            int rowsAffected = ps.executeUpdate();
            if(rowsAffected > 0){
                LOGGER.info("Data berhasil ditambahkan: " + k.getNomorKamar());
            } else {
                LOGGER.warning("Data gagal ditambahkan: " +k.getNomorKamar());
            }

        } catch (SQLException e) {
            LOGGER.severe("Database error: " + e.getMessage());
            e.printStackTrace();
        }
    }


    // Menghapus data kamar
    public void deleteKamar(String nomorKamar) {
        String sql = "DELETE FROM avaibility WHERE avaibility . nomorKamar = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, nomorKamar);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Data kamar berhasil dihapus.");
            } else {
                System.out.println("Data kamar tidak ditemukan.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Gagal menghapus data kamar: " + e.getMessage());
        }
    }
    
    
    public List<String> getEnumValues(String columnName) {
        List<String> enumValues = new ArrayList<>();
        String query = "SHOW COLUMNS FROM avaibility WHERE Field = ?";
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, columnName);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                String type = resultSet.getString("Type");
                String[] values = type.substring(type.indexOf("(") + 1, type.lastIndexOf(")")).split(",");
                for (String value : values) {
                    enumValues.add(value.replace("'", "").trim());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return enumValues;
    }
    
    public List<String> getAllBedTypes() throws SQLException {
        List<String> bedList = new ArrayList<>();
        String sql = "SELECT DISTINCT tipeBed FROM avaibility";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                bedList.add(rs.getString("tipeBed"));
            }
        }
        return bedList;
    }

    public List<String> getAllRoomTypes() throws SQLException {
        List<String> tipeKamarList = new ArrayList<>();
        String sql = "SELECT DISTINCT tipeKamar FROM avaibility";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                tipeKamarList.add(rs.getString("tipeKamar"));
            }
        }
        return tipeKamarList;
    }

    public List<String> getAvailableRoomNumbers() throws SQLException {
        List<String> nomorKamarList = new ArrayList<>();
        String sql = "SELECT nomorKamar FROM avaibility WHERE status = 'Available'";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                nomorKamarList.add(rs.getString("nomorKamar"));
            }
        }
        return nomorKamarList;
    }

    public List<Double> getRoomPrices() throws SQLException {
        List<Double> hargaList = new ArrayList<>();
        String sql = "SELECT harga FROM avaibility WHERE status = 'Available'";
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                hargaList.add(rs.getDouble("harga"));
            }
        }
        return hargaList;
    }

}
