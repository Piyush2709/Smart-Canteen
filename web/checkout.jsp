<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Meta tags -->
    <!-- ... -->

    <!-- Bootstrap CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="css/tiny-slider.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <title>Smart Canteen</title>

    <style>
        /* Your custom styles */
        /* ... */
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <nav class="custom-navbar navbar navbar-expand-md navbar-dark bg-dark">
        <!-- Navbar content -->
        <!-- ... -->
    </nav>

    <!-- Cart Items -->
    <div class="row mb-5">
        <div class="col-md-12">
            <div class="p-3 p-lg-5 border bg-white">
                <form action="PlaceOrderServlet" method="post">
                    <table class="table site-block-order-table mb-5">
                        <thead>
                            <th>Product</th>
                            <th>Total</th>
                        </thead>
                        <tbody>
                            <%  
                                // Retrieve the submitted data from the previous page
                                String[] menuNames = request.getParameterValues("menu_name");
                                String[] menuPrices = request.getParameterValues("menu_price");
                                String[] menuIds = request.getParameterValues("menu_id");
                                double cartSubtotal = 0.0;

                                if (menuNames != null && menuPrices != null) {
                                    for (int i = 0; i < menuNames.length; i++) {
                                        cartSubtotal += Double.parseDouble(menuPrices[i]);
                            %>  
                            <tr>
                                <td><%= menuNames[i] %> <strong class="mx-2">x</strong> 1</td>
                                <td><%= menuPrices[i] %></td>
                            </tr>
                            <% 
                                    }
                                }
                            %>
                            <tr>
                                <td class="text-black font-weight-bold"><strong>Cart Subtotal</strong></td>
                                <td class="text-black"><%= cartSubtotal %></td>
                            </tr>

                            <!-- Payment Method Section -->
                            

                            <!-- Hidden Fields for Menu Details -->
                            <% 
                                // Include hidden fields to pass menu details to place_order.jsp
                                if (menuIds != null && menuNames != null && menuPrices != null) {
                                    for (int i = 0; i < menuNames.length; i++) {
                            %>
                             
                            <input type="hidden" name="menu_id[]" value="<%= menuIds[i] %>">
                            <input type="hidden" name="menu_name[]" value="<%= menuNames[i] %>">
                            <input type="hidden" name="menu_price[]" value="<%= menuPrices[i] %>">
                            <!-- Add other hidden fields as needed -->
                            <% 
                                    }
                                }
                            %>
                        </tbody>
                    </table>

                    <!-- Submit Button -->
                    <div class="form-group">
                        <button type="submit" name="btn_save" value="btn_save" class="btn btn-black btn-lg py-3 btn-block">Place Order</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap and other scripts -->
    <!-- ... -->

    <!-- JavaScript to toggle visibility of UPI input field -->
    
</body>

</html>
