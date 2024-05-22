<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map" %>

<%
    // Retrieve the list of passenger data from the session
    List<Map<String, String>> passengerList = (List<Map<String, String>>) session.getAttribute("passengerList");

    // If the list is null, create an empty one
    if (passengerList == null) {
        passengerList = new ArrayList<>();
    }
%>

<html>
<head>
    <title>Display Passengers</title>
</head>
<body>
    <h2>Passenger Details:</h2>

    <!-- Display a table for each passenger's data -->
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Gender</th>
            <th>Berth</th>
        </tr>
        <!-- Loop through the passengerList and display data -->
        <% 
        for (Map<String, String> passengerData : passengerList) { 
           out.print("</tr>");
            //out.println("<td><textarea rows1 cols=15 name=pname[] readonly>"+pname2+"</textarea></td>");
               out.println("<td>"+passengerData.get("Name")+"</td>");
               out.println("<td>"+passengerData.get("Age")+"</td>");
                out.println("<td>"+passengerData.get("Gender")+"</td>");
                out.println("<td>"+passengerData.get("Berth")+"</td>");
                
           out.print("</tr>");
         }
          %>
    </table>
</body>
</html>
