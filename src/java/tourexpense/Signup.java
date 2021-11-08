/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tourexpense;

/**
 *
 * @author music
 */
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;

@WebServlet(name = "signup",urlPatterns = "/signup") 
public class Signup extends HttpServlet{
    public Signup() {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.sendRedirect("/index.html");  
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String gender=request.getParameter("gender");
        String phone=request.getParameter("phone");
        //out.println("<h1>"+name+" "+email+" "+username+" "+password+" "+gender+" "+phone+"</h1>");
        try{
            Class.forName("com.mysql.jdbc.Driver");    
            String url="jdbc:mysql://localhost:3306/tourexpense";    
            String user="root";    
            String pass="2410";  
            Connection con=DriverManager.getConnection(url, user, pass); 
            String quer="select * from register";
            Statement stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery(quer);
            HashSet<String> set=new HashSet(); 
            while(rs.next()){
                String n = rs.getString("uname");
                set.add(n);
            }
            boolean ans=set.contains(username);
            if(ans==true){
                out.println("<html><head></head><body onload=\"alert('Username Already Registered')\"></body></html>");
                RequestDispatcher rd;  
                rd = request.getRequestDispatcher("/signup.html");
                rd.include(request, response);
                return;
            }
        }
        catch(ClassNotFoundException | SQLException e)    
        {    
        }
        try{
            Class.forName("com.mysql.jdbc.Driver");    
            String url="jdbc:mysql://localhost:3306/tourexpense";    
            String user="root";    
            String pass="2410";  
            Connection con=DriverManager.getConnection(url, user, pass);   
            String query;    
            query = "insert into register values (?,?,?,?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(query);    
            pstmt.setString(1, name);    
            pstmt.setString(2, email);    
            pstmt.setString(3, username);    
            pstmt.setString(4, password);    
            pstmt.setString(5, gender);    
            pstmt.setString(6, phone);    
                
            int x=pstmt.executeUpdate();    
                
            if(x==1)    
            {    
                out.println("<html><head></head><body onload=\"alert('Registered Successfully')\"></body></html>");
                RequestDispatcher rd;  
                rd = request.getRequestDispatcher("/signin.html");
                rd.include(request, response); 
                return;
            }
            
        }
        catch(SQLException e)    
        {    
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Signup.class.getName()).log(Level.SEVERE, null, ex);
        }
        out.close();
    }
    
    
}