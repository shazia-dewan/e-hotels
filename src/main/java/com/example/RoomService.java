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

    public boolean insertRoom(Room room) throws Exception{

        //database connection object
        ConnectionDB db = new ConnectionDB();

        String insertRoomSQL = "INSERT INTO Room (room_number, HotelID, HotelChainID, problems_water, problems_electrical, problems_furniture, problems_other, price, amenities_tv, amenities_wifi, amenities_air_con, amenities_fridge, amenities_toiletries, capacities_single, capacities_double, guest_capacity, sea_view, mountain_view, extendable)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


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

            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;

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

    public boolean updateRoom(Room room) throws Exception {
        StringBuilder sql = new StringBuilder("UPDATE Room SET ");
        List<Object> parameters = new ArrayList<>();
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {

            // Add conditions for non-empty fields
            if (room.getHotelID() != 0) {
                sql.append("HotelID=?, ");
                parameters.add(room.getHotelID());
            }
            if (room.getHotelChainID() != 0) {
                sql.append("HotelChainID=?, ");
                parameters.add(room.getHotelChainID());
            }

                sql.append("problems_water=?, ");
                parameters.add(room.isProblemsWater());


                sql.append("problems_electrical=?, ");
                parameters.add(room.isProblemsElectrical());


                sql.append("problems_furniture=?, ");
                parameters.add(room.isProblemsFurniture());

            if (!room.getProblemsOther().isEmpty()) {
                sql.append("problems_other=?, ");
                parameters.add(room.getProblemsOther());
            }
            if (room.getPrice() != 0.0) {
                sql.append("price=?, ");
                parameters.add(room.getPrice());
            }

                sql.append("amenities_tv=?, ");
                parameters.add(room.isAmenitiesTv());

            sql.append("amenities_wifi=?, ");
            parameters.add(room.isAmenitiesWifi());

            sql.append("amenities_air_con=?, ");
            parameters.add(room.isAmenitiesAirCon());

            sql.append("amenities_fridge=?, ");
            parameters.add(room.isAmenitiesFridge());

            sql.append("amenities_toiletries=?, ");
            parameters.add(room.isAmenitiesToiletries());

            sql.append("capacities_single=?, ");
            parameters.add(room.isCapacitySingle());

            sql.append("capacities_double=?, ");
            parameters.add(room.isCapacityDouble());


            if (room.getGuestCapacity() != 0) {
                sql.append("guest_capacity=?, ");
                parameters.add(room.getGuestCapacity());
            }

            sql.append("sea_view=?, ");
            parameters.add(room.isSeaView());

            sql.append("mountain_view=?, ");
            parameters.add(room.isMountainView());

            sql.append("extendable=?, ");
            parameters.add(room.isExtendable());

            // Remove the last comma and space
            sql.setLength(sql.length() - 2);

            // Add the WHERE clause
            sql.append(" WHERE room_number=?");

            // Add the room number parameter
            parameters.add(room.getRoomNumber());

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
            throw new Exception("Error while updating room: " + e.getMessage());
        }
    }



    /**
     * Method to delete a room from the database by room number
     *
     * @param room_number the room_number of the room to be deleted
     * @return a string message indicating whether the room was successfully deleted
     * @throws Exception when trying to connect to the database or execute the query
     */

    public boolean deleteRoom(int room_number) throws Exception{
        String sql = "DELETE FROM Room WHERE room_number=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection()) {
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setLong(1, room_number);
            int rowsAffected = stmt.executeUpdate();
            stmt.close();
            con.close();
            db.close();
            return rowsAffected > 0;
        } catch (Exception e) {
            throw new Exception("Error while deleting room: " + e.getMessage());
        }

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

    public Room getRoomFromID(int roomNumber) throws Exception {
        String sql = "SELECT * FROM Room WHERE room_number=?";
        ConnectionDB db = new ConnectionDB();

        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setInt(1, roomNumber);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
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
                return room;
            } else {
                return null; // Or handle this case as you see fit
            }

        } catch (Exception e) {
            throw new Exception("Error while fetching room: " + e.getMessage());
        } finally {
            db.close(); // Ensure the database connection is closed
        }
    }


}