<%@page import="java.util.Arrays"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="styles/style2.css">
        <title>Tour Expense Manager</title>
    </head>
    <body>
        <a href="product.html">Go Back</a>
        <%
        String tname=request.getParameter("tname");  
        String sdate=request.getParameter("sdate");
        String edate=request.getParameter("edate");
        String np=request.getParameter("np");
        String nd=request.getParameter("nd");
        String tfee=request.getParameter("tfee");
        String cfee=request.getParameter("cfee");
        String ofee=request.getParameter("ofee");
        String bfee=request.getParameter("bfee");
        String lfee=request.getParameter("lfee");
        String dfee=request.getParameter("dfee");
        String rfee=request.getParameter("rfee");
        int nop=Integer.parseInt(np);
        int nod=Integer.parseInt(nd);
        String[] travel = tfee.split(" ");
        String[] car = cfee.split(" ");
        String[] park = ofee.split(" ");
        String[] brak = bfee.split(" ");
        String[] lunch = lfee.split(" ");
        String[] dinner = dfee.split(" ");
        String[] room = rfee.split(" ");
        //out.print(cfee+bfee+lfee+dfee+rfee);
        int[] tra=new int[nod];
        int[] carp=new int[nod];
        int[] parking=new int[nod];
        int[] breakfast=new int[nod];
        int[] lunchfee=new int[nod];
        int[] dinnerfee=new int[nod];
        int[] roomfee=new int[nod];
        int i;
        for(i=0;i<nod;i++){
            tra[i]=Integer.parseInt(travel[i]);
            carp[i]=Integer.parseInt(car[i]);
            parking[i]=Integer.parseInt(park[i]);
            breakfast[i]=Integer.parseInt(brak[i]);
            lunchfee[i]=Integer.parseInt(lunch[i]);
            dinnerfee[i]=Integer.parseInt(dinner[i]);
            roomfee[i]=Integer.parseInt(room[i]);
        }
        int[] totexp = new int[7];
        Arrays.fill(totexp,0);
        int one=0;
        int two=0;
        int three=0;
        int four=0;
        int five=0;
        int six=0;
        int seven=0;
        for(i=0;i<nod;i++){
            one+=tra[i];
            two+=carp[i];
            three+=parking[i];
            four+=breakfast[i];
            five+=lunchfee[i];
            six+=dinnerfee[i];
            seven+=roomfee[i];
        }
        totexp[0]=one;
        totexp[1]=two;
        totexp[2]=three;
        totexp[3]=four;
        totexp[4]=five;
        totexp[5]=six;
        totexp[6]=seven;
        int sum=0;
        for(i=0;i<7;i++){
            sum+=totexp[i];
        }
        %>
        <br>
        <center><h1>Expense Report</h1></center>
        <br><br>
        <center>
            <table>
                <tr>
                    <td><b> Trip Name: </b></td>
                    <td> <%= tname %> </td>
                </tr>
                <tr>
                    <td><b> Start Date: </b></td>
                    <td> <%= sdate %> </td>
                </tr>
                <tr>
                    <td><b> End Date: </b></td>
                    <td> <%= edate %> </td>
                </tr>
                <tr>
                    <td><b> No of Days: </b></td>
                    <td> <%= nod %> </td>
                </tr>
                <tr>
                    <td><b> No of Persons: </b></td>
                    <td> <%= nop %> </td>
                </tr>
            </table>
            <br><br>
            <p><b>Overall Summary Table</b></p> 
    
        <table>
            <tr>
                <th>Day</th>
                <th>Air/Bus/Rail Fee</th>
                <th>Car/Jeep rental Fee</th>
                <th>parking/toll Fee</th>
                <th>Breakfast Amount</th>
                <th>Lunch Amount</th>
                <th>Dinner Amount</th>
                <th>Room Rent</th>
            </tr>
            <% for(i=0;i<nod;i++){ %>
            <TR>
            <TD><%= i+1 %></TD>
            <TD> <%= tra[i] %></td>
            <TD> <%= carp[i]  %></TD>
            <TD> <%= parking[i] %></TD>
            <TD> <%= breakfast[i] %></TD>
            <TD> <%= lunchfee[i] %></TD>
            <TD> <%= dinnerfee[i] %></TD>
            <TD> <%= roomfee[i] %></TD>
            </TR>
            <% } %>
            <TR>
                <TD><b>Total Expense</b></TD>
            <TD> <%= totexp[0] %></td>
            <TD> <%= totexp[1]  %></TD>
            <TD> <%= totexp[2] %></TD>
            <TD> <%= totexp[3] %></TD>
            <TD> <%= totexp[4] %></TD>
            <TD> <%= totexp[5] %></TD>
            <TD> <%= totexp[6] %></TD>
            </TR>
        </table>
            <br><br>
            <p><b>Individual Summary Table</b></p> 
            <table>
                <tr>
                <th>Day</th>
                <th>Air/Bus/Rail Fee</th>
                <th>Car/Jeep rental Fee</th>
                <th>parking/toll Fee</th>
                <th>Breakfast Amount</th>
                <th>Lunch Amount</th>
                <th>Dinner Amount</th>
                <th>Room Rent</th>
                </tr>
                <% for(i=0;i<nod;i++){ %>
                <TR>
                <TD><%= i+1 %></TD>
                <TD> <%= tra[i]/nop %></td>
                <TD> <%= carp[i]/nop  %></TD>
                <TD> <%= parking[i]/nop %></TD>
                <TD> <%= breakfast[i]/nop %></TD>
                <TD> <%= lunchfee[i]/nop %></TD>
                <TD> <%= dinnerfee[i]/nop %></TD>
                <TD> <%= roomfee[i]/nop %></TD>
                </TR>
                <% } %>
                <TR>
                <TD><b>Total Expense</b></TD>
                <TD> <%= totexp[0]/nop %></td>
                <TD> <%= totexp[1]/nop  %></TD>
                <TD> <%= totexp[2]/nop %></TD>
                <TD> <%= totexp[3]/nop %></TD>
                <TD> <%= totexp[4]/nop %></TD>
                <TD> <%= totexp[5]/nop %></TD>
                <TD> <%= totexp[6]/nop %></TD>
                </TR>
            </table>
            <br><br>
            <p><b>Cost Summary Table</b></p>
            <table>
                <tr>
                    <th><b>Total Expense</b></th>
                    <th><b>Individual Expense</b></th>
                </tr>
                <tr>
                    <td><%= sum %></td>
                    <td><%= sum/nop %></td>
                </tr>
            </table>
                <br><br>
                <button onclick="window.print()">Print Summary</button>
                <br><br>
        </center>
               
    </body>
</html>