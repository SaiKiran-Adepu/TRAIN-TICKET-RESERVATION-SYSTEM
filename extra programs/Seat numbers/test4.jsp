<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Map" %>

<%
    List<Map<String, String>> passengerList = new ArrayList<>();
    String[] passengerNames = request.getParameterValues("pname[]");
    String[] passengerAges = request.getParameterValues("page[]");
    String[] passengerGenders = request.getParameterValues("pgen[]");
    String[] passengerBerths = request.getParameterValues("pbth[]");

    if (passengerNames != null && passengerAges != null && passengerGenders != null && passengerBerths != null) {
        for (int i = 0; i < passengerNames.length; i++) {
            String name = passengerNames[i];
            String age = passengerAges[i];
            String gender = passengerGenders[i];
            String berth = passengerBerths[i];
            Map<String, String> passengerData = new HashMap<>();
            passengerData.put("Name", name);
            passengerData.put("Age", age);
            passengerData.put("Gender", gender);
            passengerData.put("Berth", berth);
            passengerList.add(passengerData);
             out.println(name);
             out.println(age);
             out.println(gender);
             out.println(berth);
        }
    }
    session.setAttribute("passengerList", passengerList);
    response.sendRedirect("test5.jsp");
%>
