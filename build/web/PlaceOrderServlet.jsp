<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>

<%
// Retrieve form data
String[] menuIds = request.getParameterValues("menu_id[]");
String[] menuNames = request.getParameterValues("menu_name[]");
String[] menuPrices = request.getParameterValues("menu_price[]");

// Fixed values
int menuQuantity = 1; // Menu quantity
String paymentType = "cod"; // Payment type

// Database connection details
String url = "jdbc:mysql://localhost:3306/smart_canteen";
String dbUsername = "root";
String dbPassword = "root";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Insert data into tbl_orders
    String insertQuery = "INSERT INTO tbl_orders (order_id, Menu_name, Menu_price, Menu_Qunt, payment_type) VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);

    if (menuIds != null && menuNames != null && menuPrices != null) {
        for (int i = 0; i < menuIds.length; i++) {
            pstmt.setString(1, menuIds[i]);
            pstmt.setString(2, menuNames[i]);
            pstmt.setString(3, menuPrices[i]);
            pstmt.setInt(4, menuQuantity);
            pstmt.setString(5, paymentType);
            pstmt.executeUpdate();
        }
    }

    pstmt.close();
    conn.close();

    // Redirect after successful insertion
    response.sendRedirect("order_placed.jsp"); // Redirect to a confirmation page
} catch (Exception e) {
    e.printStackTrace();
    // Handle exceptions
}
%>
