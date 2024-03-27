package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {
    public List<Hotel> getHotel() throws Exception {
        String sql = "SELECT * FROM com.example.Hotel";
        ConnectionDB db = new ConnectionDB();
        List<Hotel> hotels = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Hotel hotel = new Hotel(

                        rs.getLong("hotel_ID"),
                        rs.getLong("hotelChainID"),
                        rs.getInt("num_rooms"),
                        rs.getString("email"),
                        rs.getDouble("star_rating"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province"),
                        rs.getString("postal_code"),
                        rs.getInt("phoneNumber")
                );
                hotels.add(hotel);
            }

            rs.close();
            stmt.close();
            con.close();
            db.close();

            return hotels;
        } catch (Exception e) {
            throw new Exception("Error while retrieving hotels: " + e.getMessage());
        }
    }

    public boolean insertHotel(Hotel hotel) throws Exception {
        String sql = "INSERT INTO com.example.Hotel (hotel_ID, hotelChainID,num_rooms,email,star_rating,street,city,province,postal_code,phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotel.getHotel_ID());
            stmt.setLong(2, hotel.getHotelChainID());
            stmt.setInt(3, hotel.getNum_rooms());
            stmt.setString(4, hotel.getEmail());
            stmt.setDouble(5, hotel.getStar_rating());
            stmt.setString(6, hotel.getStreet());
            stmt.setString(7, hotel.getCity());
            stmt.setString(8, hotel.getProvince());
            stmt.setString(9, hotel.getPostal_code());
            stmt.setInt(10,hotel.getPhoneNumber());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while inserting hotel: " + e.getMessage());
        }
    }
    public boolean updateHotel(Hotel hotel) throws Exception {
        String sql = "UPDATE com.example.Hotel SET hotel_ID=?, hotelChainID=? ,num_rooms=?,email=?,star_rating=?,street=?,city=?,province=?,postal_code=?,phoneNumber=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotel.getHotel_ID());
            stmt.setLong(2, hotel.getHotelChainID());
            stmt.setInt(3, hotel.getNum_rooms());
            stmt.setString(4, hotel.getEmail());
            stmt.setDouble(5, hotel.getStar_rating());
            stmt.setString(6, hotel.getStreet());
            stmt.setString(7, hotel.getCity());
            stmt.setString(8, hotel.getProvince());
            stmt.setString(9, hotel.getPostal_code());
            stmt.setInt(10,hotel.getPhoneNumber());
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while updating hotel: " + e.getMessage());
        }
    }

    public boolean deleteHotel(long hotelId) throws Exception {
        String sql = "DELETE FROM com.example.Hotel WHERE hotel_ID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotelId);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        }catch(Exception e){
            throw new Exception("Error while deleting hotel: " + e.getMessage());
        }
    }
}
