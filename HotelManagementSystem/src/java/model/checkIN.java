/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 * Model untuk Check-IN
 * @author LENOVO
 */
public class checkIN {
    private String nama;
    private String nomorTelepon;
    private String kewarganegaraan;
    private String gender;
    private String email;
    private String idKtp;
    private String alamat;
    private Date checkIN_Date;
    private String bed;
    private String tipeKamar;
    private String nomorKamar;
    private double harga;

    // Konstruktor
    public checkIN(String nama, String nomorTelepon, String kewarganegaraan, String gender, 
                   String email, String idKtp, String alamat, Date checkIN_Date, 
                   String bed, String tipeKamar, String nomorKamar, double harga) {
        this.nama = nama;
        this.nomorTelepon = nomorTelepon;
        this.kewarganegaraan = kewarganegaraan;
        this.gender = gender;
        this.email = email;
        this.idKtp = idKtp;
        this.alamat = alamat;
        this.checkIN_Date = checkIN_Date;
        this.bed = bed;
        this.tipeKamar = tipeKamar;
        this.nomorKamar = nomorKamar;
        this.harga = harga;
    }

    // Getter dan Setter
    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    public String getNomorTelepon() {
        return nomorTelepon;
    }

    public void setNomorTelepon(String nomorTelepon) {
        this.nomorTelepon = nomorTelepon;
    }

    public String getKewarganegaraan() {
        return kewarganegaraan;
    }

    public void setKewarganegaraan(String kewarganegaraan) {
        this.kewarganegaraan = kewarganegaraan;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdKtp() {
        return idKtp;
    }

    public void setIdKtp(String idKtp) {
        this.idKtp = idKtp;
    }

    public String getAlamat() {
        return alamat;
    }

    public void setAlamat(String alamat) {
        this.alamat = alamat;
    }

    public Date getCheckIN_Date() {
        return checkIN_Date;
    }

    public void setCheckIN_Date(Date checkIN_Date) {
        this.checkIN_Date = checkIN_Date;
    }

    public String getBed() {
        return bed;
    }

    public void setBed(String bed) {
        this.bed = bed;
    }

    public String getTipeKamar() {
        return tipeKamar;
    }

    public void setTipeKamar(String tipeKamar) {
        this.tipeKamar = tipeKamar;
    }

    public String getNomorKamar() {
        return nomorKamar;
    }

    public void setNomorKamar(String nomorKamar) {
        this.nomorKamar = nomorKamar;
    }

    public double getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }
}
