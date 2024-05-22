<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.PreparedStatement, java.sql.DriverManager" %>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.net.URLEncoder"%>

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

<input type="text" name="pname" readonly="readonly" value='<%= (pnameValues != null && pnameValues.length > 0) ? "" : pname %>' hidden/>
<%

String[] pnameValues = request.getParameterValues("pname[]");
String[] pageValues = request.getParameterValues("page[]");
String[] pgenValues = request.getParameterValues("pgen[]");
String[] pbthValues = request.getParameterValues("pbth[]");

for (int i1 = 0; i1 < pnameValues.length; i1++) {
    String pname2 = pnameValues[i1];
    String page2 = pageValues[i1];
    String pgen2 = pgenValues[i1];
    String pbth2 = pbthValues[i1];
}

%>
<input type="text" name="pname2" readonly="readonly" value='<%= (pnameValues != null && pnameValues.length > 0) ? pname2 : "" %>' />


</body>
</html>
