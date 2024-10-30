/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;
import java.sql.*;
/**
 *
 * @author Admin
 */
public class Plan {
    private int plid;
    private Date startd;
    private Date endd;
    private int did;

    // Constructor
    public Plan(int plid, Date startd, Date endd, int did) {
        this.plid = plid;
        this.startd = startd;
        this.endd = endd;
        this.did = did;
    }

    // Getters and setters
    public int getPlid() {
        return plid;
    }

    public void setPlid(int plid) {
        this.plid = plid;
    }

    public Date getStartd() {
        return startd;
    }

    public void setStartd(Date startd) {
        this.startd = startd;
    }

    public Date getEndd() {
        return endd;
    }

    public void setEndd(Date endd) {
        this.endd = endd;
    }

    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public Plan() {
    }
}
