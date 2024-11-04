/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedulecampaign;

import controller.accesscontroll.BaseRBACController;
import dal.PlanDBContext;
import dal.ProductDBContext;
import dal.ScheduleCampaignDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import models.Plan;
import models.Product;
import models.ScheduleCampaign;
import models.User;

/**
 *
 * @author Admin
 */
public class ScheduleCampaignController extends BaseRBACController {
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        int plid = Integer.parseInt(request.getParameter("plid"));

        ProductDBContext pd = new ProductDBContext();
        List<Product> listPro = pd.list();

        PlanDBContext planDB = new PlanDBContext();
        Plan plan = planDB.get(plid);
        Date startDate = plan.getStartd();
        Date endDate = plan.getEndd();

        List<Date> dateList = new ArrayList<>();
        Date currentDate = startDate;
        while (!currentDate.after(endDate)) {
            dateList.add(currentDate); // Giữ nguyên đối tượng Date
            currentDate = Date.valueOf(currentDate.toLocalDate().plusDays(1));
        }

        ScheduleCampaignDBContext scheduleDB = new ScheduleCampaignDBContext();
        List<ScheduleCampaign> existingScheduleList = scheduleDB.getByPlanId(plid);

        // Tạo một map để lưu trữ giá trị đã có của mỗi ngày, sản phẩm và ca
        Map<String, Integer> existingDataMap = new HashMap<>();
        for (ScheduleCampaign sc : existingScheduleList) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String formattedDate = sdf.format(sc.getDate());
            String key = formattedDate + "_" + sc.getPlanCampaign().getProduct().getPid() + "_" + sc.getShift();
            existingDataMap.put(key, sc.getQuantity());

        }

        request.setAttribute("dataMap", existingDataMap);
        request.setAttribute("productList", listPro);
        request.setAttribute("dateList", dateList);
        request.getRequestDispatcher("../view/schedulecampaign/create.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
