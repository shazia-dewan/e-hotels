<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Hotel</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
        <div class="container mt-5">
            <h2>Delete Hotel</h2>
      <form action="deleteHotelResults.jsp" method="get">
                <div class="form-group">
                    <label for="hotelID">Hotel ID</label>
                    <input type="text" class="form-control" id="hotelID" name="hotelID" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- Your custom JS if needed -->
        </body>
        </html>