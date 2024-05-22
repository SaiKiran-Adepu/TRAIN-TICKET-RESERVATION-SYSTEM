<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.DriverManager" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>

<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

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
<body>

<%
Connection con = null;
PreparedStatement ps1 = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost/train", "root", "tiger");

    ps1 = con.prepareStatement("INSERT INTO train_sitting(name, age, gender, berth) VALUES (?, ?, ?, ?)");

    String[] pnameValues = request.getParameterValues("pname[]");
    String[] pageValues = request.getParameterValues("page[]");
    String[] pgenValues = request.getParameterValues("pgen[]");
    String[] pbthValues = request.getParameterValues("pbth[]");

    out.println("<center><table border='1'>");
    out.println("<tr><th>Passenger Name</th><th>Age</th><th>Gender</th><th>Berth</th></tr>");

    for (int i = 0; i < pnameValues.length; i++) {
        String pname = pnameValues[i];
        String pageValue = pageValues[i];
        String pgen = pgenValues[i];
        String pbth = pbthValues[i];

        // Input validation (you can add more checks based on your requirements)
        if (pname != null && pageValue != null && pgen != null && pbth != null) {
            ps1.setString(1, pname);
            ps1.setString(2, pageValue);
            ps1.setString(3, pgen);
            ps1.setString(4, pbth);

            int cnt = ps1.executeUpdate();

            if (cnt > 0) {
                 out.println("<center><font color=blue><h3>Passenger " + (i + 1) + " added successfully</h3></font></center>");

                out.println("<tr>");
                out.println("<td>" + pname + "</td>");
                out.println("<td>" + pageValue + "</td>");
                out.println("<td>" + pgen + "</td>");
                out.println("<td>" + pbth + "</td>");
                out.println("</tr>");
            } else {
                out.println("<center><font color=red><h3>Failed to add Passenger " + (i + 1) + "</h3></font></center>");
            }
        } else {
            out.println("<center><font color=red><h3>Invalid input for Passenger " + (i + 1) + "</h3></font></center>");
        }
    }

    out.println("</table></center>");

} catch (Exception ex) {
    out.println("<center><font color=red><h3>Error: " + ex.getMessage() + "</h3></font></center>");
    ex.printStackTrace();
} finally {
    try {
        if (ps1 != null) {
            ps1.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
}
 


    // Retrieve data from session
    Map<String, String> formData = (Map<String, String>) session.getAttribute("formData");
    
    if (formData == null) {
        // Handle the case where data is not found in the session
        formData = new HashMap<>();
    }
%>

<html>
<head>
    <title>Display Data Page</title>
</head>
<body>
    <h2>Form Data:</h2>
    <table border="1">
        <tr>
            <th>Field</th>
            <th>Value</th>
        </tr>
        <% for (Map.Entry<String, String> entry : formData.entrySet()) { %>
            <tr>
                <td><%= entry.getKey() %></td>
                <td><%= entry.getValue() %></td>
            </tr>
        <% } %>
    </table>
</body>
</html>


</body>
</html>
