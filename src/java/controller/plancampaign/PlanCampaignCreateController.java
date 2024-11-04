/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.plancampaign;

import controller.accesscontroll.BaseRBACController;
import dal.PlanCampaignDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Plan;
import models.PlanCampaign;
import models.Product;
import models.User;

/**
 *
 * @author Admin
 */
public class PlanCampaignCreateController extends BaseRBACController {
    @Override
    protected void doAuthorizedGet(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        String plidStr = request.getParameter("plid");
        if (plidStr == null || plidStr.isEmpty()) {
            response.sendRedirect("../plans/list");
            return;
        }

        int plid = Integer.parseInt(plidStr);

        ProductDBContext pd = new ProductDBContext();
        PlanCampaignDBContext pcd = new PlanCampaignDBContext();

        List<Product> proList = pd.list();   // lấy hết product trong db

        List<PlanCampaign> existPlanC = pcd.listByPlanId(plid);     // lấy plancampaign theo plan id nếu đã tồn tại

        List<Product> availableProducts = new ArrayList<>();        // list lấy ra các product còn lại chưa được add vào plan
        for (Product product : proList) {
            boolean isExist = false;
            for (PlanCampaign pc : existPlanC) {
                if (pc.getProduct().getPid() == product.getPid()) {
                    isExist = true;
                    break;
                }
            }
            if (!isExist) {
                availableProducts.add(product);
            }
        }

        // Set các thuộc tính để truyền sang JSP
        request.setAttribute("availableProducts", availableProducts);
        request.setAttribute("plid", plid);
        request.getRequestDispatcher("/view/plancampaign/create.jsp").forward(request, response);

    }

    @Override
    protected void doAuthorizedPost(HttpServletRequest request, HttpServletResponse response, User loggeduser) throws ServletException, IOException {
        PlanCampaignDBContext pld = new PlanCampaignDBContext();
        List<PlanCampaign> pcList = new ArrayList<>();
        Plan plan = new Plan();
        Product product = new Product();

        String plid = request.getParameter("plid");
        String[] pid = request.getParameterValues("pid");
        for (String x : pid) {
            PlanCampaign pc = new PlanCampaign();
            if (!request.getParameter("quantity" + x).isEmpty() || !request.getParameter("estimatedEffort" + x).isEmpty()) {
                int quantity = Integer.parseInt(request.getParameter("quantity" + x));
                float effort = Float.parseFloat(request.getParameter("estimatedEffort" + x));
                plan.setPlid(Integer.parseInt(plid));
                product.setPid(Integer.parseInt(x));

                pc.setQuantity(quantity);
                pc.setEstimatedEffort(effort);
                pc.setPlan(plan);
                pc.setProduct(product);

                pcList.add(pc);
            }
        }
        pld.insertList(pcList);

        response.sendRedirect("../plancampaign/list?plid=" + Integer.parseInt(plid));
    }

}
