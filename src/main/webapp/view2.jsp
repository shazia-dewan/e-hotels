<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.example.ConnectionDB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Insert Customer</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<head>
    <meta charset="UTF-8">
    <title>View Room Capacity</title>
    <!-- Include Bootstrap CSS and other stylesheets if needed -->
</head>
<body>

<jsp:include page="navbar.jsp"/>

<div class="container mt-5">
    <h1>Room Capacity</h1>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Hotel Chain ID</th>
                <th>Hotel ID</th>
                <th>Total Capacity</th>
            </tr>
        </thead>
        <tbody>
            <%
                ConnectionDB db = new ConnectionDB();
                try (Connection con = db.getConnection();
                     Statement stmt = con.createStatement();
                     ResultSet rs = stmt.executeQuery("SELECT * FROM RoomCapacity")) {
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("hotelChainID") %></td>
                <td><%= rs.getInt("hotelID") %></td>
                <td><%= rs.getInt("total_capacity") %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</div>

<!-- Include Bootstrap JS and other scripts if needed -->

</body>
</html>
