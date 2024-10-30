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
public class PlanCampaign {
    private int canid;
    private int plid;
    private int pid;
    private int quantity;
    private float estimatedEffort;

    // Constructor
    public PlanCampaign(int canid, int plid, int pid, int quantity, float estimatedEffort) {
        this.canid = canid;
        this.plid = plid;
        this.pid = pid;
        this.quantity = quantity;
        this.estimatedEffort = estimatedEffort;
    }

    // Getters and setters
    public int getCanid() {
        return canid;
    }

    public void setCanid(int canid) {
        this.canid = canid;
    }

    public int getPlid() {
        return plid;
    }

    public void setPlid(int plid) {
        this.plid = plid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getEstimatedEffort() {
        return estimatedEffort;
    }

    public void setEstimatedEffort(float estimatedEffort) {
        this.estimatedEffort = estimatedEffort;
    }
}
