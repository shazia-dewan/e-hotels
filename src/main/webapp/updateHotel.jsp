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
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Hotel</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <div class="container mt-5">
        <h2>Update Hotel</h2>
      <form action="updateHotelResults.jsp" method="get">

            <div class="form-group">
                <label for="hotelID">Hotel ID</label>
                <input type="text" class="form-control" id="hotelID" name="hotelID" required>
            </div>


            <div class="form-group">
                  <label for="hotelChainID">Hotel Chain</label>
                  <select class="form-control" id="hotelChainID" name="hotelChainID">
                       <option value="">Select Hotel Chain</option>
                        <% for (HotelChain chain : hotelChains) { %>
                            <option value="<%= chain.getHotelChainID() %>"><%= chain.getHotelChainID() %></option>
                         <% } %>
                  </select>
            </div>

            <div class="form-group">
                   <label for="num_rooms">num_rooms</label>
                   <input type="text" class="form-control" id="num_rooms" name="num_rooms" >
            </div>

            <div class="form-group">
                               <label for="phoneNumber">Phone Number</label>
                               <input type="text" class="form-control" id="phoneNumber" name="phoneNumber" >
                        </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" >

            </div>
            <div class="form-group">
                <label for="star_rating">Star_rating</label>
                <input type="text" class="form-control" id="star_rating" name="star_rating">
            </div>
            <div class="form-group">
                <label for="street">Street</label>
                <input type="text" class="form-control" id="street" name="street" >
            </div>

            <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" name="city" >
            </div>

            <div class="form-group">
                <label for="province">Province/State</label>
                <input type="text" class="form-control" id="province" name="province" >
            </div>

            <div class="form-group">
                <label for="PostalCode">Postal Code/Zip Code</label>
                <input type="text" class="form-control" id="PostalCode" name="PostalCode" >
            </div>


            <button type="submit" class="btn btn-primary">Submit</button>

        </form>

    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->

</body>
</html>
