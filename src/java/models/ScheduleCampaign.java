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
public class ScheduleCampaign {
    private int scid;
    private int canid;
    private Date date;
    private String shift;
    private int quantity;

    // Constructor
    public ScheduleCampaign(int scid, int canid, Date date, String shift, int quantity) {
        this.scid = scid;
        this.canid = canid;
        this.date = date;
        this.shift = shift;
        this.quantity = quantity;
    }

    // Getters and setters
    public int getScid() {
        return scid;
    }

    public void setScid(int scid) {
        this.scid = scid;
    }

    public int getCanid() {
        return canid;
    }

    public void setCanid(int canid) {
        this.canid = canid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getShift() {
        return shift;
    }

    public void setShift(String shift) {
        this.shift = shift;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
