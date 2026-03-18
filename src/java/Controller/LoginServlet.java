/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.UserDAO;
import Model.User;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import java.io.IOException;

@WebServlet("/login")

public class LoginServlet extends HttpServlet{

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();

        User user = dao.login(username,password);

        if(user != null){

            HttpSession session = request.getSession();
            session.setAttribute("user", user);

            // kiểm tra role
            if(user.getRoleId() == 1){

                response.sendRedirect("adminDashboard.jsp");

            }else{

                response.sendRedirect("home");

            }

        }else{

            request.setAttribute("error","Sai tài khoản hoặc mật khẩu");
            request.getRequestDispatcher("login.jsp").forward(request,response);

        }

    }

}
