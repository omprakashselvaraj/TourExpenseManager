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
    </body>
</html>