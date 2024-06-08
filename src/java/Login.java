/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
         PrintWriter out= resp.getWriter();
        
        
        String username=req.getParameter("username");
    String password=req.getParameter("password");
    String event=req.getParameter("Login");
           

//print the input from users

        out.println(username);
        out.println(password);
       
        out.println(event);
        
        
        
        DatabaseConnection db=new DatabaseConnection();
        out.println(db.Connectdb());
        
        
        
        Connection cn=null;
       Statement st=null;
       
        HttpSession session=req.getSession();

        if(event.equals("Login"))
        {
            
            if(username.equals("admin"))
            {
            try
        {
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen","root","root");
            st=cn.createStatement();
                String pass = null;
            String sql="select * from tbl_adminsignup where username='"+username+"' and password='"+password+"'";
            ResultSet rs=st.executeQuery(sql);
            if(rs.next())
            {
              
             resp.sendRedirect("admin_dashbord.jsp");
            }
            else
            {
              out.println("Login Failed");
            }

        }catch(Exception ex)
        {
          out.println(ex.toString());
        }
            
            }
            else
            {
                
                try
        {
            Class.forName("com.mysql.jdbc.Driver");
            cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/smart_canteen","root","root");
            st=cn.createStatement();
                String pass = null;
            String sql="select * from tbl_usersignup where username='"+username+"' and password='"+password+"'";
            ResultSet rs=st.executeQuery(sql);
            if(rs.next())
            {
              // session.setAttribute("reg_id", rs.getString("reg_id"));
              session.setAttribute("username", rs.getString("username"));
              //session.setAttribute("clg", rs.getString("collage"));
              //session.setAttribute("dept", rs.getString("department"));
              //session.setAttribute("cls", rs.getString("class"));
              
             out.println(session.getAttribute("username"));
             // out.println(session.getAttribute("clg"));
              //out.println(session.getAttribute("dept"));
              //out.println(session.getAttribute("cls"));
             resp.sendRedirect("shop.jsp");
            }
            else
            {
              out.println("Login Failed");
            }

        }catch(Exception ex)
        {
          out.println(ex.toString());
        }
             
            }


        }
        
    }

    
    
}
