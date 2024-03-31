<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.RoomService" %>
<%@ page import="com.example.Room" %>

<%
    // Retrieve form data
    int roomID = Integer.parseInt(request.getParameter("roomID"));

    // Call the DeleteRoom method from RoomService
    RoomService roomService = new RoomService();
    boolean deleted = roomService.deleteRoom(roomID);

    // Check if the room was successfully inserted
    if (deleted) {
%>
        <div class="alert alert-success" role="alert">
            Room deleted successfully!
        </div>
<%
    } else {
%>
        <div class="alert alert-danger" role="alert">
            Failed to delete room. Please try again.
        </div>
<%
    }
%>
