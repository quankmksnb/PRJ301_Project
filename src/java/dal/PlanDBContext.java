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
import models.Plan;
import models.Product;

/**
 *
 * @author Admin
 */
public class PlanDBContext extends DBContext<Plan> {

    public static void main(String[] args) {
        PlanDBContext p = new PlanDBContext();
        Plan pp = new Plan();
        pp.setPlid(8);
        p.delete(pp);
    }

    @Override
    public void insert(Plan model) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "INSERT INTO [dbo].[Plan]\n"
                    + "           ([startd]\n"
                    + "           ,[endd]\n"
                    + "           ,[did])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setDate(1, model.getStartd());
            ps.setDate(2, model.getEndd());   // dùng cho các câu lệnh có dấu '?' để thay thế vào '?' tương ứng
            ps.setInt(3, model.getDepartment().getDid());
            ps.executeUpdate();                // thay có việc run bên sql server

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    public void update(Plan model) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE [dbo].[Plan]\n"
                    + "   SET [startd] = ?\n"
                    + "      ,[endd] = ?\n"
                    + "      ,[did] = ?\n"
                    + " WHERE plid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setDate(1, model.getStartd());   // dùng cho các câu lệnh có dấu '?' để thay thế vào '?' tương ứng
            ps.setDate(2, model.getEndd());
            ps.setInt(3, model.getDepartment().getDid());
            ps.setInt(4, model.getPlid());

            ps.executeUpdate();                // thay có việc run bên sql server

        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void delete(Plan model) {
        PreparedStatement ps1 = null;
        PreparedStatement ps2 = null;
        ResultSet rs = null;
        try {
            connection.setAutoCommit(false);
            String deletePlanCampaignSQL = "DELETE FROM PlanCampaign WHERE plid = ?";
            ps1 = connection.prepareStatement(deletePlanCampaignSQL);
            ps1.setInt(1, model.getPlid());
            ps1.executeUpdate();
            
            String deletePlanSQL = "DELETE FROM [dbo].[Plan] WHERE plid = ?";
            ps2 = connection.prepareStatement(deletePlanSQL);
            ps2.setInt(1, model.getPlid());
            ps2.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps1 != null) {
                    ps1.close();
                }
                if (ps2 != null) {
                    ps2.close();
                }
                if (connection != null) {
                    connection.setAutoCommit(true);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public ArrayList<Plan> list() {
        ArrayList<Plan> planList = new ArrayList<>();
        DepartmentDBContext dd = new DepartmentDBContext();
        PreparedStatement ps = null;
        try {
            String sql = "select * from [Plan]";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ResultSet rs = ps.executeQuery();
            Plan p = null;// thay có việc run bên sql server

            while (rs.next()) {
                p = new Plan();
                p.setPlid(rs.getInt(1));
                p.setStartd(rs.getDate(2));
                p.setEndd(rs.getDate(3));

                Department newDepartment = dd.get(rs.getInt(4));
                p.setDepartment(newDepartment);

                planList.add(p);
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
        return planList;
    }

    @Override
    public Plan get(int id) {
        DepartmentDBContext dd = new DepartmentDBContext();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "select * from [Plan] where plid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, id);
            rs = ps.executeQuery();                // thay có việc run bên sql server

            while (rs.next()) {
                Plan p = new Plan();
                p.setPlid(rs.getInt(1));          // rs thể hiện thay thế các thứ tự cột khi chạy câu lệnh
                p.setStartd(rs.getDate(2));
                p.setEndd(rs.getDate(3));
                p.setDepartment(dd.get(rs.getInt(4)));

                return p;
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
