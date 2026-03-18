/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.User;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminUser")

public class AdminUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO dao = new UserDAO();

        List<User> list = dao.getAllUsers();

        request.setAttribute("users", list);

        request.getRequestDispatcher("adminUser.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();

        if(action.equals("lock")){
            dao.lockUser(id);
        }

        if(action.equals("unlock")){
            dao.unlockUser(id);
        }

        if(action.equals("reset")){
            dao.resetPassword(id);
        }

        response.sendRedirect("adminUser");

    }

}