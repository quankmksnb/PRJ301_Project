/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Department {
    private int did;
    private String dname;
    private String dtype;

    public Department() {
    }

    
    // Constructor
    public Department(int did, String dname, String dtype) {
        this.did = did;
        this.dname = dname;
        this.dtype = dtype;
    }

    // Getters and setters
    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getDtype() {
        return dtype;
    }

    public void setDtype(String dtype) {
        this.dtype = dtype;
    }

    @Override
    public String toString() {
        return "Department{" + "did=" + did + ", dname=" + dname + ", dtype=" + dtype + '}';
    }
    
}
