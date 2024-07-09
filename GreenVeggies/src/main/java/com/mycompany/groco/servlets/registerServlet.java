package com.mycompany.groco.servlets;

import com.mycompany.groco.entities.User;
import com.mycompany.groco.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import org.hibernate.Session;
import org.hibernate.Transaction;

@MultipartConfig
public class registerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                
                String userName = request.getParameter("username");
                String userEmail = request.getParameter("email");
                String userMobile = request.getParameter("password");
                String password = request.getParameter("mobile");
                String userAddress = request.getParameter("address");
                Part part = request.getPart("picture");
                String fileName = part.getSubmittedFileName();
                
             
                //Validation
                if (userName.isEmpty()) {
                    out.println("Name is blank");
                    return;
                }

                //creating user object to store data;
                User user = new User(userName, userEmail, password, userMobile, fileName, userAddress, "Normal");

                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();
                int userId = (int) session.save(user);
                boolean bool=false;
                if(userId>0)bool=true;
                tx.commit();
                session.close();

//                To save image on server
                if (bool==true) {
                    String path= getServletContext().getRealPath("Image");
                    part.write(path+File.separator+"UserImage"+File.separator+fileName);
                    out.print(path);                    
                    
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Registration successful !! ");
                    response.sendRedirect("Registration.jsp");
                }else{
                    HttpSession httpSession = request.getSession();
                    httpSession.setAttribute("message", "Registration failed !! ");
                    
                    response.sendRedirect("Registration.jsp");
                }
                
            } catch (Exception e) {
                e.printStackTrace();
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
