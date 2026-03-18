/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Model.User;
import java.sql.*;
import java.util.*;
import util.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO extends DBContext {

    public List<User> getAllUsers(){

        List<User> list = new ArrayList<>();

        String sql = "SELECT * FROM Users";

        try{

            PreparedStatement ps = getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                User u = new User(
                        rs.getInt("userId"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("roleId"),
                        rs.getBoolean("status")
                );

                list.add(u);
            }

        }catch(Exception e){
            e.printStackTrace();
        }

        return list;
    }

    public void lockUser(int id){

        String sql = "UPDATE Users SET status = 0 WHERE userId=?";

        try{
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public void unlockUser(int id){

        String sql = "UPDATE Users SET status = 1 WHERE userId=?";

        try{
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public void resetPassword(int id){

        String sql = "UPDATE Users SET password='123456' WHERE userId=?";

        try{
            PreparedStatement ps = getConnection().prepareStatement(sql);
            ps.setInt(1,id);
            ps.executeUpdate();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
    
    public User login(String username,String password){

    String sql="SELECT * FROM Users WHERE username=? AND password=?";

    try{

        PreparedStatement ps=getConnection().prepareStatement(sql);

        ps.setString(1,username);
        ps.setString(2,password);

        ResultSet rs=ps.executeQuery();

        if(rs.next()){

            return new User(
                    rs.getInt("userId"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("roleId"),
                    rs.getBoolean("status")
            );

        }

    }catch(Exception e){
        e.printStackTrace();
    }

    return null;
  }

}