/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.plancampaign;

import dal.PlanCampaignDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.PlanCampaign;

/**
 *
 * @author Admin
 */
public class PlanCampaignUpdateController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<title>Servlet PlanCampaignUpdateController</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PlanCampaignUpdateController at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int canid = Integer.parseInt(request.getParameter("canid"));
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();
        
        PlanCampaign oldPC = pcd.get(canid);
        request.setAttribute("oldPC", oldPC);
        request.getRequestDispatcher("/view/plancampaign/update.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
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

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
