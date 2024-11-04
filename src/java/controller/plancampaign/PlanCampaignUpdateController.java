/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.plancampaign;

import controller.accesscontroll.BaseRBACController;
import dal.PlanCampaignDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.PlanCampaign;
import models.User;

/**
 *
 * @author Admin
 */
public class PlanCampaignUpdateController extends BaseRBACController {
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        int canid = Integer.parseInt(request.getParameter("canid"));
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        
        PlanCampaign oldPC = pcd.get(canid);
        request.setAttribute("oldPC", oldPC);
        request.getRequestDispatcher("/view/plancampaign/update.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        
        int plid = Integer.parseInt(request.getParameter("plid"));
        int canid = Integer.parseInt(request.getParameter("canid"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float estimatedEffort = Float.parseFloat(request.getParameter("estimatedEffort"));
        
        PlanCampaign newPC = new PlanCampaign();
        newPC.setCanid(canid);
        newPC.setQuantity(quantity);
        newPC.setEstimatedEffort(estimatedEffort);
        
        pcd.update(newPC);
        
        response.sendRedirect("list?plid="+plid);
    }

}
