<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<head>
    <meta charset="UTF-8">
    <title>Customer Management</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <div class="container mt-5">
        <h2>Customer Management</h2>
        <div class="row mt-3">
            <div class="col-md-4">
                <a href="insertCustomer.jsp" class="btn btn-primary btn-block">Insert Customer</a>
            </div>
            <div class="col-md-4">
                <a href="deleteCustomer.jsp" class="btn btn-danger btn-block">Delete Customer</a>
            </div>
            <div class="col-md-4">
                <a href="updateCustomer.jsp" class="btn btn-warning btn-block">Update Customer</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->
</body>
</html>
