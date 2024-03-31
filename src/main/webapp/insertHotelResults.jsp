<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.HotelService" %>
<%@ page import="com.example.Hotel" %>

<%
    // Retrieve form data
    long hotelID = Long.parseLong(request.getParameter("hotelID"));
    long hotelChainID = Long.parseLong(request.getParameter("hotelChainID"));
    String street = request.getParameter("street");
    String city = request.getParameter("city");
    String provinceState = request.getParameter("provinceState");
    String postalCode = request.getParameter("postalCode");
    double star_rating = Double.parseDouble(request.getParameter("star_rating"));
    String email = request.getParameter("email");
    int num_rooms = Integer.parseInt(request.getParameter("num_rooms"));
    int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));

    // Call the insertHotel method from HotelService
    Hotel hotel = new Hotel(hotelID, hotelChainID,num_rooms,email,star_rating,street,city,provinceState,postalCode,phoneNumber);
    HotelService hotelService = new HotelService();
    boolean inserted = hotelService.insertHotel(hotel);

    // Check if the hotel was successfully inserted
    if (inserted) {
%>
        <div class="alert alert-success" role="alert">
            Hotel inserted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to insert hotel. Please try again.
        </div>
<%
    }
%>
