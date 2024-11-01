/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.Department;
/**
 *
 * @author Admin
 */
public class EmployeeDBContext extends DBContext<Employee> {

    @Override
    public void insert(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Employee model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Employee> list() {
        ArrayList<Employee> productList = new ArrayList<>();
        DepartmentDBContext dd = new DepartmentDBContext();
        PreparedStatement ps = null;
        try {
            String sql = "select * from Employee";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ResultSet rs = ps.executeQuery();                // thay có việc run bên sql server
            while (rs.next()) {
                Employee e = new Employee();
                e.setEid(rs.getString(1));
                e.setEname(rs.getString("ename"));
                e.setSalaryLevel(rs.getString(3));
                Department newDepartment = dd.get(rs.getInt(4));
                e.setDepartment(newDepartment);

                productList.add(e);
            }

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return productList;
    }

    public static void main(String[] args) {
        EmployeeDBContext e = new EmployeeDBContext();
        System.out.println(e.list());
    }
    @Override
    public Employee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
