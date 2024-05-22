<%@ include file="packaget.jsp"%>
<html>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 90%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
textarea {
  resize: none;
}
</style>
<title>BOOKING TICKET</title>
</head>

<script>
	         
    function tc()
	{
		var tcl  = document.getElementById("tcl").value;
        var fr  = document.getElementById("fr").value;
	
    }


</script>
<body onkeydown="return(event.keyCode == 154)">


</body>

</html>

<%

   


     String s = request.getParameter("username");
        String d = request.getParameter("pass");
        String tcl = request.getParameter("gen");
        String tt = request.getParameter("addr");
        String tcl1 = request.getParameter("phn");
         String dob = request.getParameter("dob");
        String tt1 = request.getParameter("dob");
        String idt = request.getParameter("idt");
        //String idt = request.getParameter("phn");
        String idn = request.getParameter("idn");
        String dor = request.getParameter("dor");
              out.println("<center>");
		    out.println("<table border=3 bgcolor= orange>");
		    out.println("<tr>");
		          out.println("<th>TRAIN NUMBER</th>");
		         out.println("<th>TRAIN NAME</th>");
          out.println("<th>FROM</th>");
          out.println("<th>TO</th>");
          out.println("<th>CLASS</th>"); //Sec to kazipet
           out.println("<th>TICKET TYPE</th>");
           //out.println("<th>BASE FARE</th>");
           //out.println("<th>COUCH CHARGE</th>");//from to
           out.println("<th>FARE</th>");
           out.println("<th>KM</th>");
           //out.println("<th>DATE OF JURNEY</th>");
          out.println("<th>ACTION</th>");
         
		       out.println("</tr>");
            out.println("<tr>");
          
            out.println("<td><textarea rows1 cols=15 name=s readonly>"+s+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=d readonly>"+d+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tcl readonly>"+tcl+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+tt+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+idt+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+idn+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+tcl1+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+dob+"</textarea></td>");
            out.println("<td><textarea rows1 cols=15 name=tt readonly>"+dor+"</textarea></td>");
            out.println("<br>");
             
                out.println("</table>");
		      out.println("</center>");
   
%>


