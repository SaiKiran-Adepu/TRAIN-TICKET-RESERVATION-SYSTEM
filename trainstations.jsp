<%@ page import="java.sql.*" %>

<%!
    Connection con;
    PreparedStatement ps1;
    public void jspInit()
    {
        try
        { 
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
            ps1 = con.prepareStatement("select * from train_stations");
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>

<% 
    ResultSet rs = ps1.executeQuery();
    while(rs.next())
    {
        %>
        <option value='<%= rs.getString("station_name") %>'>
        <%
    }
%>

<%!
    public void jspDestroy()
    {
        try
        {       
            ps1.close();
            con.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
