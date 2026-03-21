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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        // Chuyển sang trang addUser.jsp để nhập liệu
        if (action != null && action.equals("viewAdd")) {
            request.getRequestDispatcher("addUser.jsp").forward(request, response);
        } 
        else {
            UserDAO dao = new UserDAO();
            List<User> list = dao.getAllUsers();
            request.setAttribute("users", list);
            request.getRequestDispatcher("adminUser.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        UserDAO dao = new UserDAO();

        // Lấy ID để xử lý các chức năng xóa/khóa
        String idRaw = request.getParameter("id");
        int id = 0;
        if (idRaw != null && !idRaw.isEmpty()) {
            try {
                id = Integer.parseInt(idRaw);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        if (action != null) {
            switch (action) {
                case "lock":
                    dao.lockUser(id);
                    break;
                case "unlock":
                    dao.unlockUser(id);
                    break;
                case "reset":
                    dao.resetPassword(id);
                    break;
                case "delete":
                    dao.deleteUser(id);
                    break;
                case "add":
                    // 1. Lấy thông tin từ form addUser.jsp
                    String u = request.getParameter("username");
                    String p = request.getParameter("password");
                    
                    // 2. Lưu vào Database thông qua DAO
                    dao.createUser(u, p);

                    // 3. Thiết lập thông báo thành công
                    request.setAttribute("message", "Tạo tài khoản thành công! Vui lòng đăng nhập.");
                    
                    // 4. Chuyển hướng về trang login.jsp bằng forward để giữ lại thông báo
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                    return; // Kết thúc để không chạy xuống redirect ở dưới
            }
        }
// Mặc định quay lại trang danh sách người dùng cho các tác vụ admin khác
        response.sendRedirect("adminUser");
    }
}