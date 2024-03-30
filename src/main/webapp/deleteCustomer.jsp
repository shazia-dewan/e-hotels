<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert Customer</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
        <div class="container mt-5">
            <h2>Delete Customer</h2>
      <form action="deleteCustomerResults.jsp" method="get">
                <div class="form-group">
                    <label for="customerID">Customer ID</label>
                    <input type="text" class="form-control" id="customerID" name="customerID" required>
                </div>
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>

        <!-- Bootstrap JS -->
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <!-- Your custom JS if needed -->
        </body>
        </html>