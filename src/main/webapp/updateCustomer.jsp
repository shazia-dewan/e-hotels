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
        <h2>Update Customer</h2>
      <form action="updateCustomerResults.jsp" method="get">
            <div class="form-group">
                <label for="customerID">Customer ID</label>
                <input type="text" class="form-control" id="customerID" name="customerID" required>
            </div>
            <div class="form-group">
                <label for="firstName">First Name</label>
                <input type="text" class="form-control" id="firstName" name="firstName" >
            </div>
            <div class="form-group">
                <label for="middleName">Middle Name</label>
                <input type="text" class="form-control" id="middleName" name="middleName">
            </div>
            <div class="form-group">
                <label for="lastName">Last Name</label>
                <input type="text" class="form-control" id="lastName" name="lastName" >
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
                <label for="provinceState">Province/State</label>
                <input type="text" class="form-control" id="provinceState" name="provinceState" >
            </div>
            <div class="form-group">
                <label for="postalCode">Postal Code/Zip Code</label>
                <input type="text" class="form-control" id="postalCode" name="postalCode" >
            </div>
            <div class="form-group">
                <label for="registrationDate">Date of Registration</label>
                <input type="date" class="form-control" id="registrationDate" name="registrationDate" >
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->
</body>
</html>
