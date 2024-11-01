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
import models.WorkerSchedule;
/**
 *
 * @author Admin
 */
public class WokerScheduleDBContext extends DBContext<WorkerSchedule> {

    @Override
    public void insert(WorkerSchedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(WorkerSchedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(WorkerSchedule model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<WorkerSchedule> list() {
        ArrayList<WorkerSchedule> workerScheduleList = new ArrayList<>();
        EmployeeDBContext ed = new EmployeeDBContext();
        ScheduleCampaignDBContext sd = new ScheduleCampaignDBContext();
        PreparedStatement ps = null;
        try {
            String sql = "select * from [WorkerSchedule]";

            ps = connection.prepareStatement(sql);     // chuyển câu lệnh sang sql server
            ResultSet rs = ps.executeQuery();                // thay có việc run bên sql server
            while (rs.next()) {
                WorkerSchedule e = new WorkerSchedule();
                e.setWsid(rs.getInt(1));
                e.setScheduleCampaign(sd.get(rs.getInt(2)));
                e.setEmployee(ed.get(rs.getString(3)));
                e.setQuantity(rs.getInt(4));

                workerScheduleList.add(e);
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
        return workerScheduleList;
    }

    @Override
    public WorkerSchedule get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    public static void main(String[] args) {
        WokerScheduleDBContext wd = new WokerScheduleDBContext();
        System.out.println(wd.list());
    }
    
}
