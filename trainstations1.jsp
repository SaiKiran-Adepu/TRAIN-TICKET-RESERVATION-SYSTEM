<%@ page import="java.sql.*" %>

<%!
    Connection con1;
    PreparedStatement ps11;
%>

<%
    try
    { 
        Class.forName("com.mysql.jdbc.Driver");
        con1 = DriverManager.getConnection("jdbc:mysql://localhost/train","root","tiger");
        ps11 = con1.prepareStatement("select * from train_stations");
        
        ResultSet rs1 = ps11.executeQuery();
        while(rs1.next())
        {
            %>
            <option value='<%= rs1.getString("station_name") %>'>
            <%
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }
    finally
    {
        try
        {       
            if(ps11 != null) ps11.close();
            if(con1 != null) con1.close();
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
%>
