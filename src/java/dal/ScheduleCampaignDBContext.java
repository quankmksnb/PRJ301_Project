/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.Employee;
import models.ScheduleCampaign;

/**
 *
 * @author Admin
 */
public class ScheduleCampaignDBContext extends DBContext<ScheduleCampaign> {

    @Override
    public void insert(ScheduleCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(ScheduleCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(ScheduleCampaign model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<ScheduleCampaign> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ScheduleCampaign get(int id) {
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [ScheduleCampaign] where scid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, id);
            rs = ps.executeQuery();                // thay có việc run bên sql server

            while (rs.next()) {
                ScheduleCampaign e = new ScheduleCampaign();
                e.setScid(rs.getInt(1));          // rs thể hiện thay thế các thứ tự cột khi chạy câu lệnh
                e.setPlanCampaign(pcd.get(rs.getInt(2)));
                e.setDate(rs.getDate(3));
                e.setShift(rs.getString(4));
                e.setQuantity(rs.getInt(5));

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

    public List<ScheduleCampaign> getByPlanId(int plid) {
        List<ScheduleCampaign> scheduleList = new ArrayList<>();
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select sc.scid, sc.canid, sc.date, sc.shift, sc.quantity \n"
                    + "from ScheduleCampaign sc join PlanCampaign pc\n"
                    + "on sc.canid = pc.canid\n"
                    + "where pc.plid = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, plid);
            rs = ps.executeQuery();

            while (rs.next()) {
                ScheduleCampaign sc = new ScheduleCampaign();
                sc.setScid(rs.getInt(1));
                sc.setPlanCampaign(pcd.get(rs.getInt(2)));
                sc.setDate(rs.getDate(3));
                sc.setShift(rs.getString(4));
                sc.setQuantity(rs.getInt(5));

                scheduleList.add(sc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ScheduleCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ScheduleCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return scheduleList;
    }

    public static void main(String[] args) {
        ScheduleCampaignDBContext s = new ScheduleCampaignDBContext();
        System.out.println(s.getByPlanId(1));
    }
}
