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
import models.Employee;
import models.PlanCampaign;

/**
 *
 * @author Admin
 */
public class PlanCampaignDBContext extends DBContext<PlanCampaign> {

    @Override
    public void insert(PlanCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(PlanCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(PlanCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<PlanCampaign> list() {
        ArrayList<PlanCampaign> productList = new ArrayList<>();
        ProductDBContext pd = new ProductDBContext();
        PlanDBContext pld = new PlanDBContext();
        PreparedStatement ps = null;
        try {
            String sql = "select * from [PlanCampaign]";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ResultSet rs = ps.executeQuery();                // thay có việc run bên sql server
            while (rs.next()) {
                PlanCampaign p = new PlanCampaign();
                p.setCanid(rs.getInt(1));
                p.setPlan(pld.get(rs.getInt(2)));
                p.setProduct(pd.get(rs.getInt(3)));
                p.setQuantity(rs.getInt(4));
                p.setEstimatedEffort(rs.getFloat(5));

                productList.add(p);
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

    @Override
    public PlanCampaign get(int id) {
        ProductDBContext pd = new ProductDBContext();
        PlanDBContext pld = new PlanDBContext();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [PlanCampaign] where canid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, id);
            rs = ps.executeQuery();                // thay có việc run bên sql server

            while (rs.next()) {
                PlanCampaign e = new PlanCampaign();
                e.setCanid(rs.getInt(1));          // rs thể hiện thay thế các thứ tự cột khi chạy câu lệnh
                e.setPlan(pld.get(rs.getInt(2)));
                e.setProduct(pd.get(rs.getInt(3)));
                e.setQuantity(rs.getInt(4));
                e.setEstimatedEffort(rs.getInt(5));

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

    public static void main(String[] args) {
        PlanCampaignDBContext p = new PlanCampaignDBContext();
        System.out.println(p.get(1));
    }
}
