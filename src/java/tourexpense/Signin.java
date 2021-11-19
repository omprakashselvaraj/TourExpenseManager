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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;



@WebServlet(name = "signin",urlPatterns="/signin") 
public class Signin extends HttpServlet{
    public Signin() {

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();  
        String uname=request.getParameter("uname");
        String password=request.getParameter("password");
        try{
            Class.forName("com.mysql.jdbc.Driver");    
            String url="jdbc:mysql://localhost:3306/tourexpense";    
            String user="root";    
            String pass="2410";  
            Connection con=DriverManager.getConnection(url, user, pass); 
            String quer="select * from register";
            Statement stmt = con.createStatement();  
            ResultSet rs = stmt.executeQuery(quer);
            HashMap<String, String> map = new HashMap<>();
            while(rs.next()){
                String n = rs.getString("uname");
                String m = rs.getString("password");
                map.put(n,m);
            }
            if(map.containsKey(uname)){
                String getPass;
                getPass = map.get(uname);
                if(getPass.equals(password)){
                    HttpSession session = request.getSession(true);
                    session.setAttribute("user", uname);
                    session.setMaxInactiveInterval(200); 
                    out.println("<html><head></head><body onload=\"alert('Login Successful')\"></body></html>");
                    RequestDispatcher rd;  
                    rd = request.getRequestDispatcher("/product.html");
                    rd.include(request, response);
                    return;
                }
                else{
                    out.println("<html><head></head><body onload=\"alert('Incorrect Password')\"></body></html>");
                    RequestDispatcher rd;  
                    rd = request.getRequestDispatcher("/signin.html");
                    rd.include(request, response);
                    return;
                }
            }
            else{
                out.println("<html><head></head><body onload=\"alert('Incorrect Username')\"></body></html>");
                RequestDispatcher rd;  
                rd = request.getRequestDispatcher("/signin.html");
                rd.include(request, response);
                return;
            }
        }
        catch(ClassNotFoundException | SQLException e)    
        {    
        }
    }
    
}