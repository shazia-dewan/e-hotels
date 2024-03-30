<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.HotelChainService" %>
<%@ page import="com.example.HotelChain" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%
    // get all hotel chains from database
    HotelChainService hotelChainService = new HotelChainService();
     List<HotelChain> hotelChains = new ArrayList<>();
    try {
        hotelChains = hotelChainService.getHotelChain();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title> Home Page </title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css">
</head>
<html>
<head>
    <title>Customer Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <jsp:include page="navbar.jsp"/>
<div class="container mt-5">
    <h2>Find Available Rooms</h2>
    <form action="searchResults.jsp" method="get"> <!-- Redirect to searchResults.jsp after form submission -->
        <div class="form-group">
            <label for="startDate">Start Date</label>
            <input type="date" class="form-control" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">End Date</label>
            <input type="date" class="form-control" id="endDate" name="endDate" required>
        </div>
        <div class="form-group">
            <label for="roomCapacity">Room Capacity</label>
            <input type="number" class="form-control" id="roomCapacity" name="roomCapacity" required>
        </div>
        <div class="form-group">
            <label for="area">Area</label>
            <input type="text" class="form-control" id="area" name="area">
        </div>
        <div class="form-group">
            <label for="hotelChain">Hotel Chain</label>
            <select class="form-control" id="hotelChain" name="hotelChain">
                <option value="">Select Hotel Chain</option>
                <% for (HotelChain chain : hotelChains) { %>
                    <option value="<%= chain.getHotelChainID() %>"><%= chain.getHotelChainID() %></option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label for="hotelCategory">Hotel Category</label>
            <select class="form-control" id="hotelCategory" name="hotelCategory">
                <option value="">Select Hotel Category</option>
                <% for (int i = 1; i <= 5; i++) { %>
                    <option value="<%= i %>"><%= i %> Star</option>
                <% } %>
            </select>
        </div>
        <div class="form-group">
            <label for="totalRooms">Total Number of Rooms in Hotel</label>
            <input type="number" class="form-control" id="totalRooms" name="totalRooms">
        </div>
        <div class="form-group">
            <label for="priceRange">Price Range</label>
            <input type="text" class="form-control" id="priceRange" name="priceRange" placeholder="e.g., 100-200">
        </div>
        <!-- Removed nested form -->
        <button type="submit" class="btn btn-primary">Search</button>
    </form>
</div>


<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
