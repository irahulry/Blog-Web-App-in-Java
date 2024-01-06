/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.blog.servlets;

import com.blog.dao.UserDao;
import com.blog.entities.User;
import com.blog.helper.ConnectionProvider;
import com.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Lenovo
 */

@WebServlet(name = "EditServlet", urlPatterns = {"/EditServlet"})
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
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
           
            
            
//            fetch all data


//            String id = request.getParameter("id");
            String email = request.getParameter("email");
            String message = "MESSAGE";
            String name = request.getParameter("name");
            String password = request.getParameter("password");
            String about = request.getParameter("about");
            Part part = request.getPart("file");
            String fileName = part.getSubmittedFileName();
            
//            out.println("ID is : "+id);
//            System.out.println(email);
//            out.println(email);
//            out.println(name);
//            out.println(password);
//            out.println(about);
//            out.println(fileName);
            
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String oldFile= user.getProfile();
            user.setProfile(fileName);
            
            
//            out.println("d"+email+"d");
//            if(email!=""){
//                response.sendRedirect("profile.jsp");
//            }
//            if(email==" "){
//                response.sendRedirect("profile.jsp");
//            }
//            
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            
            boolean ans = userDao.updateUser(user);
            
            System.out.println(" BOOLEAN INFO IS "+ans);
            
           
                
                String path = request.getRealPath("/")+"images"+File.separator+user.getProfile();
                String oldPath = request.getRealPath("/")+"images"+File.separator+oldFile;
                
                
                if(!oldFile.equals("default.png")){
                    Helper.deleteFile(oldPath);
                }
                
                
                if(Helper.saveFile(part.getInputStream(),path)){
                    message = "<div class=\"alert alert-success\" role=\"alert\">\n" +
                                    " Your Profile is Updated Succesfully! " +
                                 "</div>";
 
                    
                }
                else{
                    message = "<div class=\"alert alert-danger\" role=\"alert\">\n" +
                                    " Something went wrong! " +
                                 "</div>";
                }
                
            
            s.setAttribute("message", message);
            response.sendRedirect("profile.jsp");
            
            
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
//            throws ServletException, IOException {
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
