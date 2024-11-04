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
public class PlanCampaignDeleteController extends BaseRBACController {
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        int canid = Integer.parseInt(request.getParameter("canid"));
        int plid = Integer.parseInt(request.getParameter("plid"));
        PlanCampaign pc = new PlanCampaign();
        pc.setCanid(canid);
        
        pcd.delete(pc);
        
        response.sendRedirect("../plancampaign/list?plid="+plid);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
