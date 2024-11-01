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
    private Plan plan;
    private Product product;
    private int quantity;
    private float estimatedEffort;

    // Constructor
    public PlanCampaign(int canid, Plan plan, Product product, int quantity, float estimatedEffort) {
        this.canid = canid;
        this.plan = plan;
        this.product = product;
        this.quantity = quantity;
        this.estimatedEffort = estimatedEffort;
    }

    public PlanCampaign() {
    }

    // Getters and setters
    public int getCanid() {
        return canid;
    }

    public void setCanid(int canid) {
        this.canid = canid;
    }

    public Plan getPlan() {
        return plan;
    }

    public void setPlan(Plan plan) {
        this.plan = plan;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
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

    @Override
    public String toString() {
        return "PlanCampaign{" + "canid=" + canid + ", plan=" + plan + ", product=" + product + ", quantity=" + quantity + ", estimatedEffort=" + estimatedEffort + '}';
    }
    
    
}
