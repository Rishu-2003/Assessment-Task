/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.groco.servlets;

import com.mycompany.groco.Dao.CategoryDao;
import com.mycompany.groco.Dao.ProductDao;
import com.mycompany.groco.entities.Category;
import com.mycompany.groco.entities.Product;
import com.mycompany.groco.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

/**
 *
 * @author rishu
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
     
            String op = request.getParameter("operation");
            HttpSession httpSession = request.getSession();
//            Add category on database

            if (op.trim().equals("addcategory")) {
                String title = request.getParameter("catTitle");
                String description = request.getParameter("catDesc");

                Category category = new Category();
                category.setCategory_Title(title);
                category.setCategory_desc(description);

                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);

                httpSession.setAttribute("message", "One category has been added");
                response.sendRedirect("Admin.jsp");

            } else if (op.trim().equals("addproduct")) {
//                Add product on database
                String pName = request.getParameter("pName");
                String vName = request.getParameter("vName");
                String vAddress = request.getParameter("vAddress");
                String pDesc = request.getParameter("pDesc");
                float pPrice = Float.parseFloat(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                float pQuantity = Float.parseFloat(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                
                Part part = request.getPart("pPic");
                String fileName= part.getSubmittedFileName();
                String path= getServletContext().getRealPath("Image");
                

                Product p = new Product();
                p.setProductName(pName);
                p.setVendorName(vName);
                p.setVendorName(vAddress);
                p.setProductDesc(pDesc);
                p.setPrice(pPrice);
                p.setDiscount(pDiscount);
                p.setQuantity(pQuantity);
                p.setProductPic(fileName);

                //get category by id
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);

                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                boolean bool=pdao.saveProduct(p);

                if(bool==true){
                    
                    part.write(path+File.separator+"Products"+File.separator+fileName);
                    httpSession.setAttribute("message", "One product has been added");
                    response.sendRedirect("Admin.jsp");
                    return;
                }
                else{ 
                    httpSession.setAttribute("message", "Failed");
                    response.sendRedirect("Admin.jsp");
                    return;
                }

                
            }

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
        processRequest(request, response);
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
