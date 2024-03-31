<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.RoomService" %>
<%@ page import="com.example.Room" %>

<%
    // Retrieve form data
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int hotelChainID = Integer.parseInt(request.getParameter("hotelChainID"));
    boolean problems_water = Boolean.parseBoolean(request.getParameter("problems_water"));
    boolean problems_electrical = Boolean.parseBoolean(request.getParameter("problems_electrical"));
    boolean problems_furniture = Boolean.parseBoolean(request.getParameter("problems_furniture"));
    String problems_other = request.getParameter("problems_other");
    double price = Double.parseDouble(request.getParameter("price"));
    boolean amenities_air_con = Boolean.parseBoolean(request.getParameter("amenities_air_con"));
    boolean amenities_fridge = Boolean.parseBoolean(request.getParameter("amenities_fridge"));
    boolean amenities_toiletries = Boolean.parseBoolean(request.getParameter("amenities_toiletries"));
    boolean amenities_tv = Boolean.parseBoolean(request.getParameter("amenities_tv"));
    boolean amenities_wifi = Boolean.parseBoolean(request.getParameter("amenities_wifi"));
    boolean capacities_double = Boolean.parseBoolean(request.getParameter("capacities_double"));
    boolean capacities_single = Boolean.parseBoolean(request.getParameter("capacities_single"));
    int guest_capacity = Integer.parseInt(request.getParameter("guest_capacity"));
    boolean sea_view = Boolean.parseBoolean(request.getParameter("sea_view"));
    boolean mountain_view = Boolean.parseBoolean(request.getParameter("mountain_view"));
    boolean extendable = Boolean.parseBoolean(request.getParameter("extendable"));

    // Call the insertHotel method from HotelService
    Room room = new Room(roomNumber, hotelID, hotelChainID, problems_water, problems_electrical, problems_furniture, problems_other, price, amenities_tv, amenities_wifi, amenities_air_con, amenities_fridge, amenities_toiletries, capacities_single, capacities_double, guest_capacity, sea_view, mountain_view, extendable);
    RoomService roomService = new RoomService();
    boolean inserted = roomService.insertRoom(room);

    // Check if the hotel was successfully inserted
    if (inserted) {
%>
        <div class="alert alert-success" role="alert">
            Room inserted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to insert room. Please try again.
        </div>
<%
    }
%>