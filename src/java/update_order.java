import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update_order extends HttpServlet {
    @Override
    @SuppressWarnings("empty-statement")
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String order_id = req.getParameter("order_id");
        String username = req.getParameter("username");
        String Menu_name = req.getParameter("Menu_name");
        String Menu_Qunt = req.getParameter("Menu_Qunt");
        String Menu_price = req.getParameter("Menu_price");
        String status = req.getParameter("status");

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        
            if (status.equals("Completed")) {
                 String query1 = "insert into tbl_completedorders(username,Menu_name,Menu_Qunt,Menu_price)values('"+username+"','"+Menu_name+"','"+Menu_Qunt+"','"+Menu_price+"')";
            String result = db.Query(query1, "Record Inserted");
            out.println(result);

                String query2 = "DELETE FROM tbl_orders WHERE order_id='" + order_id + "'";
                 result = db.Query(query2, "Record Inserted");
            out.println(result);;
             resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Completed successful');");
            out.println("window.location='admin_dashbord.jsp';");
            out.println("</script>");
                
            } else if (status.equals("Canceled")) {
                 String query1 = "insert into tbl_cancelledorders(username,Menu_name,Menu_Qunt,Menu_price)values('"+username+"','"+Menu_name+"','"+Menu_Qunt+"','"+Menu_price+"')";
            String result = db.Query(query1, "Record Inserted");
            out.println(result);

                String query2 = "DELETE FROM tbl_orders WHERE order_id='" + order_id + "'";
                 result = db.Query(query2, "Record Inserted");
            out.println(result);;

            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Cancelled successful');");
            out.println("window.location='admin_dashbord.jsp';");
            out.println("</script>");// Close database connection (modify as per your DatabaseConnection class)
        }
    }

    // Other overridden methods remain unchanged
}
