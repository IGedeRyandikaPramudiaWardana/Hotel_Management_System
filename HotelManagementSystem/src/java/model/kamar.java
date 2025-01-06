/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ASUS
 */
public class kamar {
    private String nomorKamar;
    private String tipeKamar;
    private String tipeBed;
    private int harga;
    private String status;

    // Constructor
    public kamar(String nomorKamar, String tipeKamar, String tipeBed, int harga, String status) {
        this.nomorKamar = nomorKamar;
        this.tipeKamar = tipeKamar;
        this.tipeBed = tipeBed;
        this.harga = harga;
        this.status = status;
    }

    // Getters and Setters
    public String getNomorKamar() {
        return nomorKamar;
    }

    public void setNomorKamar(String nomorKamar) {
        this.nomorKamar = nomorKamar;
    }

    public String getTipeKamar() {
        return tipeKamar;
    }

    public void setTipeKamar(String tipeKamar) {
        this.tipeKamar = tipeKamar;
    }

    public String getTipeBed() {
        return tipeBed;
    }

    public void setTipeBed(String tipeBed) {
        this.tipeBed = tipeBed;
    }

    public int getHarga() {
        return harga;
    }

    public void setHarga(int harga) {
        this.harga = harga;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
