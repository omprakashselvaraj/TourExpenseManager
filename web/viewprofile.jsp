<%@page import="tourexpense.Signup"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<html>
    <head>
        <title> Profile </title>
        <link rel="stylesheet" href="styles/style2.css">
    </head>
    <body>
        <br>
        <center><h1>PROFILE PAGE</h1></center>
        <br><br>
        <center>
    <table >
    <tr>
    <td><b>USERNAME:</b></td>
    <td><%=(String)request.getAttribute("username") %></td>
    </tr>
    <tr>
        <td><b>NAME:</b></td>
        <td><%=(String)request.getAttribute("name") %></td>
    </tr>
    <tr>
    <td><b>EMAIL:</b></td>
    <td><%=(String)request.getAttribute("email") %></td>
    </tr>
    <tr>
        <td><b>GENDER:</b></td>
        <td><%=(String)request.getAttribute("gender") %></td>
    </tr>
    <tr>
        <td><b>PHONE:</b></td>
        <td><%=(String)request.getAttribute("phone") %></td>
    </tr>
    


    </table>
        </center>
    <br><br><!-- comment -->
    <center><h3>PAST TRIP'S SUMMARY</h3></center>
    <%
        String uname=(String)request.getAttribute("username");
 
        Class.forName("com.mysql.jdbc.Driver");    
        String url="jdbc:mysql://localhost:3306/tourexpense";    
        String user="root";    
        String pass="2410";  
        Connection con=DriverManager.getConnection(url, user, pass);   
        String query;    
        query = "select * from expense where username = ?";
        PreparedStatement  stmt = con.prepareStatement(query);  
        stmt.setString(1,uname);
        ResultSet rs = stmt.executeQuery(); 
                
            
            
    %>
    <center>
    <table>
        <tr>
        <td>Start Date</td>
        <td>End Date</td>
        <td>No of Days</td>
        <td>No of Person</td>
        <td>Total Expense</td>
        <td>Per Head Expense</td>
        </tr>
        <% 
            int count=0;
            int tsum=0;
            int psum=0;
            int days=0;
        %>
        <% while(rs.next()){ %>
        <tr>
            <TD> <%= rs.getString(2) %></TD>
            <TD> <%= rs.getString(3) %></TD>
            <TD> <%= rs.getInt(4) %></TD>
            <TD> <%= rs.getInt(5) %></TD>
            <TD> <%= rs.getInt(6) %></TD>
            <TD> <%= rs.getInt(7) %></TD>
            <% 
                count++;
                tsum=tsum+rs.getInt(6);
                psum=psum+rs.getInt(7);
                days=days+rs.getInt(4);
            %>
        </tr>
        <% } %>
     </table>
     <br><br><!-- comment -->
     <table>
         <tr>
             <td>Total No of Trips</td>
             <td><%= count %></td>
         </tr>
         <tr>
             <td>Total Expense For Trip</td>
             <td><%= tsum %></td>
         </tr>
         <tr>
             <td>Total Per head Expense</td>
             <td><%= psum %></td>
         </tr>
         <tr>
             <td>Average Expense </td>
             <td><%= tsum/count %></td>
         </tr>
         <tr>
             <td>Average Per Head Expense  </td>
             <td><%= psum/count %></td>
         </tr>
         <tr>
             <td>Total No of Days</td>
             <td><%= days %></td>
         </tr>
         <tr>
             <td>Average No of Days </td>
             <td><%= days/count %></td>
         </tr>
     </table>
    <a href="product.html">Go Back</a>
    </center>
    </body>
</html>