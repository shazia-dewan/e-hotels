import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BookingService {

    /**
     * Method to get all bookings from the database
     *
     * @return List of bookings from the database
     * @throws Exception when trying to connect to the database or execute the query
     */

    public List<Booking> getBookings() throws Exception {

        //SQL query to retrieve all bookings
        String sql= "SELECT * FROM Booking";

        //connection object
        ConnectionDB db = new ConnectionDB();

        //data structure to keep all bookings retrieved from the database
        List<Booking> bookings = new ArrayList<>();

        //try to connect to the database and catch any exceptions
        try(Connection con =db.getConnection()){

            //prepare sql statement
            PreparedStatement stmt = con.prepareStatement(sql);

            //get results from executing the query
            ResultSet rs = stmt.executeQuery();

            //iterate through the result set
            while (rs.next()){
                //create new booking object
                Booking booking = new Booking(
                        rs.getLong("booking_ID"),
                        rs.getDate("booking_date"),
                        rs.getString("Customer_first_name"),
                        rs.getString("Customer_middle_name"),
                        rs.getString("Customer_last_name"),
                        rs.getInt("Room_number"),
                        rs.getInt("hotelID"),
                        rs.getInt("hotelChainID"),
                        rs.getString("Payment")
                );

                //append booking to bookings list
                bookings.add(booking);
            }

            //close result
            rs.close();
            //close statement
            stmt.close();
            con.close();
            //close database connection
            db.close();

            //return list of bookings
            return bookings;

        }catch (Exception e){
            //throw errors that occur
            throw new Exception(e.getMessage());
        }
    }

    /**
     * Method to insert a new booking into the database
     *
     * @param booking The booking to be inserted
     * @throws Exception if an error occurs while accessing the database
     */
    public void insertBooking(Booking booking) throws Exception{

        //database connection object
        ConnectionDB db = new ConnectionDB();

        // SQL query to insert a new booking
        String insertBookingSQL = "INSERT INTO Booking (booking_ID, booking_date, Customer_first_name, " +
                "Customer_middle_name, Customer_last_name, Room_number, hotelID, hotelChainID, Payment) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        //try to connect to the database and catch any exceptions
        try(Connection con = db.getConnection()){

            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(insertBookingSQL);

            //set values for the prepared statement
            stmt.setLong(1, booking.getBookingId());
            stmt.setDate(2, new java.sql.Date(booking.getBookingDate().getTime()));
            stmt.setString(3, booking.getCustomerFirstName());
            stmt.setString(4, booking.getCustomerMiddleName());
            stmt.setString(5, booking.getCustomerLastName());
            stmt.setInt(6, booking.getRoomNumber());
            stmt.setInt(7, booking.getHotelId());
            stmt.setInt(8, booking.getHotelChainId());
            stmt.setString(9,booking.getPayment());

            //execute the query
            stmt.executeUpdate();

            //close the statement
            stmt.close();
        }catch (Exception e){
            //throw error
            throw new Exception("Error while inserting booking: " + e.getMessage());
        }

    }

    /**
     * Method to update a booking in the database
     *
     * @param booking The booking object containing updated information
     * @throws Exception if an error occurs while accessing the database
     */

    public void updateBooking(Booking booking) throws Exception{
        //database connection object
        ConnectionDB db = new ConnectionDB();

        // SQL query to update a booking
        String updateBookingSQL = "UPDATE Booking SET booking_date = ?, Customer_first_name = ?, " +
                "Customer_middle_name = ?, Customer_last_name = ?, Room_number = ?, " +
                "hotelID = ?, hotelChainID = ?, Payment = ? WHERE booking_ID = ?";

        //try to connect to database, catch any exceptions
        try(Connection con = db.getConnection()){
            //prepare the statement
            PreparedStatement stmt = con.prepareStatement(updateBookingSQL);

            //set parameters for statement
            stmt.setDate(1, new java.sql.Date(booking.getBookingDate().getTime()));
            stmt.setString(2, booking.getCustomerFirstName());
            stmt.setString(3, booking.getCustomerMiddleName());
            stmt.setString(4, booking.getCustomerLastName());
            stmt.setInt(5, booking.getRoomNumber());
            stmt.setInt(6, booking.getHotelId());
            stmt.setInt(7, booking.getHotelChainId());
            stmt.setString(8, booking.getPayment());
            stmt.setLong(9, booking.getBookingId());

            // Execute the query
            stmt.executeUpdate();

            // Close the statement
            stmt.close();
        }catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while updating booking: " + e.getMessage());
        }
    }

    /**
     * Method to delete a booking from the database by booking ID
     *
     * @param bookingId The ID of the booking to be deleted
     * @throws Exception if an error occurs while accessing the database
     */

    public void deleteBooking(long bookingId) throws Exception {
        // SQL query to delete a booking by ID
        String deleteBookingSQL = "DELETE FROM Booking WHERE booking_ID = ?";

        //database connection
        ConnectionDB db = new ConnectionDB();

        //try to connect to database, catch exceptions
        try (Connection con = db.getConnection()){
            PreparedStatement stmt = con.prepareStatement(deleteBookingSQL);

                // Set the value for the prepared statement
                stmt.setLong(1, bookingId);

                // Execute the query
                stmt.executeUpdate();
                // Close the statement
                stmt.close();
        }catch (Exception e) {
            // Throw any errors occurred
            throw new Exception("Error while deleting booking: " + e.getMessage());
        }

    }

}