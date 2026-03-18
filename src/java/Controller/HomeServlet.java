package Controller;

import DAO.RoomDAO;
import Model.Room;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // 🔥 Lấy status từ URL
            String status = request.getParameter("status");

            RoomDAO dao = new RoomDAO();
            List<Room> roomList;

            // 🔥 Xử lý filter
            if (status == null || status.equals("all")) {
                roomList = dao.getAllRooms();
            } else {
                roomList = dao.getRoomsByStatus(status);
            }

            System.out.println("Total rooms: " + roomList.size());

            request.setAttribute("listRoom", roomList);

            request.getRequestDispatcher("index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}