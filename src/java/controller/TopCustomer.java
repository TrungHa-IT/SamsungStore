/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAOOrders;
import dal.DAOUsers;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Users;

/**
 *
 * @author hatrung
 */
public class TopCustomer extends HttpServlet {
   
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
            out.println("<title>Servlet TopCustomer</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet TopCustomer at " + request.getContextPath () + "</h1>");
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
        //processRequest(request, response);
        DAOOrders dao = new DAOOrders();
        List<Integer> list = dao.getTop3User();
        int id1 = list.get(0);
        int id2 = list.get(1);
        int id3 = list.get(2);
        DAOUsers daouser = new DAOUsers();
        List<Integer> list2 = dao.getQuantityTop3User();
        int value1 = list2.get(0);
        int value2 = list2.get(1);
        int value3 = list2.get(2);
        String name1  = daouser.getUserByID(id1).getUsername();
        String name2  = daouser.getUserByID(id2).getUsername();
        String name3  = daouser.getUserByID(id3).getUsername();
        request.setAttribute("name1", name1);
        request.setAttribute("name2", name2);
        request.setAttribute("name3", name3);
        request.setAttribute("value1", value1);
        request.setAttribute("value2", value2);
        request.setAttribute("value3", value3);
        request.getRequestDispatcher("topuser.jsp").forward(request, response);
        
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
        processRequest(request, response);
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
