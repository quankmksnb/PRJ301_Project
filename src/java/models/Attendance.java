/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Attendance {
    private int aid;
    private int wsid;
    private int quantity;
    private float alpha;

    // Constructor
    public Attendance(int aid, int wsid, int quantity, float alpha) {
        this.aid = aid;
        this.wsid = wsid;
        this.quantity = quantity;
        this.alpha = alpha;
    }

    public Attendance() {
    }

    
    // Getters and setters
    public int getAid() {
        return aid;
    }

    public void setAid(int aid) {
        this.aid = aid;
    }

    public int getWsid() {
        return wsid;
    }

    public void setWsid(int wsid) {
        this.wsid = wsid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getAlpha() {
        return alpha;
    }

    public void setAlpha(float alpha) {
        this.alpha = alpha;
    }
}
