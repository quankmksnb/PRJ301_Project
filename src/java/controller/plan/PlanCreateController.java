/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.plan;

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
/**
 *
 * @author Admin
 */
public class PlanCreateController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        DepartmentDBContext dd = new DepartmentDBContext();
        ArrayList<Department> departments = dd.get("workshop");

        request.setAttribute("depts", departments);
        request.getRequestDispatcher("/view/plan/create.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
