package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.DBContext;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirm = request.getParameter("confirm");

        System.out.println("REGISTER CALLED"); // DEBUG

        // check confirm
        if (!password.equals(confirm)) {
            response.getWriter().println("Password không khớp!");
            return;
        }

        try {
            Connection conn = new DBContext().getConnection();

            String sql = "INSERT INTO Users (username, password, roleId, status) VALUES (?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setInt(3, 2); // USER
            ps.setInt(4, 1); // ACTIVE

            int rows = ps.executeUpdate();

            System.out.println("Insert rows: " + rows);

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.getWriter().println("Register thành công!");
    }
}