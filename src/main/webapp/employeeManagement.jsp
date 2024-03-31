<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Home Page</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
</head>
<head>
    <meta charset="UTF-8">
    <title>Employee Management</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <!-- Include any other CSS stylesheets -->
</head>
<body>
<jsp:include page="navbar.jsp"/>
    <div class="container mt-5">
        <h2>Employee Management</h2>
        <div class="row mt-3">
            <div class="col-md-4">
                <a href="insertEmployee.jsp" class="btn btn-primary btn-block">Insert Employee</a>
            </div>
            <div class="col-md-4">
                <a href="deleteEmployee.jsp" class="btn btn-danger btn-block">Delete Employee</a>
            </div>
            <div class="col-md-4">
                <a href="updateEmployee.jsp" class="btn btn-warning btn-block">Update Employee</a>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <!-- Your custom JS if needed -->
</body>
</html>
