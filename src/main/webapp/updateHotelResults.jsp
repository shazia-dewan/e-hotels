<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.HotelService" %>
<%@ page import="com.example.Hotel" %>

<%
    // Retrieve form data
    long hotelID = Long.parseLong(request.getParameter("hotelID"));
    long hotelChainID = Long.parseLong(request.getParameter("hotelChainID"));
    int num_rooms = Integer.parseInt(request.getParameter("num_rooms"));
    String email = request.getParameter("email");
    double star_rating = Double.parseDouble(request.getParameter("star_rating"));
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String provinceState = request.getParameter("province");
    String postalCode = request.getParameter("PostalCode");
    String phoneNumber = request.getParameter("phoneNumber");

    // Create a Hotel object with the updated information
    HotelService hotelService = new HotelService();
    Hotel updatedHotel = hotelService.getHotelFromID(hotelID);
    updatedHotel.setHotel_ID(hotelID);
    updatedHotel.setHotelChainID(hotelChainID);
    updatedHotel.setStreet(street);
    updatedHotel.setCity(city);
    updatedHotel.setProvince(provinceState);
    updatedHotel.setPostal_code(postalCode);
    updatedHotel.setEmail(email);
    updatedHotel.setStar_rating(star_rating);
    updatedHotel.setPhoneNumber(phoneNumber);


    // Update the employee in the database

       boolean success = hotelService.updateHotel(updatedHotel);

        // Display success or error message
        if (success) {
    %>
            <div class="container mt-5">
                <div class="alert alert-success" role="alert">
                    Hotel updated successfully!
                </div>
            </div>
    <%
        } else {
    %>
            <div class="container mt-5">
                <div class="alert alert-danger" role="alert">
                    Failed to update hotel. Please try again.
                </div>
            </div>
<%
    }
%>
