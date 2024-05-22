<%@ include file="reservationucnfp.jsp"%>
<%@ page errorPage="error.jsp" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Payment Gateway SKA Railways</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="datetime.js"></script>
</head>
<%!
    Connection con;
    PreparedStatement ps1, ps2, ps3, ps4;

    public void jspInit() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/XE", "system", "tiger");
            ps1 = con.prepareStatement("select acid,username,phone from userreal where acid=? AND pass=? AND phone=?");
            ps2 = con.prepareStatement("update userreal set amt=amt-?,trm=? where acid=?");
            ps3 = con.prepareStatement("insert into skatrns values(?,?,?,?,?,?,?,?)");
            ps4 = con.prepareStatement("SELECT trno,acid,fund,dot FROM skatrns WHERE dot = ?");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>

<%
    int nt = Integer.parseInt(request.getParameter("acid"));
    String pass = request.getParameter("pass");
    String mbl = request.getParameter("mbl");

    int fr1 = Integer.parseInt(request.getParameter("fr"));
    String trm = request.getParameter("trm");

    int trno = Integer.parseInt(request.getParameter("trnno"));
    int acidf = Integer.parseInt(request.getParameter("acid"));
    int amtt = Integer.parseInt(request.getParameter("fr"));
    int acidt = Integer.parseInt(request.getParameter("acid1"));
    String trm131 = request.getParameter("trm");
    String dot = request.getParameter("dot");
    String dota = request.getParameter("dot1");
    String trmt132 = request.getParameter("trm132");






    ps1.setInt(1, nt);
    ps1.setString(2, pass);
    ps1.setString(3, mbl);

    ps2.setInt(1, fr1);
    ps2.setString(2, trm);
    ps2.setInt(3, nt);

    ps3.setInt(1, trno);
    ps3.setInt(2, acidf);
    ps3.setInt(3, amtt);
    ps3.setInt(4, acidt);
    ps3.setString(5, trm);
    ps3.setString(6, dot);
    ps3.setString(7, dota);
    ps3.setString(8, trmt132);

    ResultSet rs1 = ps1.executeQuery();
    int cnt = 0;

    if (rs1.next()) {
        cnt = rs1.getInt(1);
    }

    if (cnt == 0) {
        //out.println("<center><h3><font color=red>Invalid credentials</font></h3></center>");
        out.println("<center><h3><font color=red>Payment Get Denied</font></h3></center>");
        out.println("<center><h3><font color=red>Please Enter valid Credentials</font></h3></center>");
        // Return or redirect as needed, but don't continue with the database update
    } 
    else {
       
        // Display user information
        out.println("<form><fieldset style= width:25%;background-color:lightblue>");
        out.println("<b><i><font size=4 color=blue>PAYMENT GATEWAY SKA-RAILWAYS </font></i></b><br>");

        rs1 = ps1.executeQuery();

        while (rs1.next()) {
            out.println("<b><i><font size=4 color=green>Ac Name:</font></i></b> " + rs1.getString(2));
            out.println("<br>");
            out.println("<b><i><font size=4 color=green>Mobile Number:</font></i></b> " + rs1.getString(3));
        }

        out.println("</fieldset></form>");

        // Execute the update only when the user credentials are valid
        int cnt1 = ps2.executeUpdate();

        if (cnt1 > 0) {
            // Display success message and transaction details
            out.println("<center><font color=blue><h3>FUND Successfully Transferred TO SKA RAILWAYS</h3></font></center>");
            out.println("<center>");
            out.println("</center>");
            // Execute the insert into skatrns table
            try {
                int cntt = ps3.executeUpdate();

                if (cntt > 0) {
                    out.println("<center><font color=blue><h3>Transaction Successfully Recorded</h3></font></center>");

                    // Display the transaction details using a new PreparedStatement and ResultSet
                    try {
                        ps4.setString(1, dot);
                        ResultSet rs4 = ps4.executeQuery();
                        String pm="User Bank Payment";

                        out.println("<center>");
                        out.println("<table border=3 bgcolor=#ffefd5 height=10 width=500>");
                        out.println("<tr>");
                        out.println("<th>TRNO</th>");
                        out.println("<th>ACCOUNT NUMBER</th>");
                        out.println("<th>RS</th>");
                        out.println("<th>DOT</th>");
                        // ... (other columns)
                        out.println("</tr>");

                        while (rs4.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs4.getInt(1) + "</td>");
                            out.println("<td>" + rs4.getInt(2) + "</td>");
                            out.println("<td>" + rs4.getInt(3) + "</td>");
                            out.println("<td>" + rs4.getString(4) + "</td>");
                            // ... (other columns)
                        
                            out.println("</tr>");
                        }
//response.sendRedirect("test5.jsp");
                        out.println("</table>");

                        out.print("<br>");
                        //out.println("<a href=reservationucnf.jsp>Continue</a>");
                  out.println("<center><font color=blue><h3>Please Wait...</h3></font></center>");
                    out.println("<form method = post action = reservationucnf.jsp>");
                      // out.println("<form method = post action = testt.jsp>");
                       out.println("<textarea rows1 cols=15 name=pm readonly hidden>"+pm+"</textarea>");
                      
                        out.println("<input type = submit value=PRINT TICKET hidden id=red name = s1>");//need to hold this code here for restrict the user to print ticket when user enters wrong password


                        out.println("</center>");
                        out.println("<br>");
                    } catch (SQLException e) {
                        e.printStackTrace();  // Properly handle this exception in a production environment
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();  // Properly handle this exception in a production environment
            }
        }
    }
%>

<%!
    public void jspDestroy() {
        try {
            ps1.close();
            ps2.close();
            ps3.close();
            ps4.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>

<body onkeydown="return(event.keyCode == 154)"style="background-color:white;" onload="redirect()" >
     <script type="text/javascript">
        
        function redirect() {
            setTimeout(function(){
                document.getElementById("red").click();
            }, 5000);
        }
    </script>


 <table>
 <tr>

<%@ page import="java.util.Map" %>

<%
    // Retrieve the list of passenger data from the session
    List<Map<String, String>> passengerList = (List<Map<String, String>>) session.getAttribute("passengerList");

    // If the list is null, create an empty one
    if (passengerList == null) {
        passengerList = new ArrayList<>();
    }
%>
 <table>
      <!--  <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Berth</th>
        </tr>-->
        <!-- Loop through the passengerList and display data -->
        <% 
        for (Map<String, String> passengerData : passengerList) { 
           //out.print("</tr>");
                String n=passengerData.get("Name");
                String a=passengerData.get("Age");
                String g=passengerData.get("Gender");
                String b=passengerData.get("Berth");
                 out.println("<textarea rows1 cols=15 name=pname2[] hidden readonly>"+n+"</textarea>");
                 out.println("<textarea rows1 cols=15 name=page[] hidden readonly>"+a+"</textarea>");
                 out.println("<textarea rows1 cols=15 name=pgen[] hidden readonly>"+g+"</textarea>");   
                 out.println("<textarea rows1 cols=15 name=pbth[] hidden readonly>"+b+"</textarea>");
                
           //out.print("</tr>");
         }
          %>
    </table>
            <input type="number" name="tn" readonly="readonly" value='<%=tno11%>' hidden/></td>


<input type="number" name="tn" readonly="readonly" value='<%=tno11%>' hidden/></td>
 <input type="text" name="tname" readonly="readonly" value='<%=tname%>' hidden/></td>                    
<input type="text" name="s" readonly="readonly" value='<%=s%>' hidden/></td>                    
<input type="text" name="d" readonly="readonly" value='<%=d%>' hidden/></td>                    
<input type="text" name="tcl" readonly="readonly" value='<%=tcl%>' hidden/></td>                    
<input type="text" name="tt" readonly="readonly" value='<%=tt%>' hidden/></td>                    
 
                   
<input type="number" name="ad" readonly="readonly" value='<%=ad%>' hidden/></td>                    
<input type="number" name="ch" readonly="readonly" value='<%=ch%>' hidden/></td>                    
<input type="text" name="couch" readonly="readonly" value='<%=couch%>' hidden/></td>                    

<input type="text" name="bsf" readonly="readonly" value='<%=bsf%>' hidden/></td>                    
<input type="text" name="acc" readonly="readonly" value='<%=acc%>' hidden/></td>   
<input type="text" name="tc" readonly="readonly" value='<%=tc%>' hidden/></td>   <!-- tatkal charges-->
<input type="text" name="fr" readonly="readonly" value='<%=fr%>' hidden/></td>
<input type="text" name="km" readonly="readonly" value='<%=km%>' hidden/></td>
<input type="text" name="dob" readonly="readonly" value='<%=dob%>' hidden/></td>                    
<input type="text" name="doj" readonly="readonly" value='<%=doj%>' hidden/></td>                    
<input type="text" name="usr" readonly="readonly" value='<%=usr%>' hidden/></td>                    



</tr>
</table>

</form>
   <center>
        <h3><font color="Meganta">This Site is Developed By SKA Developments &copy;2023 All Rights Received.</font></h3>
    </center>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 32%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</body>
</html>
