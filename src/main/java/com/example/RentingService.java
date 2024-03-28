package com.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class RentingService {

    /**
     * Method to get all rentings from the database
     *
     * @return List of rentings from the database
     * @throws Exception when trying to connect to the database or execute the query
     */

    public List<Renting> getRentings() throws Exception {

        //SQL query to retrieve all rentings
        String sql= "SELECT * FROM Renting";

        //connection object
        ConnectionDB db = new ConnectionDB();

        //data structure to keep all rentings retrieved from the database
        List<Renting> rentings = new ArrayList<>();

        //try to connect to the database and catch any exceptions
        try(Connection con =db.getConnection()){

            //prepare sql statement
            PreparedStatement stmt = con.prepareStatement(sql);

            //get results from executing the query
            ResultSet rs = stmt.executeQuery();

            //iterate through the result set
            while (rs.next()){
                //create new renting object
                Renting renting = new Renting(
                        rs.getLong("renting_ID"),
                        rs.getDate("renting_date"),
                        rs.getLong("customer_ID"),
                        rs.getInt("Room_number"),
                        rs.getInt("hotelID"),
                        rs.getInt("hotelChainID"),
                        rs.getInt("Payment")
                );

                //append renting to rentings list
                rentings.add(renting);
            }

            //close result
            rs.close();
            //close statement
            stmt.close();
            con.close();
            //close database connection
            db.close();

            //return list of rentings
            return rentings;

        }catch (Exception e){
            //throw errors that occur
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to insert a new renting into the database
     *
     * @param renting The renting to be inserted
     * @throws Exception if an error occurs while accessing the database
     */
    public void insertRenting(Renting renting) throws Exception{

        //database connection object
        ConnectionDB db = new ConnectionDB();

        // SQL query to insert a new renting
        String insertRentingSQL = "INSERT INTO Renting (renting_ID, renting_date, customer_ID, " +
                "Room_number, hotelID, hotelChainID, Payment) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        //try to connect to the database and catch any exceptions
        try(Connection con = db.getConnection()){

            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertRentingSQL);

            //set values for the prepared statement
            stmt.setLong(1, renting.getRentingId());
            stmt.setDate(2, new java.sql.Date(renting.getRentingDate().getTime()));
            stmt.setLong(3, renting.getCustomerID());
            stmt.setInt(4, renting.getRoomNumber());
            stmt.setInt(5, renting.getHotelId());
            stmt.setInt(6, renting.getHotelChainId());
            stmt.setInt(7,renting.getPayment());

            //execute the query
            stmt.executeUpdate();

            //close the statement
            stmt.close();
        }catch (Exception e){
            //throw error
            throw new Exception("Error while inserting renting: " + e.getMessage());
        }

    }

    /**
     * Method to update a renting in the database
     *
     * @param renting The renting object containing updated information
     * @throws Exception if an error occurs while accessing the database
     */

    public void updateRenting(Renting renting) throws Exception{
        //database connection object
        ConnectionDB db = new ConnectionDB();

        // SQL query to update a renting
        String updateRentingSQL = "UPDATE Renting SET renting_date = ?, customer_ID = ?, " +
                "Room_number = ?, " +
                "hotelID = ?, hotelChainID = ?, Payment = ? WHERE renting_ID = ?";

        //try to connect to database, catch any exceptions
        try(Connection con = db.getConnection()){
            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(updateRentingSQL);

            //set parameters for statement
            stmt.setDate(1, new java.sql.Date(renting.getRentingDate().getTime()));
            stmt.setLong(2, renting.getCustomerID());
            stmt.setInt(3, renting.getRoomNumber());
            stmt.setInt(4, renting.getHotelId());
            stmt.setInt(5, renting.getHotelChainId());
            stmt.setInt(6, renting.getPayment());
            stmt.setLong(7, renting.getRentingId());

            // Execute the query
            stmt.executeUpdate();

            // Close the statement
            stmt.close();
        }catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating renting: " + e.getMessage());
        }
    }

    /**
     * Method to delete a renting from the database by renting ID
     *
     * @param rentingId The ID of the renting to be deleted
     * @throws Exception if an error occurs while accessing the database
     */

    public void deleteRenting(long rentingId) throws Exception {
        //SQL query to delete a renting by ID
        String deleteRentingSQL = "DELETE FROM Renting WHERE renting_ID = ?";

        //database connection
        ConnectionDB db = new ConnectionDB();

        //try to connect to database, catch exceptions
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(deleteRentingSQL);

            // Set the value for the prepared statement
            stmt.setLong(1, rentingId);

            // Execute the query
            stmt.executeUpdate();
            // Close the statement
            stmt.close();
        }catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while deleting renting: " + e.getMessage());
        }

    }

}