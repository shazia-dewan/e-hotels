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
    <title>Insert Room</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <div class="container mt-5">
        <h2>Insert Hotel</h2>
      <form action="insertRoomResults.jsp" method="get">

             <div class="form-group">
                            <label for="roomNumber">Room Number</label>
                            <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
                        </div>

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
                            <label for="problems_electrical">Problems Electrical</label>
                            <select id="problems_electrical" class="problems_electrical">
                                    <option>True</option>
                                    <option>False</option>
                            </select>
            </div>

            <div class="form-group">
                                        <label for="problems_water">Problems Water</label>
                                        <select id="problems_water" class="problems_water">
                                                <option>True</option>
                                                <option>False</option>
                                        </select>
                        </div>

           <div class="form-group">
                                                   <label for="problems_furniture">Problems Furniture</label>
                                                   <select id="problems_furniture" class="problems_furniture">
                                                           <option>True</option>
                                                           <option>False</option>
                                                   </select>
                                   </div>

            <div class="form-group">
                               <label for="problems_other">Problem Other</label>
                               <input type="text" class="form-control" id="problems_other" name="problems_other" required>
                        </div>
            <div class="form-group">
                                           <label for="price">Price</label>
                                           <input type="text" class="form-control" id="price" name="price" required>
                                    </div>
            <div class="form-group">
                                                               <label for="amenities_tv">amenities_tv</label>
                                                               <select id="amenities_tv" class="amenities_tv">
                                                                       <option>True</option>
                                                                       <option>False</option>
                                                               </select>
             </div>

             <div class="form-group">
                                                                <label for="amenities_wifi">amenities_wifi</label>
                                                                <select id="amenities_wifi" class="amenities_wifi">
                                                                        <option>True</option>
                                                                        <option>False</option>
                                                                </select>
                                                </div>
             <div class="form-group">
                                                                             <label for="amenities_air_con">amenities_air_con</label>
                                                                             <select id="amenities_air_con" class="amenities_air_con">
                                                                                     <option>True</option>
                                                                                     <option>False</option>
                                                                             </select>
                                                                             </div>
              <div class="form-group">
                                                                             <label for="amenities_fridge">amenities_fridge</label>
                                                                             <select id="amenities_fridge" class="amenities_fridge">
                                                                                     <option>True</option>
                                                                                     <option>False</option>
                                                                             </select>

                                                                             </div>
              <div class="form-group">
                                                                                           <label for="amenities_toiletries">amenities_toiletries</label>
                                                                                           <select id="amenities_toiletries" class="amenities_toiletries">
                                                                                                   <option>True</option>
                                                                                                   <option>False</option>
                                                                                           </select>

                                                                                           </div>
              <div class="form-group">
                                                                                           <label for="capacities_single">capacities_single</label>
                                                                                           <select id="capacities_single" class="amenities_fridge">
                                                                                                   <option>True</option>
                                                                                                   <option>False</option>
                                                                                           </select>

                                                                                           </div>
               <div class="form-group">
                                                                                                         <label for="capacities_double">capacities_double</label>
                                                                                                         <select id="capacities_double" class="capacities_double">
                                                                                                                 <option>True</option>
                                                                                                                 <option>False</option>
                                                                                                         </select>

                                                                                                         </div>
               <div class="form-group">
                                                                                                                        <label for="sea_view">sea_view</label>
                                                                                                                        <select id="sea_view" class="sea_view">
                                                                                                                                <option>True</option>
                                                                                                                                <option>False</option>
                                                                                                                        </select>

                                                                                                                        </div>
               <div class="form-group">
                                                                                                                                       <label for="mountain_view">mountain_view</label>
                                                                                                                                       <select id="mountain_view" class="mountain_view">
                                                                                                                                               <option>True</option>
                                                                                                                                               <option>False</option>
                                                                                                                                       </select>

                                                                                                                                       </div>
                 </div>
                               <div class="form-group">
                                                                                                                                                       <label for="extendable">extendable</label>
                                                                                                                                                       <select id="extendable" class="extendable">
                                                                                                                                                               <option>True</option>
                                                                                                                                                               <option>False</option>
                                                                                                                                                       </select>

                                                                                                                                                       </div>

            <div class="form-group">
                <label for="guest_capacity">guest_capacity</label>
                <input type="text" class="form-control" id="guest_capacity" name="guest_capacity" required>

            </div>



            <button type="submit" class="btn btn-primary">Submit</button>

        </form>

    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->

</body>
</html>
