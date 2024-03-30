<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Room" %> <!-- Import your Room class or relevant model class -->
<%@ page import="com.example.RoomService" %> <!-- Import your RoomService class or relevant service class -->

<%
    // Retrieve search parameters from request parameters
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");

    // Safely convert string parameters to Integer, handling null or empty strings
    Integer roomCapacity = null;
    if (request.getParameter("roomCapacity") != null && !request.getParameter("roomCapacity").isEmpty()) {
        roomCapacity = Integer.parseInt(request.getParameter("roomCapacity"));
    }

    String area = request.getParameter("area");

    Integer hotelChainID = null;
    if (request.getParameter("hotelChain") != null && !request.getParameter("hotelChain").isEmpty()) {
        hotelChainID = Integer.parseInt(request.getParameter("hotelChain"));
    }

    Integer category = null;
    if (request.getParameter("hotelCategory") != null && !request.getParameter("hotelCategory").isEmpty()) {
        category = Integer.parseInt(request.getParameter("hotelCategory"));
    }

    Integer totalRooms = null;
    if (request.getParameter("totalRooms") != null && !request.getParameter("totalRooms").isEmpty()) {
        totalRooms = Integer.parseInt(request.getParameter("totalRooms"));
    }

    String priceRange = request.getParameter("priceRange");

    // Perform search for available rooms based on the search parameters
    List<Room> searchResults = RoomService.searchRooms(startDate, endDate, roomCapacity, area, hotelChainID, category, totalRooms, priceRange);
%>


<!DOCTYPE html>
<html>
<head>
    <title>Search Results</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <style>
        .room-details {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }
        .room-details h4 {
            margin-top: 0;
            margin-bottom: 10px;
        }
        .room-details p {
            margin: 0;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h2>Search Results</h2>
    <div class="row">
        <% for (Room room : searchResults) { %>
            <div class="col-md-6">
                <div class="room-details">
                    <h4>Room Number: <%= room.getRoomNumber() %></h4>
                    <p>Hotel ID: <%= room.getHotelID() %></p>
                    <p>Hotel Chain ID: <%= room.getHotelChainID() %></p>
                    <p>Price: <%= room.getPrice() %></p>
                </div>
            </div>
        <% } %>
    </div>
</div>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
