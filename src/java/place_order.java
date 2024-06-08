import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/place_order")
public class place_order extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String paymentMethod = request.getParameter("payment_type");
        String event = request.getParameter("btn_save");

        if (event != null && event.equals("btn_save") && username != null && paymentMethod != null) {
            String[] menuIds = request.getParameterValues("order_id");
            String[] menuNames = request.getParameterValues("Menu_name");
            String[] menuPrices = request.getParameterValues("Menu_price");

            if (menuIds != null && menuNames != null && menuPrices != null) {
                // Establish a database connection
                Connection conn = null;
                 {
                     DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

                    // Loop through the arrays and insert values
                    for (int i = 0; i < menuIds.length; i++) {
                        PreparedStatement pstmt = null;
                        try {
                            String insertQuery = "INSERT INTO tbl_orders(order_id, Menu_name, Menu_price, Menu_Qunt, username, payment_type) VALUES (?, ?, ?, ?, ?, ?)";
                            pstmt = conn.prepareStatement(insertQuery);

                            // Set values to the PreparedStatement parameters
                            pstmt.setString(1, menuIds[i]);
                            pstmt.setString(2, menuNames[i]);
                            pstmt.setString(3, menuPrices[i]);
                            pstmt.setInt(4, 1); // Assuming Menu_Qunt is an integer column
                            pstmt.setString(5, username);
                            pstmt.setString(6, paymentMethod);

                            pstmt.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                            response.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Menu Added successful');");
            //out.println("window.location='Admin_Signup.jsp';");
            out.println("</script>");
                        } finally {
                            // Close resources (PreparedStatement)
                            // ...
                        }
                    }

                    // Close the connection
                    // ...

                    // Response to the client
                    // ...
                } 
                
                } 
            }
        }
    }
