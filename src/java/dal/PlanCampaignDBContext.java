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
import models.Department;
import models.Employee;
import models.PlanCampaign;

/**
 *
 * @author Admin
 */
public class PlanCampaignDBContext extends DBContext<PlanCampaign> {

    public void insertList(List<PlanCampaign> planCampList) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection.setAutoCommit(false);  // Bắt đầu giao dịch
            String sql = "INSERT INTO [dbo].[PlanCampaign]\n"
                    + "           ([plid]\n"
                    + "           ,[pid]\n"
                    + "           ,[quantity]\n"
                    + "           ,[estimatedeffort])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            for (PlanCampaign pc : planCampList) {
                ps.setInt(1, pc.getPlan().getPlid());
                ps.setInt(2, pc.getProduct().getPid());   // dùng cho các câu lệnh có dấu '?' để thay thế vào '?' tương ứng
                ps.setInt(3, pc.getQuantity());
                ps.setFloat(4, pc.getEstimatedEffort());
                ps.executeUpdate();                // thay có việc run bên sql server
            }

            connection.commit();  // Commit sau khi insert hết các bản ghi
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                if (connection != null) {
                    connection.rollback();  // Rollback nếu có lỗi
                }
            } catch (SQLException ex1) {
                Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                connection.setAutoCommit(true);  // Đặt lại chế độ auto-commit
                connection.close();  // Đóng kết nối
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void insert(PlanCampaign model) {
        PreparedStatement ps = null;
        try {
            String sql = "INSERT INTO [dbo].[PlanCampaign]\n"
                    + "           ([plid]\n"
                    + "           ,[pid]\n"
                    + "           ,[quantity]\n"
                    + "           ,[estimatedeffort])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server

            ps.setInt(1, model.getPlan().getPlid());
            ps.setInt(2, model.getProduct().getPid());
            ps.setInt(3, model.getQuantity());
            ps.setFloat(4, model.getEstimatedEffort());
            int rowsInserted = ps.executeUpdate(); // kiểm tra số dòng được thêm vào

            if (rowsInserted > 0) {
                System.out.println("Insert successful: " + model.getProduct().getPid());
            } else {
                System.out.println("Insert failed for: " + model.getProduct().getPid());
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public void update(PlanCampaign model) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "UPDATE [dbo].[PlanCampaign]\n"
                    + "   SET [quantity] = ?\n"
                    + "      ,[estimatedeffort] = ?\n"
                    + " WHERE canid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, model.getQuantity());   // dùng cho các câu lệnh có dấu '?' để thay thế vào '?' tương ứng
            ps.setFloat(2, model.getEstimatedEffort());
            ps.setInt(3, model.getCanid());

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
    public void delete(PlanCampaign model) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "DELETE FROM [dbo].[PlanCampaign]\n"
                    + "      WHERE canid = ?";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ps.setInt(1, model.getCanid());   // dùng cho các câu lệnh có dấu '?' để thay thế vào '?' tương ứng

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
                e.setEstimatedEffort(rs.getFloat(5));

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

    public List<PlanCampaign> listByPlanId(int plid) {
        List<PlanCampaign> planCampaignList = new ArrayList<>();
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM PlanCampaign WHERE plid = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, plid);
            rs = ps.executeQuery();
            ProductDBContext productDB = new ProductDBContext();
            PlanDBContext planDB = new PlanDBContext();
            while (rs.next()) {
                PlanCampaign pc = new PlanCampaign();
                pc.setCanid(rs.getInt("canid"));
                pc.setPlan(planDB.get(rs.getInt("plid")));
                pc.setProduct(productDB.get(rs.getInt("pid")));
                pc.setQuantity(rs.getInt("quantity"));
                pc.setEstimatedEffort(rs.getFloat("estimatedeffort"));
                planCampaignList.add(pc);
            }
        } catch (SQLException ex) {
            Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(PlanCampaignDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return planCampaignList;
    }

    public static void main(String[] args) {
        PlanCampaignDBContext p = new PlanCampaignDBContext();
        System.out.println(p.get(1));
    }
}
