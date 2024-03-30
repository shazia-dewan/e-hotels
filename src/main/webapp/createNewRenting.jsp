<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<head>
    <title>Create New Renting</title>
    <!-- Include any necessary CSS stylesheets or JavaScript files -->
</head>
<body>
    <jsp:include page="navbar.jsp"/>

    <h2>Create New Renting</h2>

    <form action="processNewRenting.jsp" method="post">
        <div class="form-group">
            <label for="rentingDate">Renting Date (yyyy-mm-dd):</label>
            <!-- Apply the class to hide pattern and title attributes -->
                <input type="text" class="form-control hide-pattern-title" id="rentingDate" name="rentingDate" required
                       pattern="\d{4}-\d{2}-\d{2}" title="Please enter the renting date in yyyy-mm-dd format">
                <small class="form-text text-muted">Example: 2024-01-01</small>
            </div>
        <div class="form-group">
            <label for="customerID">Customer ID:</label>
            <input type="text" class="form-control" id="customerID" name="customerID" required>
        </div>
        <div class="form-group">
            <label for="roomNumber">Room Number:</label>
            <input type="text" class="form-control" id="roomNumber" name="roomNumber" required>
        </div>
        <div class="form-group">
             <label for="hotelID">Hotel ID:</label>
             <input type="text" class="form-control" id="hotelID" name="hotelID" required>
        </div>
        <div class="form-group">
             <label for="hotelChainID">Hotel Chain ID:</label>
             <input type="text" class="form-control" id="hotelChainID" name="hotelChainID" required>
        </div>
        <div class="form-group">
              <label for="payment">Credit Card Number:</label>
              <input type="text" class="form-control" id="payment" name="payment" required>
        </div>
        <button type="submit" class="btn btn-success">Create Renting</button>
    </form>
</body>
</html>

