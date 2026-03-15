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
                        rs.getString(7)
                );

                list.add(r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public static void main(String[] args) {
        RoomDAO dao = new RoomDAO();
        List<Room> list = dao.getAllRooms();
        for(Room r : list){
            System.out.println(r);
        }
    }
}