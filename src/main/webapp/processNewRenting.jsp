<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Date" %>
<%@ page import="com.example.RentingService" %>
<%@ page import="com.example.Renting" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Crate New Renting</title>
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
    <h2>Create New Renting</h2>
    <%-- Your JSP logic here --%>
    <%
        // Retrieve renting information from the request parameters
                Date rentingDate = Date.valueOf(request.getParameter("rentingDate")); // Parse renting date directly as a Date object
                int customerId = Integer.parseInt(request.getParameter("customerID"));
                int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
                int hotelId = Integer.parseInt(request.getParameter("hotelID"));
                int hotelChainId = Integer.parseInt(request.getParameter("hotelChainID"));
                long payment = Long.parseLong(request.getParameter("payment"));

         // Validate payment length
                if (String.valueOf(payment).length() != 16) {
            %>
                    <div class="alert alert-danger" role="alert">
                        Credit card number must be 16 digits long.
                    </div>
            <%
                } else if (rentingDate == null) {
                    // Display error message if renting date format is invalid
            %>
                    <div class="alert alert-danger" role="alert">
                        Invalid renting date format. Please enter the date in yyyy-mm-dd format.
                    </div>
            <%
                    } else {
                        // Create a Renting object with the retrieved information
                        Renting renting = new Renting(rentingDate, customerId, roomNumber, hotelId, hotelChainId, payment);

                        try {
                            // Call the insertRenting method from the RentingService to insert the renting into the database
                            RentingService rentingService = new RentingService();
                            rentingService.createNewRenting(renting);
                %>
                            <div class="alert alert-success" role="alert">
                                Renting information successfully inserted into the database!
                            </div>
                <%
                        } catch (Exception e) {
                            // Handle any exceptions that occur during the database operation
                %>
                            <div class="alert alert-danger" role="alert">
                                An error occurred while processing the renting information: <%= e.getMessage() %>
                            </div>
                <%
                        }
                    }
                %>
</div>
 <script src="assets/bootstrap/js/bootstrap.min.js"></script>
 <script src="assets/js/jquery.min.js"></script>
 <script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
 <script>
     $(document).ready(function() {
         toastr.options = {
             "closeButton": true,
             "positionClass": "toast-bottom-right",
             "preventDuplicates": false
         };
     })
 </script>
 </body>
 </html>
