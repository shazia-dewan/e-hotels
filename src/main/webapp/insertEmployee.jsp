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
    <title>Insert Employee</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <div class="container mt-5">
        <h2>Insert Employee</h2>
      <form action="insertEmployeeResults.jsp" method="get">

            <div class="form-group">
                <label for="employeeID">Customer ID</label>
                <input type="text" class="form-control" id="employeeID" name="employeeID" required>
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
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" required>
            </div>
            <div class="form-group">
                <label for="middleName">Middle Name</label>
                <input type="text" class="form-control" id="middleName" name="middleName">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" required>
            </div>
            <div class="form-group">
                <label for="street">Street</label>
                <input type="text" class="form-control" id="street" name="street" required>
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" name="city" required>
            </div>
            <div class="form-group">
                <label for="provinceState">Province/State</label>
                <input type="text" class="form-control" id="provinceState" name="provinceState" required>
            </div>
            <div class="form-group">
                <label for="postalCode">Postal Code/Zip Code</label>
                <input type="text" class="form-control" id="postalCode" name="postalCode" required>
            </div>
            <div class="form-group">
                <label for="Roles_chef">Roles_chef</label>
                <select id="Roles_chef" class="Roles_chef">
                        <option>True</option>
                        <option>False</option>
                </select>
            </div>
            <div class="form-group">
                <label for="Roles_maintenanceTechnician">Roles_maintenanceTechnician</label>
                <select id="Roles_maintenanceTechnician" class="Roles_maintenanceTechnician">
                     <option>True</option>
                     <option>False</option>
                </select>
            </div>
            <div class="form-group">
                <label for="Roles_receptionist">Roles_receptionist</label>
                 <select id="Roles_receptionist" class="Roles_receptionist">
                                     <option>True</option>
                                     <option>False</option>
                 </select>
            </div>
            <div class="form-group">
                <label for="Roles_hotelKeeper">Roles_hotelKeeper</label>
                <select id="Roles_hotelKeeper" class="Roles_hotelKeeper">
                                 <option>True</option>
                                 <option>False</option>
                </select>

            </div>

            <button type="submit" class="btn btn-primary">Submit</button>

        </form>

    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->

</body>
</html>
