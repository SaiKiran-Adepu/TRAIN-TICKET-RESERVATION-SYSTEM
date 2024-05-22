<%@ page isErrorPage="true" %>  
<%@ include file="sessionvaltu.jsp"%>
  
<center><h3><font color="red">SORRY NO SUFFIECENT MONEY AVAILABLE ON THAT AC!</font></h3>
   
  
Exception is: <%= exception %> 

<%  String redirectURL ="nobals.jsp";
           response.sendRedirect(redirectURL);
		   %>
		   </center>