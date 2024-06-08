import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Add_Menu extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String menu_id=req.getParameter("menu_id");
        String menu_name=req.getParameter("menu_name");
        String menu_price=req.getParameter("menu_price");
        String menu_img=req.getParameter("menu_img");
        String menu_description=req.getParameter("menu_description");
        String event=req.getParameter("btn_save");
       
        
        out.println(menu_name);
        out.println(menu_price);
        out.println(menu_img);
        out.println(menu_description);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

        if(event.equals("btn_save"))
       {
            String query1 = "insert into tbl_menu(menu_name,menu_price,menu_img,menu_description)values('"+menu_name+"','"+menu_price+"','Img/"+menu_img+"','"+menu_description+"')";
            String result = db.Query(query1, "Menu Inserted");
            out.println(result);

            
            if(event.equals("Update")) 
            {

      query1 = db.Query("Update tbl_menu set menu_name='" +menu_name+ "', menu_price='" +menu_price+ "',menu_img='Img/" +menu_img+ "', menu_description='" +menu_description+ "'WHERE menu_id='" +menu_id+ "'", "Record Updated");
       result = db.Query(query1, "Menu Updated"); 
      out.println(result);

}
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Menu Added successful');");
            //out.println("window.location='Admin_Signup.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged
}
