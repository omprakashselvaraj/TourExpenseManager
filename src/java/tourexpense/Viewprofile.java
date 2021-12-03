/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tourexpense;

/**
 *
 * @author music
 */
import java.io.IOException;  
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
//import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  


public class Viewprofile extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                      throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out = response.getWriter(); 
            //request.getRequestDispatcher("home.html").include(request, response);
            
            HttpSession session=request.getSession(false);
            String name;  
            name = (String)session.getAttribute("user");
            try{
            Class.forName("com.mysql.jdbc.Driver");    
            String url="jdbc:mysql://localhost:3306/tourexpense";    
            String user="root";    
            String pass="2410";  
            Connection con=DriverManager.getConnection(url, user, pass); 
            String quer="select * from register";
      
            Statement stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery(quer);
            
            while(rs.next()){
                if(rs.getString("uname").equals(name)){
                    String username=rs.getString("uname");
                    String uname=rs.getString("name");
                    String email=rs.getString("email");
                    String gender=rs.getString("gender");
                    String phone=rs.getString("phone");
                    request.setAttribute("username", username);
                    request.setAttribute("name", uname);
                    request.setAttribute("email", email);
                    request.setAttribute("gender", gender);
                    request.setAttribute("phone", phone);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("viewprofile.jsp");
                    dispatcher.forward(request, response);
                    
                }
           
          }
          //RequestDispatcher dispatcher = request.getRequestDispatcher("viewprofile.jsp");
          //dispatcher.forward(request, response);
          }
              
       
        
            catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Viewprofile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}  

