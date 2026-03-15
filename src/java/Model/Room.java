/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author Admin
 */

public class Room {

    private int roomId;
    private String roomCode;
    private double price;
    private double area;
    private int maxPeople;
    private String status;
    private String image;
    private String description;
    
    public Room() {
    }

    public Room(int roomId, String roomCode, double price, double area, int maxPeople, String status, String image, String description) {
        this.roomId = roomId;
        this.roomCode = roomCode;
        this.price = price;
        this.area = area;
        this.maxPeople = maxPeople;
        this.status = status;
        this.image = image;
        this.description = description;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getRoomId() { return roomId; }
    public String getRoomCode() { return roomCode; }
    public double getPrice() { return price; }

    @Override
    public String toString() {
        return "Room{" + "roomId=" + roomId + ", roomCode=" + roomCode + ", price=" + price + ", area=" + area + ", maxPeople=" + maxPeople + ", status=" + status + '}';
    }
    public double getArea() { return area; }
    public int getMaxPeople() { return maxPeople; }
    public String getStatus() { return status; }

    public void setRoomId(int roomId) { this.roomId = roomId; }
    public void setRoomCode(String roomCode) { this.roomCode = roomCode; }
    public void setPrice(double price) { this.price = price; }
    public void setArea(double area) { this.area = area; }
    public void setMaxPeople(int maxPeople) { this.maxPeople = maxPeople; }
    public void setStatus(String status) { this.status = status; }
}
