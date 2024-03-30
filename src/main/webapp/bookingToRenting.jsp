<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<head>
    <title>Convert Booking to Renting</title>
    <!-- Include any necessary CSS stylesheets or JavaScript files -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <h2>Convert Booking to Renting</h2>
    <form action="processBookingToRenting.jsp" method="post">
        <div class="form-group">
            <label for="bookingId">Booking ID:</label>
            <input type="text" class="form-control" id="bookingId" name="bookingId" required>
        </div>
        <div class="form-group">
            <label for="creditCard">Credit Card Number:</label>
            <input type="text" class="form-control" id="creditCard" name="creditCard" required>
        </div>
        <button type="submit" class="btn btn-primary">Enter Payment</button>
    </form>
</body>
</html>

