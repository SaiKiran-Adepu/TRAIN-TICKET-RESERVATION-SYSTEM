<%@ include file="sessionvaltu.jsp" %>
<%@ include file="packaget.jsp" %>

<%@ page import="java.sql.*" %>

<%!
    Connection con;
    PreparedStatement ps1, ps3, ps4;

     public void jspInit()
    {
        try
        { 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "tiger");
           ps3 = con.prepareStatement("INSERT INTO train_sitting(name, age, gender, berth, tusr, tbd) VALUES (?,?,?,?,?,?)");
            ps4 = con.prepareStatement("select * from train_sitting where pnr=2 ORDER BY tbd");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>

<html>
<head>
    <title>TRAIN BOOKING DETAILS</title>
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: solid #dddddd;
            text-align: left;
            padding: 10px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
</head>
<body onkeydown="return(event.keyCode == 154)">
    <%
    
        
        String dob = request.getParameter("dob");
        String doj = request.getParameter("doj");
        String usr = request.getParameter("usr");

        String[] pnameValues = request.getParameterValues("pname2[]");
        String[] pageValues = request.getParameterValues("page[]");
        String[] pgenValues = request.getParameterValues("pgen[]");
        String[] pbthValues = request.getParameterValues("pbth[]");

   
        for (int i1 = 0; i1 < pnameValues.length; i1++) {
            String pname2 = pnameValues[i1];
            String pageValue = pageValues[i1];
            String pgen = pgenValues[i1];
            String pbth = pbthValues[i1];

            if (pname2 != null && pageValue != null && pgen != null && pbth != null) {
                ps3.setString(1, pname2);
                ps3.setString(2, pageValue);
                ps3.setString(3, pgen);
                ps3.setString(4, pbth);
                ps3.setString(5, usr);
                ps3.setString(6, dob);

                int cnt2 = ps3.executeUpdate();

                if (cnt2 > 0) {
                    out.print("<center><font color=blue><h3>Passenger " + (i1 + 1) + " added successfully</h3></font></center>");
                } else {
                    out.print("<center><font color=red><h3>Failed to add Passenger " + (i1 + 1) + "</h3></font></center>");
                }
            } else {
                out.print("<center><font color=red><h3>Invalid input for Passenger " + (i1 + 1) + "</h3></font></center>");
            }
        }

      
         StringBuilder passengerDetails = new StringBuilder();
        ResultSet rs3 = ps4.executeQuery();
        out.println("<center><h3><font color=orange>HAPPY JOURNEY</font></h3></center>");
        out.println("<table bgcolor=EDF2F4>");
        out.println("<tr>");
        out.println("<th>Name</th>");
        out.println("<th>Age</th>");
        out.println("<th>Gender</th>");
         out.println("<th>Seat Number</th>");
        out.println("<th>Berth</th>");
        out.println("</tr>");

 while (rs3.next()) {

       
            out.println("<tr>");
            out.println("<td>" + rs3.getString(2) + "</td>");
            out.println("<td>" + rs3.getString(3) + "</td>");
            out.println("<td>" + rs3.getString(4) + "</td>");
            out.println("<td>"+ rs3.getInt(5) + "</td>");
            out.println("<td>"+ rs3.getString(6) + "</td>");
            out.println("</tr>");
        }

        out.println("</table></center>");
        rs3.close();
    %>

<%!
    public void jspDestroy() {
        try {
           
            ps3.close();
            ps4.close();
            con.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
%>
</body>
</html>
