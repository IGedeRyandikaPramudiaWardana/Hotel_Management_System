/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lenovo
 */
public class CheckOUT {
    // Deklarasi variabel
    private String idKtp;
    private String nama;
    private String checkIN_Date;
    private String checkOUT_Date;
    private int jumlahHari;
    private double totalHarga;
    private String email;

    // Constructor
    public CheckOUT(String idKtp, String nama, String checkIN_Date, String checkOUT_Date, int jumlahHari, double totalHarga, String email) {
        this.idKtp = idKtp;
        this.nama = nama;
        this.checkIN_Date = checkIN_Date;
        this.checkOUT_Date = checkOUT_Date;
        this.jumlahHari = jumlahHari;
        this.totalHarga = totalHarga;
        this.email = email;
    }

    // Getters and Setters

    // ID KTP
    public String getIdKtp() {
        return idKtp;
    }

    public void setIdKtp(String idKtp) {
        this.idKtp = idKtp;
    }

    // Nama
    public String getNama() {
        return nama;
    }

    public void setNama(String nama) {
        this.nama = nama;
    }

    // Tanggal Check-IN
    public String getCheckIN_Date() {
        return checkIN_Date;
    }

    public void setCheckIN_Date(String checkIN_Date) {
        this.checkIN_Date = checkIN_Date;
    }

    // Tanggal Check-OUT
    public String getCheckOUT_Date() {
        return checkOUT_Date;
    }

    public void setCheckOUT_Date(String checkOUT_Date) {
        this.checkOUT_Date = checkOUT_Date;
    }

    // Jumlah Hari Menginap
    public int getJumlahHari() {
        return jumlahHari;
    }

    public void setJumlahHari(int jumlahHari) {
        this.jumlahHari = jumlahHari;
    }

    // Total Harga
    public double getTotalHarga() {
        return totalHarga;
    }

    public void setTotalHarga(double totalHarga) {
        this.totalHarga = totalHarga;
    }

    // Email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
