<%@page import="java.sql.*"%>
<%@page import="java.io.*,java.util.*"%>

<%
// Get the menu details from the form
String[] menuIds = request.getParameterValues("menu_id[]");
String[] menuNames = request.getParameterValues("menu_name[]");
String[] menuPrices = request.getParameterValues("menu_price[]");

// Get username from session
String username = (String) session.getAttribute("username");

// Other fixed values
int menuQuant = 1; // Menu quantity
String paymentType = "cod"; // Payment type

// Database connection details
String url = "jdbc:mysql://localhost:3306/smart_canteen";
String dbUsername = "root";
String dbPassword = "root";

try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

    // Insert data into tbl_orders
    String insertQuery = "INSERT INTO tbl_orders (username, menu_id, Menu_name, Menu_price, Menu_quant, payment_type) VALUES (?, ?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(insertQuery);

    // Insert each menu item into the database
    if (menuIds != null && menuNames != null && menuPrices != null) {
        for (int i = 0; i < menuIds.length; i++) {
            pstmt.setString(1, username);
            pstmt.setString(2, menuIds[i]);
            pstmt.setString(3, menuNames[i]);
            pstmt.setString(4, menuPrices[i]);
            pstmt.setInt(5, menuQuant);
            pstmt.setString(6, paymentType);
            pstmt.executeUpdate();
        }
    }

    pstmt.close();
    conn.close();

    // Redirect to a thank you or confirmation page after successful insertion
    response.sendRedirect("thank_you.jsp");
} catch (Exception e) {
    e.printStackTrace();
    // Handle exceptions
}
%>
