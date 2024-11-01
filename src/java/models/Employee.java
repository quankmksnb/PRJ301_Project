/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package models;

/**
 *
 * @author Admin
 */
public class Employee {

    private String eid;
    private String ename;
    private String salaryLevel;
    private Department department;
    private User createdBy;

    public Employee() {
    }

    
    public String getEid() {
        return eid;
    }

    public void setEid(String eid) {
        this.eid = eid;
    }

    public String getEname() {
        return ename;
    }

    public void setEname(String ename) {
        this.ename = ename;
    }

    public String getSalaryLevel() {
        return salaryLevel;
    }

    public void setSalaryLevel(String salaryLevel) {
        this.salaryLevel = salaryLevel;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    

    public User getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(User createdBy) {
        this.createdBy = createdBy;
    }

    @Override
    public String toString() {
        return "Employee{" + "eid=" + eid + ", ename=" + ename + ", salaryLevel=" + salaryLevel + ", department=" + department + ", createdBy=" + createdBy + '}';
    }
    
}
