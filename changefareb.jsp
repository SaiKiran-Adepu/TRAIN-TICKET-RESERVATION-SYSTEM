<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>
<%
    int fare = Integer.parseInt(request.getParameter("fare"));
    String frm = request.getParameter("frm");
    String adm = request.getParameter("adm");
    
    // Connect to MySQL database
    String url = "jdbc:mysql://localhost:3306/train";
    String user = "root";
    String password = "tiger";
    Connection conn = DriverManager.getConnection(url, user, password);
    
    // Create prepared statement for update query
    String query = "UPDATE train_fare SET fare = ?, TAD = ? WHERE Fstation=?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setInt(1, fare);
    stmt.setString(2, adm);
    stmt.setString(3, frm);
    
    // Execute update query and close database connection
    int c = stmt.executeUpdate();
    if (c > 0) {
        out.println("<center><h2><font color='green'>THE SKA RAILWAYS</font></h2></center>");
        out.println("<center><font color='blue'><h3>TRAIN FARE SUCCESSFULLY UPDATED</h3></font></center>");
        out.println("<center><img src='images/train14.jpg' width='500' height='250'></img></center>");
        out.println("<br>");
        out.println("<center>");
        out.println("<table border='2px' bgcolor='#b0c4de'>");
        out.println("<tr>");
        out.println("<th>STATION NAMES</th>");
        out.println("<th>FARE</th>");
        out.println("<th>TRAIN ADMIN</th>");
        out.println("</tr>");
        out.println("<tr>");
        out.println("<td>" + frm + "</td>");
        out.println("<td>" + fare + "</td>");
        out.println("<td>" + adm + "</td>");
        out.println("</tr>");
        out.println("</table>");
        out.println("</center>");
    } else {
        out.println("<center><font color='red'><h3>TRAIN FARE UPDATION UNSUCCESSFUL DUE TO SELECTED ONLY ONE STATION NAME:</h3></font><font color='blue'> " + frm + "</font></center>");
    }
    conn.close();
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TRAIN FARE UPDATE</title>
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
</head>
<body onkeydown="return(event.keyCode == 154)">
</body>
</html>
