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
import java.util.ArrayList;
import models.Department;
import models.Plan;
import java.sql.*;
import models.User;
/**
 *
 * @author Admin
 */
public class PlanCreateController extends BaseRBACController {


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    @Override
    protected void doAuthorizedGet(HttpServletRequest req, HttpServletResponse resp, User loggeduser) throws ServletException, IOException {
        DepartmentDBContext dd = new DepartmentDBContext();
        ArrayList<Department> departments = dd.get("workshop");

        req.setAttribute("depts", departments);
        req.getRequestDispatcher("/view/plan/create.jsp").forward(req, resp);
    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        Plan p = new Plan();
        p.setStartd(Date.valueOf(request.getParameter("startd")));
        p.setEndd(Date.valueOf(request.getParameter("endd")));
        
        Department d = new Department();
        d.setDid(Integer.parseInt(request.getParameter("department")));
        p.setDepartment(d);
        
        PlanDBContext pd = new PlanDBContext();
        
        pd.insert(p);
        
        response.sendRedirect("../plans/list");
    }

}
