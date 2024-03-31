<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.HotelService" %>
<%@ page import="com.example.Hotel" %>

<%
    // Retrieve form data
    long hotelID = Long.parseLong(request.getParameter("hotelID"));

    // Call the DeleteHotel method from HotelService
    HotelService hotelService = new HotelService();
    boolean deleted = hotelService.deleteHotel(hotelID);

    // Check if the hotel was successfully inserted
    if (deleted) {
%>
        <div class="alert alert-success" role="alert">
            Hotel deleted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to delete hotel. Please try again.
        </div>
<%
    }
%>
