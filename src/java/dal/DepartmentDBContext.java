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
import models.Department;
import models.Product;
/**
 *
 * @author Admin
 *//**
 *
 * @author Admin
 */
public class DepartmentDBContext extends DBContext<Department>{

    @Override
    public void insert(Department model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Department model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Department model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Department> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Department get(int id) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from Department where did = ?;";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, id);
            rs = ps.executeQuery();                // thay có việc run bên sql server

            while (rs.next()) {
                Department d = new Department();
                d.setDid(rs.getInt(1));          // rs thể hiện thay thế các thứ tự cột khi chạy câu lệnh
                d.setDname(rs.getString("dname"));
                d.setDtype(rs.getString(3));

                return d;
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
    public static void main(String[] args) {
        DepartmentDBContext d = new DepartmentDBContext();
        System.out.println(d.get(2));
    }
}
