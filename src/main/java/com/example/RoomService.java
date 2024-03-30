package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RoomService {

    /**
     * Method to get all rooms from the database
     *
     * @return List of rooms from the database
     * @throws Exception when trying to connect to the database or execute the query
     */

    public List<Room> getRooms() throws Exception {

        //SQL query to retrieve all rooms
        String sql= "SELECT * FROM Room";

        //connection object
        ConnectionDB db = new ConnectionDB();

        //data structure to keep all rooms retrieved from the database
        List<Room> rooms = new ArrayList<>();

        //try to connect to the database and catch any exceptions
        try(Connection con =db.getConnection()){

            //prepare sql statement
            PreparedStatement stmt = con.prepareStatement(sql);

            //get results from executing the query
            ResultSet rs = stmt.executeQuery();

            //iterate through the result set
            while (rs.next()){
                //create new room object
                Room room = new Room(
                        rs.getInt("room_number"),
                        rs.getInt("HotelID"),
                        rs.getInt("HotelChainID"),
                        rs.getBoolean("problems_water"),
                        rs.getBoolean("problems_electrical"),
                        rs.getBoolean("problems_furniture"),
                        rs.getString("problems_other"),
                        rs.getDouble("price"),
                        rs.getBoolean("amenities_tv"),
                        rs.getBoolean("amenities_wifi"),
                        rs.getBoolean("amenities_air_con"),
                        rs.getBoolean("amenities_fridge"),
                        rs.getBoolean("amenities_toiletries"),
                        rs.getBoolean("capacities_single"),
                        rs.getBoolean("capacities_double"),
                        rs.getInt("guest_capacity"),
                        rs.getBoolean("sea_view"),
                        rs.getBoolean("mountain_view"),
                        rs.getBoolean("extendable")
                );

                //append room in rooms list
                rooms.add(room);
            }

            //close result
            rs.close();
            //close statement
            stmt.close();
            con.close();
            //close database connection
            db.close();

            //return list of rooms
            return rooms;

        }catch (Exception e){
            //throw errors that occur
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to insert a room into the database
     *
     * @param room the employee object to be inserted
     * @throws Exception when trying to connect to the database or execute the query
     */

    public void insertRoom(Room room) throws Exception{

        //database connection object
        ConnectionDB db = new ConnectionDB();

        //SQL query to insert room
        String insertRoomSQL = "INSERT INTO Room (room_number, HotelID, HotelChainID, problems_water, problems_electrical, problems_furniture, problems_other, price, amenities_tv, amenities_wifi, amenities_air_con, amenities_fridge, amenities_toiletries, capacities_single, capacities_double, guest_capacity, sea_view, mountain_view, extendable" +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        //try to connect to the database and catch any exceptions
        try(Connection con = db.getConnection()){

            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRoomSQL);

            //set all parameters of the statement
            stmt.setInt(1, room.getRoomNumber());
            stmt.setInt(2, room.getHotelID());
            stmt.setInt(3, room.getHotelChainID());
            stmt.setBoolean(4, room.isProblemsWater());
            stmt.setBoolean(5, room.isProblemsElectrical());
            stmt.setBoolean(6, room.isProblemsFurniture());
            stmt.setString(7, room.getProblemsOther());
            stmt.setDouble(8, room.getPrice());
            stmt.setBoolean(9, room.isAmenitiesTv());
            stmt.setBoolean(10, room.isAmenitiesWifi());
            stmt.setBoolean(11, room.isAmenitiesAirCon());
            stmt.setBoolean(12, room.isAmenitiesFridge());
            stmt.setBoolean(13, room.isAmenitiesToiletries());
            stmt.setBoolean(14, room.isCapacitySingle());
            stmt.setBoolean(15, room.isCapacityDouble());
            stmt.setInt(16, room.getGuestCapacity());
            stmt.setBoolean(17, room.isSeaView());
            stmt.setBoolean(18, room.isMountainView());
            stmt.setBoolean(19, room.isExtendable());

            //execute the query
            stmt.executeUpdate();

            //close the statement
            stmt.close();
        }catch (Exception e){
            //throw error
            throw new Exception("Error while inserting room: " + e.getMessage());
        }

    }

    /**
     * Method to update a room in the database
     *
     * @param room the room object with updated information
     * @throws Exception when trying to connect to the database or execute the query
     */

    public void updateRoom(Room room) throws Exception{
        //database connection object
        ConnectionDB db = new ConnectionDB();

        //SQL query to insert room
        String updateRoomSQL = "UPDATE Room SET HotelID = ? ,HotelChainID = ?, problems_water = ?, problems_electrical = ?, " +
                "problems_furniture = ?, problems_other = ?, price = ?, amenities_tv = ?, amenities_wifi = ?," +
                "amenities_air_con = ?, amenities_fridge = ?, amenities_toiletries = ?, capacities_single = ?," +
                "capacities_double = ?, guest_capacity = ?, sea_view = ?, mountain_view = ?, extendable = ? " +
                "WHERE room_number = ?";

        //try to connect to database, catch any exceptions
        try(Connection con = db.getConnection()){
            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(updateRoomSQL);

            //set parameters for statement
            stmt.setInt(1, room.getHotelID());
            stmt.setInt(2, room.getHotelChainID());
            stmt.setBoolean(3, room.isProblemsWater());
            stmt.setBoolean(4, room.isProblemsElectrical());
            stmt.setBoolean(5, room.isProblemsFurniture());
            stmt.setString(6, room.getProblemsOther());
            stmt.setDouble(7, room.getPrice());
            stmt.setBoolean(8, room.isAmenitiesTv());
            stmt.setBoolean(9, room.isAmenitiesWifi());
            stmt.setBoolean(10, room.isAmenitiesAirCon());
            stmt.setBoolean(11, room.isAmenitiesFridge());
            stmt.setBoolean(12, room.isAmenitiesToiletries());
            stmt.setBoolean(13, room.isCapacitySingle());
            stmt.setBoolean(14, room.isCapacityDouble());
            stmt.setInt(15, room.getGuestCapacity());
            stmt.setBoolean(16, room.isSeaView());
            stmt.setBoolean(17, room.isMountainView());
            stmt.setBoolean(18, room.isExtendable());
            stmt.setInt(19, room.getRoomNumber());

            // Execute the query
            stmt.executeUpdate();

            // Close the statement
            stmt.close();
        }catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating room: " + e.getMessage());
        }
    }

    /**
     * Method to delete a room from the database by room number
     *
     * @param roomNumber the room_number of the room to be deleted
     * @return a string message indicating whether the room was successfully deleted
     * @throws Exception when trying to connect to the database or execute the query
     */

    public String deleteRoom(int roomNumber) throws Exception{
        Connection con = null;
        String message = "";

        //SQL query to insert room
        String deleteRoomSQL = "DELETE FROM Room WHERE room_number = ?";

        //database connection object
        ConnectionDB db = new ConnectionDB();

        //try to connect to database, catch any exceptions
        try{
            //get connection
            con = db.getConnection();

            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(deleteRoomSQL);

            //set room_number for statement
            stmt.setInt(1, roomNumber);

            //execute the query
            int rowsAffected = stmt.executeUpdate();

            // Close the statement
            stmt.close();

            // Check if any rows were affected (room deleted)
            if (rowsAffected > 0) {
                message = "Room with room_number " + roomNumber + " was successfully deleted!";
            } else {
                message = "Room with room_number " + roomNumber + " was not found!";
            }
        }catch(Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while deleting room: " + e.getMessage());
        } finally {
            // Close the connection
            if (con != null) con.close();
        }

        return message;

    }

    public static List<Room> searchRooms(String startDate, String endDate, Integer roomCapacity, String area, Integer hotelChainID, Integer category, Integer totalRooms, String priceRange) throws SQLException {
        List<Room> rooms = new ArrayList<>();

        StringBuilder sql = new StringBuilder("SELECT r.* FROM room r ");
        sql.append("INNER JOIN hotel h ON r.hotelID = h.hotelID WHERE 1=1 ");
        List<Object> parameters = new ArrayList<>();

        if (roomCapacity != null) {
            sql.append("AND r.guest_capacity >= ? ");
            parameters.add(roomCapacity);
        }

        if (area != null && !area.trim().isEmpty()) {
            sql.append("AND h.city LIKE ? ");
            parameters.add("%" + area + "%");
        }

        if (hotelChainID != null) {
            sql.append("AND r.hotelChainID = ? ");
            parameters.add(hotelChainID);
        }

        if (category != null) {
            sql.append("AND h.star_rating = ? ");
            parameters.add(category);
        }

        if (totalRooms != null) {
            sql.append("AND h.num_rooms >= ? ");
            parameters.add(totalRooms);
        }


        if (priceRange != null && !priceRange.trim().isEmpty()) {
            String[] priceBounds = priceRange.split("-");
            if (priceBounds.length == 2) {
                    sql.append("AND r.price BETWEEN ? AND ? ");
                parameters.add(Double.parseDouble(priceBounds[0]));
                parameters.add(Double.parseDouble(priceBounds[1]));
            }
        }

        // Additional condition to check for date conflicts
        if (startDate != null) {
            sql.append("AND NOT EXISTS (");
            sql.append("SELECT 1 FROM booking b ");
            sql.append("WHERE b.room_number = r.room_number ");
            sql.append("AND ?::date = b.bookingDate ");
            sql.append("UNION ");
            sql.append("SELECT 1 FROM renting rt ");
            sql.append("WHERE rt.room_number = r.room_number ");
            sql.append("AND ?::date = rt.rentingDate ");
            sql.append(")");
            parameters.add(startDate);
            parameters.add(startDate);
        }


        // Connection object from ConnectionDB
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection(); // Try to connect to the database
             PreparedStatement stmt = con.prepareStatement(sql.toString())) { // Prepare SQL statement

            // Setting the parameters for the PreparedStatement
            for (int i = 0; i < parameters.size(); i++) {
                stmt.setObject(i + 1, parameters.get(i));
            }

            // Execute the query
            try (ResultSet rs = stmt.executeQuery()) {
                // Iterate through the result set
                while (rs.next()) {
                    // Create new Room object based on the schema you have
                    Room room = new Room(
                            rs.getInt("room_number"),
                            rs.getInt("HotelID"),
                            rs.getInt("HotelChainID"),
                            rs.getBoolean("problems_water"),
                            rs.getBoolean("problems_electrical"),
                            rs.getBoolean("problems_furniture"),
                            rs.getString("problems_other"),
                            rs.getDouble("price"),
                            rs.getBoolean("amenities_tv"),
                            rs.getBoolean("amenities_wifi"),
                            rs.getBoolean("amenities_air_con"),
                            rs.getBoolean("amenities_fridge"),
                            rs.getBoolean("amenities_toiletries"),
                            rs.getBoolean("capacities_single"),
                            rs.getBoolean("capacities_double"),
                            rs.getInt("guest_capacity"),
                            rs.getBoolean("sea_view"),
                            rs.getBoolean("mountain_view"),
                            rs.getBoolean("extendable")
                            // Continue initializing with the rest of your columns
                    );

                    // Append room to the rooms list
                    rooms.add(room);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); // Proper exception handling goes here
        } finally {
            db.close();
        }

        // Return the list of rooms
        return rooms;
    }

}