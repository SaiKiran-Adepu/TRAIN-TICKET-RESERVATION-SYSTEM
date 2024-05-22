<html>
<head>
<title>LogOut</title>
</head>
<body>
<% session.invalidate(); %>
<% HttpSession ses = request.getSession(false);
if(ses != null) {
   out.print(session.getAttribute("sessionAttr"));
}
else
{
  //out.println("<center><front color=green><h2>Logout Successfully</h2></font></center>");
  //out.println("<a href=index.html>Go to login page</h1>");
   response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
    response.setHeader("Pragma","no-cache");
	response.setHeader("Expires","0");
}
%>


<center><h3><font font color="blue"><p>You Have Been Successfully Logout</p></font></h3>
<a href="index.html"><IMG SRC="images/home1.gif"></img></a>
</center>

</body>
</html>
