<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*,java.util.*" %>

<%!
    Connection con;
    PreparedStatement ps1;
	public void jspInit()
    {
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            ps1 = con.prepareStatement("select * from usern where name= ? and pass=?");
  
		}
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
<%!
    public void jspDestroy()
    {
        try
        {
    
            ps1.close();
        
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<%
        //int nt =Integer.parseInt(request.getParameter("acid"));
        String adname = request.getParameter("name");
        String adpass = request.getParameter("pass");
        
        ps1.setString(1,adname);
        ps1.setString(2,adpass);
        ResultSet rs = ps1.executeQuery();
        int cnt = 0;
        if (rs.next())
           cnt = rs.getInt(1);
        if(cnt == 0)
		{
              out.println("<center><h2><font color=red>Invalid credential</font></h2></center>");
              String t ="una1.jsp";
             response.sendRedirect(t);
		}
		else
        {
            out.println("<form><fieldset style= width:25%; >");
            out.println("<b><i><font color=red>Wel come MGR</font></i></b><br>"+adname);
            out.println("<b><i><font size=4 color=blue>Welcome To SKA Trains</font></i></b>");
            out.println("</fieldset></form>");
	 
			 
			 
        }
    
%>
