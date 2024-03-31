<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.RoomService" %>
<%@ page import="com.example.Room" %>
<%@ page import="com.example.HotelService" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // Retrieve parameters from the request
    int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
    int hotelID = Integer.parseInt(request.getParameter("hotelID"));
    int hotelChainID = Integer.parseInt(request.getParameter("hotelChainID"));
    boolean problemsElectrical = Boolean.parseBoolean(request.getParameter("problems_electrical"));
    boolean problemsWater = Boolean.parseBoolean(request.getParameter("problems_water"));
    boolean problemsFurniture = Boolean.parseBoolean(request.getParameter("problems_furniture"));
    String problemsOther = request.getParameter("problems_other");
    double price = Double.parseDouble(request.getParameter("price"));
    boolean amenitiesTv = Boolean.parseBoolean(request.getParameter("amenities_tv"));
    boolean amenitiesWifi = Boolean.parseBoolean(request.getParameter("amenities_wifi"));
    boolean amenitiesAirCon = Boolean.parseBoolean(request.getParameter("amenities_air_con"));
    boolean amenitiesFridge = Boolean.parseBoolean(request.getParameter("amenities_fridge"));
    boolean amenitiesToiletries = Boolean.parseBoolean(request.getParameter("amenities_toiletries"));
    boolean capacitiesSingle = Boolean.parseBoolean(request.getParameter("capacities_single"));
    boolean capacitiesDouble = Boolean.parseBoolean(request.getParameter("capacities_double"));
    boolean seaView = Boolean.parseBoolean(request.getParameter("sea_view"));
    boolean mountainView = Boolean.parseBoolean(request.getParameter("mountain_view"));
    boolean extendable = Boolean.parseBoolean(request.getParameter("extendable"));
    int guestCapacity = Integer.parseInt(request.getParameter("guest_capacity"));

    // Create a Room object with the updated information
    RoomService roomService = new RoomService();
    Room updatedRoom = roomService.getRoomFromID(roomNumber);
    updatedRoom.setRoomNumber(roomNumber);
    updatedRoom.setHotelID(hotelID);
    updatedRoom.setHotelChainID(hotelChainID);
    updatedRoom.setProblemsElectrical(problemsElectrical);
    updatedRoom.setProblemsWater(problemsWater);
    updatedRoom.setProblemsFurniture(problemsFurniture);
    updatedRoom.setProblemsOther(problemsOther);
    updatedRoom.setPrice(price);
    updatedRoom.setAmenitiesTv(amenitiesTv);
    updatedRoom.setAmenitiesWifi(amenitiesWifi);
    updatedRoom.setAmenitiesAirCon(amenitiesAirCon);
    updatedRoom.setAmenitiesFridge(amenitiesFridge);
    updatedRoom.setAmenitiesToiletries(amenitiesToiletries);
    updatedRoom.setCapacitySingle(capacitiesSingle);
    updatedRoom.setCapacityDouble(capacitiesDouble);
    updatedRoom.setSeaView(seaView);
    updatedRoom.setMountainView(mountainView);
    updatedRoom.setExtendable(extendable);
    updatedRoom.setGuestCapacity(guestCapacity);

    // Update the room in the database

    try {
        boolean success = roomService.updateRoom(updatedRoom);
        if (success) {
            out.println("Room updated successfully!");
        } else {
            out.println("Failed to update room!");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error while updating room: " + e.getMessage());
    }
%>
