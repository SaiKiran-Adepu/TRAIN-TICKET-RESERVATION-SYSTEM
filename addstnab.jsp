<%@ include file="sessionvala.jsp"%>
<html>
<head>
<title>Station Names</title>
</head>
<body onkeydown="return(event.keyCode == 154)">
<%@ include file="packaget.jsp"%>
 
<%!
    Connection con;
    PreparedStatement ps1, ps2;
    public void jspInit() {
        try { 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            ps1 = con.prepareStatement("insert into train_stations(station_name) values(?)");
            ps2 = con.prepareStatement("select count(*) from train_stations where station_name=?");                      
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    }
%>
<%
    try {
        String sna = request.getParameter("sname");
        sna = sna.toUpperCase();

        ps2.setString(1, sna);
        ResultSet rs = ps2.executeQuery();
        int cnt = 0;
        if (rs.next())
        
           cnt = rs.getInt(1);
        
        if(cnt>0) {
            out.println("<center><h2><font color=red>Station Name already Exists: " + sna.toUpperCase() + "</font></h2></center>");
         out.println("<center><h2><font color=red> Please Enter Another Station Name</font></h2></center>");
        
        }
        else {
            ps1.setString(1, sna);
            int cnt1;
            cnt1 = ps1.executeUpdate();
            if(cnt1 > 0) {
                out.println("<center><font color=blue><h3>TRAIN STATION SUCCESSFULLY ADDED...</h3></font></center>");
                out.println("<br>");
                out.println("<center>");
                out.println("<table border=2px bgcolor=#b0c4de>");
                out.println("<tr>");
                out.println("<th>STATION NAME</th>");
                out.println("</tr>");
                out.println("<tr>");
                out.println("<td>" + sna + "</td>");
                out.println("</tr>");
                out.println("</table>");
                out.println("</center>");
                out.println("<center><h2><font color=blue>THE SKA RAILWAYS</font></h2></center>");
            }
            else {
                out.println("<center><font color=blue><h3>STATION ADD UNSUCCESSFUL</h3></font></center>");
            }
              ps1.close();
        }
    }
    catch(Exception ex) {
        ex.printStackTrace();
    }
   
        try {       
            ps1.close();
            ps2.close();
            con.close();
        }
        catch(Exception ex) {
            ex.printStackTrace();
        }
    
%>

<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 30%;
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
</body>

</html>
