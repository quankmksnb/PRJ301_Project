/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.plan;

import controller.accesscontroll.BaseRBACController;
import dal.DepartmentDBContext;
import dal.PlanDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Plan;
import java.sql.*;
import models.Department;
import models.User;

/**
 *
 * @author Admin
 */
public class PlanUpdateController extends BaseRBACController {

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        String plid = request.getParameter("plid");
        PlanDBContext pd = new PlanDBContext();
        DepartmentDBContext dd = new DepartmentDBContext();

        Plan p = pd.get(Integer.parseInt(plid));
        request.setAttribute("oldPlan", p);
        request.setAttribute("depts", dd.get("workshop"));
        request.getRequestDispatcher("/view/plan/update.jsp").forward(request, response);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        PlanDBContext pd = new PlanDBContext();
        
        int planid = Integer.parseInt(request.getParameter("planid"));
        String startd = request.getParameter("startd");
        String endd = request.getParameter("endd");
        int department = Integer.parseInt(request.getParameter("department"));
        Department d = new Department();
        d.setDid(department);

        Plan p = new Plan(planid, Date.valueOf(startd), Date.valueOf(endd), d);
        
        pd.update(p);
        response.sendRedirect("list");
    }

}
