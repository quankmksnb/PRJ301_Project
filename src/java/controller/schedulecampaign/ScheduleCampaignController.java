/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.schedulecampaign;

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

/**
 *
 * @author Admin
 */
public class ScheduleCampaignController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ScheduleCampaignController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ScheduleCampaignController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
