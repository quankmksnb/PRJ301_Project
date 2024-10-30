/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class WorkerSchedule {
    private int wsid;
    private int scid;
    private String eid;
    private int quantity;

    // Constructor
    public WorkerSchedule(int wsid, int scid, String eid, int quantity) {
        this.wsid = wsid;
        this.scid = scid;
        this.eid = eid;
        this.quantity = quantity;
    }

    // Getters and setters
    public int getWsid() {
        return wsid;
    }

    public void setWsid(int wsid) {
        this.wsid = wsid;
    }

    public int getScid() {
        return scid;
    }

    public void setScid(int scid) {
        this.scid = scid;
    }

    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
