<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.ConnectionDB" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
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
    <title>View Available Rooms</title>
    <!-- Include Bootstrap CSS and other stylesheets if needed -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <h1>Number of Available Rooms per Area</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Area</th>
                <th>Number of Available Rooms</th>
            </tr>
        </thead>
        <tbody>
            <%
                try {
                    ConnectionDB db = new ConnectionDB();
                    Connection con = db.getConnection();
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM AvailableRoomsPerArea");
                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("area") %></td>
                            <td><%= rs.getInt("num_available_rooms") %></td>
                        </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </tbody>
    </table>
</body>
</html>
