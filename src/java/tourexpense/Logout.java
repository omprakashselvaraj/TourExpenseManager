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
import javax.servlet.RequestDispatcher;
//import java.io.PrintWriter;  
import javax.servlet.ServletException;  
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  


public class Logout extends HttpServlet {  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                      throws ServletException, IOException {  
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        //out.println("thanq you!!, Your session was destroyed successfully!!");
        HttpSession session = request.getSession(false);
        // session.setAttribute("user", null);
        session.removeAttribute("user");
        session.getMaxInactiveInterval();
        
        out.println("<html><head></head><body onload=\"alert('Successfully Logged Out')\"></body></html>");
        RequestDispatcher rd;  
        rd = request.getRequestDispatcher("/signin.html");
        rd.include(request, response);
        return;
          
    }  
}