package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.DBContext;

@WebServlet("/DeleteUserServlet")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idRaw = request.getParameter("id");

        try {
            int id = Integer.parseInt(idRaw);

            HttpSession session = request.getSession();

            //  Lấy id user đang đăng nhập
            Integer currentUserId = (Integer) session.getAttribute("userId");

            Connection conn = new DBContext().getConnection();

            // CHẶN XÓA CHÍNH MÌNH (CÁCH XỊN - dùng ID)
            if (currentUserId != null && id == currentUserId) {
                response.getWriter().println("Không thể xóa chính mình!");
                return;
            }

            // ✅ XÓA USER
            String sql = "DELETE FROM users WHERE id = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        // reload lại trang
        response.sendRedirect("adminUser.jsp");
    }
}