import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PlaceOrderServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String[] menuIds = request.getParameterValues("menu_id[]");
        String[] menuNames = request.getParameterValues("menu_name[]");
        String[] menuPrices = request.getParameterValues("menu_price[]");
        String payment_type = "cod"; // Default payment type
        int Menu_Qunt = 1; // Default menu quantity
        String event = request.getParameter("btn_save");

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/smart_canteen"; // Replace with your database URL
            String dbUsername = "root"; // Replace with your database username
            String dbPassword = "root"; // Replace with your database password
            Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            if (event.equals("btn_save")) {
                if (menuIds != null && menuNames != null && menuPrices != null) {
                    for (int i = 0; i < menuIds.length; i++) {
                        String query1 = "INSERT INTO tbl_orders(username, order_id, Menu_name, Menu_price, Menu_Qunt, payment_type) VALUES (?, ?, ?, ?, ?, ?)";
                        PreparedStatement pstmt = conn.prepareStatement(query1);

                        pstmt.setString(1, username);
                        pstmt.setString(2, menuIds[i]);
                        pstmt.setString(3, menuNames[i]);
                        pstmt.setString(4, menuPrices[i]);
                        pstmt.setInt(5, Menu_Qunt);
                        pstmt.setString(6, payment_type);
                        pstmt.executeUpdate();

                        pstmt.close();
                    }
                    out.println("Orders placed successfully.");
                    resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            
            out.println("window.location='thankyou.jsp';");
            out.println("</script>");
                }
                 
            }
            conn.close();
        } catch (Exception e) {
            out.println("Error while placing orders: " + e.getMessage());
        }
    }
}
