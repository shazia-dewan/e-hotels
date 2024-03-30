<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.BookingService" %>
<%@ page import="com.example.RentingService" %>
<%@ page import="com.example.Booking" %>
<%@ page import="com.example.Renting" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Convert Booking to Renting</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Your custom CSS -->
    <link rel="stylesheet" href="path/to/your/custom/style.css">
    <style>
        /* Styling for success and error messages */
        .alert {
            margin-top: 20px;
        }
        .alert-danger {
            color: #721c24;
            background-color: #f8d7da;
            border-color: #f5c6cb;
            padding: 10px;
        }
        .alert-success {
            color: #155724;
            background-color: #d4edda;
            border-color: #c3e6cb;
            padding: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>

<div class="container mt-5">
    <h2>Convert Booking to Renting</h2>
    <%-- Your JSP logic here --%>
    <%
        long bookingId = Long.parseLong(request.getParameter("bookingId"));
        long creditCard = Long.parseLong(request.getParameter("creditCard"));

        // Validate booking ID
        BookingService bookingService = new BookingService();
        Booking booking = bookingService.getBookingById(bookingId);
        if (booking == null) {
    %>
            <div class="alert alert-danger" role="alert">
                Invalid booking ID. Please enter a valid booking ID.
            </div>
    <%
        } else {
            // Validate credit card information
            if (String.valueOf(creditCard).length() == 16) {
                // Credit card is valid, proceed to create a new renting record
                RentingService rentingService = new RentingService();
                rentingService.createRentingFromBooking(booking,creditCard);
    %>
                <div class="alert alert-success" role="alert">
                    Renting created successfully!
                </div>
    <%
            } else {
    %>
                <div class="alert alert-danger" role="alert">
                    Invalid credit card number. Please enter a valid 16-digit credit card number.
                </div>
    <%
            }
        }
    %>
</div>

</body>
</html>


