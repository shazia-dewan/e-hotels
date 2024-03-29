package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RentingArchiveService {

    /**
     * Method to retrieve all renting archives from the database
     *
     * @return List of rentingArchive objects
     * @throws Exception if an error occurs while accessing the database
     */
    public List<RentingArchive> getAllRentingArchives() throws Exception {
        // Initialize list to hold renting archives
        List<RentingArchive> rentingArchives = new ArrayList<>();

        // SQL query to retrieve all renting archives
        String sql = "SELECT * FROM RentingArchive";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // Iterate through result set and create rentingArchive objects
            while (rs.next()) {
                long rentingId = rs.getLong("renting_ID");
                Date rentingDate = rs.getDate("renting_date");
                String customerFirstName = rs.getString("Customer_first_name");
                String customerMiddleName = rs.getString("Customer_middle_name");
                String customerLastName = rs.getString("Customer_last_name");
                int roomNumber = rs.getInt("Room_number");
                int hotelId = rs.getInt("hotelID");
                int hotelChainId = rs.getInt("hotelChainID");

                // Create rentingArchive object
                RentingArchive rentingArchive = new RentingArchive(rentingId, rentingDate,
                        customerFirstName, customerMiddleName, customerLastName,
                        roomNumber, hotelId, hotelChainId);

                // Add rentingArchive to list
                rentingArchives.add(rentingArchive);
            }
        } // Automatically closes resources

        return rentingArchives;
    }

    //insert, delete, update operations
    /**
     * Method to insert a new renting archive into the database
     *
     * @param rentingArchive The renting archive to be inserted
     * @throws Exception if an error occurs while accessing the database
     */
    public void insertRentingArchive(RentingArchive rentingArchive) throws Exception {
        // SQL query to insert a new renting archive
        String sql = "INSERT INTO RentingArchive (renting_ID, renting_date, Customer_first_name, " +
                "Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setLong(1, rentingArchive.getRentingId());
            stmt.setDate(2, new java.sql.Date(rentingArchive.getRentingDate().getTime()));
            stmt.setString(3, rentingArchive.getCustomerFirstName());
            stmt.setString(4, rentingArchive.getCustomerMiddleName());
            stmt.setString(5, rentingArchive.getCustomerLastName());
            stmt.setInt(6, rentingArchive.getRoomNumber());
            stmt.setInt(7, rentingArchive.getHotelId());
            stmt.setInt(8, rentingArchive.getHotelChainId());

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }

    /**
     * Method to delete a renting archive from the database by renting ID
     *
     * @param rentingId The ID of the renting archive to be deleted
     * @throws Exception if an error occurs while accessing the database
     */
    public void deleteRentingArchive(long rentingId) throws Exception {
        // SQL query to delete a renting archive by ID
        String sql = "DELETE FROM RentingArchive WHERE renting_ID = ?";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the value for the prepared statement
            stmt.setLong(1, rentingId);

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }

    /**
     * Method to update a renting archive in the database
     *
     * @param rentingArchive The renting archive object containing updated information
     * @throws Exception if an error occurs while accessing the database
     */
    public void updateRentingArchive(RentingArchive rentingArchive) throws Exception {
        // SQL query to update a renting archive
        String sql = "UPDATE RentingArchive SET renting_date = ?, Customer_first_name = ?, " +
                "Customer_middle_name = ?, Customer_last_name = ?, Room_number = ?, " +
                "hotelID = ?, hotelChainID = ? WHERE renting_ID = ?";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setDate(1, new java.sql.Date(rentingArchive.getRentingDate().getTime()));
            stmt.setString(2, rentingArchive.getCustomerFirstName());
            stmt.setString(3, rentingArchive.getCustomerMiddleName());
            stmt.setString(4, rentingArchive.getCustomerLastName());
            stmt.setInt(5, rentingArchive.getRoomNumber());
            stmt.setInt(6, rentingArchive.getHotelId());
            stmt.setInt(7, rentingArchive.getHotelChainId());
            stmt.setLong(8, rentingArchive.getRentingId());

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }


}
