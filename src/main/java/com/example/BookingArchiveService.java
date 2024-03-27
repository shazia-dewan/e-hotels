package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookingArchiveService {

    /**
     * Method to retrieve all booking archives from the database
     *
     * @return List of com.example.BookingArchive objects
     * @throws Exception if an error occurs while accessing the database
     */
    public List<BookingArchive> getAllBookingArchives() throws Exception {
        // Initialize list to hold booking archives
        List<BookingArchive> bookingArchives = new ArrayList<>();

        // SQL query to retrieve all booking archives
        String sql = "SELECT * FROM com.example.BookingArchive";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // Iterate through result set and create com.example.BookingArchive objects
            while (rs.next()) {
                long bookingId = rs.getLong("booking_ID");
                Date bookingDate = rs.getDate("booking_date");
                String customerFirstName = rs.getString("Customer_first_name");
                String customerMiddleName = rs.getString("Customer_middle_name");
                String customerLastName = rs.getString("Customer_last_name");
                int roomNumber = rs.getInt("Room_number");
                int hotelId = rs.getInt("hotelID");
                int hotelChainId = rs.getInt("hotelChainID");

                // Create com.example.BookingArchive object
                BookingArchive bookingArchive = new BookingArchive(bookingId, bookingDate,
                        customerFirstName, customerMiddleName, customerLastName,
                        roomNumber, hotelId, hotelChainId);

                // Add com.example.BookingArchive to list
                bookingArchives.add(bookingArchive);
            }
        } // Automatically closes resources

        return bookingArchives;
    }

    //insert, delete, update operations
    /**
     * Method to insert a new booking archive into the database
     *
     * @param bookingArchive The booking archive to be inserted
     * @throws Exception if an error occurs while accessing the database
     */
    public void insertBookingArchive(BookingArchive bookingArchive) throws Exception {
        // SQL query to insert a new booking archive
        String sql = "INSERT INTO com.example.BookingArchive (booking_ID, booking_date, Customer_first_name, " +
                "Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setLong(1, bookingArchive.getBookingId());
            stmt.setDate(2, new java.sql.Date(bookingArchive.getBookingDate().getTime()));
            stmt.setString(3, bookingArchive.getCustomerFirstName());
            stmt.setString(4, bookingArchive.getCustomerMiddleName());
            stmt.setString(5, bookingArchive.getCustomerLastName());
            stmt.setInt(6, bookingArchive.getRoomNumber());
            stmt.setInt(7, bookingArchive.getHotelId());
            stmt.setInt(8, bookingArchive.getHotelChainId());

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }

    /**
     * Method to delete a booking archive from the database by booking ID
     *
     * @param bookingId The ID of the booking archive to be deleted
     * @throws Exception if an error occurs while accessing the database
     */
    public void deleteBookingArchive(long bookingId) throws Exception {
        // SQL query to delete a booking archive by ID
        String sql = "DELETE FROM com.example.BookingArchive WHERE booking_ID = ?";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set the value for the prepared statement
            stmt.setLong(1, bookingId);

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }

    /**
     * Method to update a booking archive in the database
     *
     * @param bookingArchive The booking archive object containing updated information
     * @throws Exception if an error occurs while accessing the database
     */
    public void updateBookingArchive(BookingArchive bookingArchive) throws Exception {

        // SQL query to update a booking archive
        String sql = "UPDATE com.example.BookingArchive SET booking_date = ?, Customer_first_name = ?, " +
                "Customer_middle_name = ?, Customer_last_name = ?, Room_number = ?, " +
                "hotelID = ?, hotelChainID = ? WHERE booking_ID = ?";

        // Database connection
        ConnectionDB db = new ConnectionDB();

        // Try-with-resources to automatically close resources
        try (Connection con = db.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            // Set values for the prepared statement
            stmt.setDate(1, new java.sql.Date(bookingArchive.getBookingDate().getTime()));
            stmt.setString(2, bookingArchive.getCustomerFirstName());
            stmt.setString(3, bookingArchive.getCustomerMiddleName());
            stmt.setString(4, bookingArchive.getCustomerLastName());
            stmt.setInt(5, bookingArchive.getRoomNumber());
            stmt.setInt(6, bookingArchive.getHotelId());
            stmt.setInt(7, bookingArchive.getHotelChainId());
            stmt.setLong(8, bookingArchive.getBookingId());

            // Execute the query
            stmt.executeUpdate();
        } // Automatically closes resources
    }


}

