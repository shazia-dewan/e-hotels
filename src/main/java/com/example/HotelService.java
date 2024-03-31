package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class HotelService {
    public List<Hotel> getHotel() throws Exception {
        String sql = "SELECT * FROM Hotel";
        ConnectionDB db = new ConnectionDB();
        List<Hotel> hotels = new ArrayList<>();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Hotel hotel = new Hotel(

                        rs.getLong("hotelID"),
                        rs.getLong("hotelChainID"),
                        rs.getInt("num_rooms"),
                        rs.getString("email"),
                        rs.getDouble("star_rating"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province"),
                        rs.getString("PostalCode"),
                        rs.getString("phoneNumber")
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
        String sql = "INSERT INTO Hotel (hotelID, hotelChainID,num_rooms,email,star_rating,street,city,province,PostalCode,phoneNumber) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
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
            stmt.setString(10,hotel.getPhoneNumber());
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
        StringBuilder sql = new StringBuilder("UPDATE Hotel SET ");
        List<Object> parameters = new ArrayList<>();
        // SQL query to update hotel

        // Database connection object
        ConnectionDB db = new ConnectionDB();

        // Try connecting to the database and executing the query, catch any exceptions
        try (Connection con = db.getConnection()) {


            if (!hotel.getStreet().isEmpty()) {
                sql.append("street=?, ");
                parameters.add(hotel.getStreet());
            }
            if (!hotel.getEmail().isEmpty()) {
                sql.append("email=?, ");
                parameters.add(hotel.getEmail());
            }
            if (!hotel.getCity().isEmpty()) {
                sql.append("city=?, ");
                parameters.add(hotel.getCity());
            }
            if (!hotel.getProvince().isEmpty()) {
                sql.append("province=?, ");
                parameters.add(hotel.getProvince());
            }
            if (!hotel.getPostal_code().isEmpty()) {
                sql.append("PostalCode=?, ");
                parameters.add(hotel.getPostal_code());
            }
            if (!hotel.getPhoneNumber().isEmpty()) {
                sql.append("phoneNumber=?, ");
                parameters.add(hotel.getPhoneNumber());
            }



            sql.append("hotelChainID=?, ");
            parameters.add(hotel.getHotelChainID());

            sql.append("star_rating=?, ");
            parameters.add(hotel.getStar_rating());
            sql.append("num_rooms=?, ");
            parameters.add(hotel.getNum_rooms());



            // Remove the last comma and space
            sql.setLength(sql.length() - 2);

            // Add the WHERE clause
            sql.append(" WHERE hotelID=?");

            // Add the employee ID parameter
            parameters.add(hotel.getHotel_ID());

            // Prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql.toString());

            // Set parameter values
            int index = 1;
            for (Object parameter : parameters) {
                stmt.setObject(index++, parameter);
            }

            // Execute the update
            int rowsAffected = stmt.executeUpdate();

            // Close resources
            stmt.close();
            con.close();
            db.close();

            return rowsAffected > 0;

        } catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating hotel: " + e.getMessage());
        }
    }

    public boolean deleteHotel(long hotelID) throws Exception {
        String sql = "DELETE FROM Hotel WHERE hotelID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, hotelID);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        }catch(Exception e){
            throw new Exception("Error while deleting hotel: " + e.getMessage());
        }
    }

    public Hotel getHotelFromID(long hotelID) throws Exception {
        String sql = "SELECT * FROM Hotel WHERE hotelID=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setLong(1, hotelID);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                Hotel hotel = new Hotel(
                        rs.getLong("hotelID"),
                        rs.getLong("hotelChainID"),
                        rs.getInt("num_rooms"),
                        rs.getString("email"),
                        rs.getDouble("star_rating"),
                        rs.getString("street"),
                        rs.getString("city"),
                        rs.getString("province"),
                        rs.getString("PostalCode"),
                        rs.getString("phoneNumber")
                );
                return hotel;
            }

            else {
                return null; // Or handle this case as you see fit
            }

        } catch (Exception e) {
            throw new Exception("Error while fetching hotel: " + e.getMessage());
        } finally {
            db.close(); // Ensure the database connection is closed
        }
    }
}
