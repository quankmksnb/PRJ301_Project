/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.employee;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dal.EmployeeDBContext;
import java.util.ArrayList;
import models.Employee;
import java.util.List;

/**
 *
 * @author Admin
 */
public class EmployeeListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmployeeDBContext ed = new EmployeeDBContext();
        List<Employee> listEmp = ed.list();
        
        request.setAttribute("listEmp", listEmp);
        request.getRequestDispatcher("/view/employee/list.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
