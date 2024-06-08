import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class emp_attendance extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        
        String emp_id=req.getParameter("emp_id");
        String emp_name=req.getParameter("emp_name");
        String date=req.getParameter("date");
        String status=req.getParameter("status");
        String event=req.getParameter("btn_save");
       
        
        out.println(emp_name);
        out.println(date);
        out.println(status);
        out.println(event);
       

        DatabaseConnection db = new DatabaseConnection();
        out.println(db.Connectdb());

       
            
            if(event.equals("btn_save"))
       {
            String query1 = "insert into tbl_emp_attedance(emp_name,date,status)values('"+emp_name+"','"+date+"','"+status+"')";
            String result = db.Query(query1, "Attedance Inserted");
            out.println(result);

}
           
   
            
            resp.setContentType("text/html;charset=UTF-8");
            out.println("<script>");
            out.println("alert('Attedance Added successful');");
            out.println("window.location='Employee_Attendance.jsp';");
            out.println("</script>");
        }
    }

    // Other overridden methods remain unchanged}
