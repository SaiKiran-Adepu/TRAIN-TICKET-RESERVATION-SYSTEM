<%@ include file="sessionvaltu.jsp"%>
<%@ include file="packaget.jsp"%>
<%
    String mbl = request.getParameter("mbl");
    String uno = request.getParameter("uno");
    String pass = request.getParameter("pass");
    
    // Connect to MySQL database
    String url = "jdbc:mysql://localhost:3306/train";
    String user = "root";
    String password = "tiger";
    Connection conn = DriverManager.getConnection(url, user, password);
    // Create prepared statement for update query
    String query = "UPDATE train_users SET mobile_number = ? WHERE user_no = ? and password=?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setString(1,mbl);//first the value which you want to set hold then next usernumber and old password
    stmt.setString(2,uno);
    stmt.setString(3,pass);
    
    // Execute update query and close database connection
    int c=stmt.executeUpdate();
    if(c>0)
    {
        //out.println("updated");
   out.println("<center><h2><font color=green>THE SKA RAILWAYS</font></h2></center>");
			   out.println("<center><font color=blue><h3>MOBILE NUMBER SUCCESSFULLY UPDATED</h3></font></center>");
		       out.println("<center><img src=images/train10.jpg width=500 height=250></img></center>");
				out.println("<br>");
                 out.println("<center>");
                 out.println("<table border=2px bgcolor=#b0c4de>");
			  out.println("<tr>");
			  out.println("<th>USER NUMBER</th>");
			  out.println("<th>MOBILE NUMBER</th>");
              //out.println("<th>FARE</th>");
              //out.println("<th>TRAIN ADMIN</th>");
			  out.println("</tr>");
               out.println("<tr>");
			  out.println("<td>"+uno+"</td>");
			  //out.println("<td>"+st+"</td>");
              out.println("<td>"+mbl+"</td>");
              //out.println("<td>"++"</td>");
			  out.println("</tr>");
			  out.println("</table>");
			    out.println("</center>");
        

    }
    else{
        //out.println("no there is a problem");
    out.println("<center><font color=blue><h3>MOBILE NUMBER UPDATION UN SUCCESSFULL DUE TO WRONG PASSWORD</h3></font></center>");
    
    }
    conn.close();
%>

<html>
<head>
<title>PASSWORD UPDATE</title>

</head>
<body onkeydown="return(event.keyCode == 154)">
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 40%;
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
