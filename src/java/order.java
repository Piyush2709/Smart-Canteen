import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class order extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String menu_id=req.getParameter("menu_id");
        String menu_name=req.getParameter("menu_name");
        String menu_price=req.getParameter("menu_price");
        String Menu_Qunt=req.getParameter("Menu_Qunt");
       
        String event=req.getParameter("btn_save");
       
        
        out.println(menu_name);
        out.println(menu_price);
        out.println(Menu_Qunt);
        
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if(event.equals("btn_save"))
       {
            String query1 = "insert into tbl_menu(menu_name,menu_price,Menu_Qunt)values('"+menu_name+"','"+menu_price+"','"+Menu_Qunt+"')";
            String result = db.Query(query1, "Order Placed !");
            out.println(result);

            
            
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Menu Added successful');");
            //out.println("window.location='Admin_Signup.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged
}
