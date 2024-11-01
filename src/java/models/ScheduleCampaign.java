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
    private PlanCampaign planCampaign;
    private Date date;
    private String shift;
    private int quantity;

    // Constructor

    public ScheduleCampaign(int scid, PlanCampaign planCampaign, Date date, String shift, int quantity) {
        this.scid = scid;
        this.planCampaign = planCampaign;
        this.date = date;
        this.shift = shift;
        this.quantity = quantity;
    }
    

    public ScheduleCampaign() {
    }
    

    // Getters and setters
    public int getScid() {
        return scid;
    }

    public void setScid(int scid) {
        this.scid = scid;
    }

    public PlanCampaign getPlanCampaign() {
        return planCampaign;
    }

    public void setPlanCampaign(PlanCampaign planCampaign) {
        this.planCampaign = planCampaign;
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

    @Override
    public String toString() {
        return "ScheduleCampaign{" + "scid=" + scid + ", planCampaign=" + planCampaign + ", date=" + date + ", shift=" + shift + ", quantity=" + quantity + '}';
    }
    
    
    
}
