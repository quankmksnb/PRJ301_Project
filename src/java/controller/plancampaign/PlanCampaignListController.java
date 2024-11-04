/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.plancampaign;

import controller.accesscontroll.BaseRBACController;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.PlanCampaignDBContext;
import java.util.List;
import models.PlanCampaign;
import models.User;

/**
 *
 * @author Admin
 */
public class PlanCampaignListController  extends BaseRBACController {

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        int plid = Integer.parseInt(request.getParameter("plid"));
        PlanCampaignDBContext pld = new PlanCampaignDBContext();
        List<PlanCampaign> planCampaignList = pld.list();
        
        request.setAttribute("planCampaignList", planCampaignList);
        request.getRequestDispatcher("/view/plancampaign/list.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
