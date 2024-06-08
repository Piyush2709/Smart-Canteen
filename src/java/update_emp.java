import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update_emp extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String emp_id=req.getParameter("emp_id");
        String emp_name=req.getParameter("emp_name");
        String emp_no=req.getParameter("emp_no");
        String emp_profile=req.getParameter("emp_profile");
        String emp_proof=req.getParameter("emp_proof");
        String emp_address=req.getParameter("emp_address");
        String event=req.getParameter("btn_save");
       
        
        out.println(emp_name);
        out.println(emp_no);
        out.println(emp_profile);
        out.println(emp_proof);
         out.println(emp_address);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

       
            
            if(event.equals("Update")) 
            {

      String query1 = "Update tbl_emp set emp_name='" +emp_name+ "', emp_no='" +emp_no+ "',emp_profile='Img/" +emp_profile+ "', emp_proof='Img/" +emp_proof+ "', emp_address='" +emp_address+ "'WHERE emp_id='" +emp_id+ "'";
      String result = db.Query(query1, "Record Updated"); 
    out.println(result);

}
            else if (event.equals("Delete")) {
            String deleteQuery = "DELETE FROM tbl_emp WHERE emp_id='" + emp_id + "'";
            String result = db.Query(deleteQuery, "Record Deleted");
            out.println(result);
        }
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Emp Updated successful');");
            out.println("window.location='View_Employees.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged}
