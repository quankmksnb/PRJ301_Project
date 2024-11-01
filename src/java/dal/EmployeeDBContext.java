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
        System.out.println(e.get("CN001"));
    }
    @Override
    public Employee get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public Employee get(String id){
        DepartmentDBContext dd = new DepartmentDBContext();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [Employee] where eid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setString(1, id);
            rs = ps.executeQuery();                // thay có việc run bên sql server

            while (rs.next()) {
                Employee e = new Employee();
                e.setEid(rs.getString(1));          // rs thể hiện thay thế các thứ tự cột khi chạy câu lệnh
                e.setEname(rs.getString(2));
                e.setSalaryLevel(rs.getString(3));
                e.setDepartment(dd.get(rs.getInt(4)));

                return e;
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
        return null;
    }
}
