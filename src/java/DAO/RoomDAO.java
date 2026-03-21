/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author Admin
 */



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import Model.Room;
import util.DBContext;

public class RoomDAO {
    

    public List<Room> getAllRooms() {

        List<Room> list = new ArrayList<>();

        String sql = "SELECT * FROM Rooms";

        try {

            DBContext db = new DBContext();
            Connection conn = db.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Room r = new Room(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getDouble(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public List<Room> getRoomsByStatus(String status) {

    List<Room> list = new ArrayList<>();

    String sql = "SELECT * FROM Rooms WHERE status = ?";

    try {

        DBContext db = new DBContext();
        Connection conn = db.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        // 🔥 convert từ EN → VI
        if (status.equals("available")) {
            ps.setString(1, "Còn trống");
        } else if (status.equals("occupied")) {
            ps.setString(1, "Đã thuê");
        }

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Room r = new Room(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getDouble(3),
                    rs.getDouble(4),
                    rs.getInt(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8)
            );
            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
    
    public boolean updateRoomStatus(int roomId, String status) {
    String sql = "UPDATE Rooms SET status = ? WHERE roomId = ?";

    try {
        DBContext db = new DBContext();
        Connection conn = db.getConnection();
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setString(1, status);
        ps.setInt(2, roomId);

        int rows = ps.executeUpdate();
        return rows > 0;

    } catch (Exception e) {
        e.printStackTrace();
    }

    return false;
}
    
    public Room getRoomById(int id) {

    String sql = "SELECT * FROM Rooms WHERE roomId = ?";

    try {

        DBContext db = new DBContext();
        Connection conn = db.getConnection();

        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            Room r = new Room(
                    rs.getInt(1),
                    rs.getString(2),
                    rs.getDouble(3),
                    rs.getDouble(4),
                    rs.getInt(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8)
            );

            return r;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return null;
}
        public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();

        Room r = dao.getRoomById(1);

        System.out.println(r);
    }
        
}