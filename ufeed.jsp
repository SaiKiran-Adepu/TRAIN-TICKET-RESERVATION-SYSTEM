<%@ include file="packaget.jsp"%>
<html>
<head>
<title>User Feedback</title>
</head>

<center>
    <form method = "post" onSubmit="return login1(this)" action = "ufeedb.jsp">
        <fieldset style="width:23%; background-color:lightblue">
            <h3><center><font color="blue">Your FeedBack Page</font></center></h3>
            <hr>
            <table>
                <tr>
              <%
                      Integer i1=(Integer)session.getAttribute("nu"); 
                       int k1=i1.intValue();
                      out.println("<td><textarea rows1 cols=15 name=num1 hidden>"+k1+"</textarea></td>");//booked by from admin Window
                
              %>
                        
              
               </tr>
                <tr>
                    <td><font color="blue">Your FeedBack:</font></td>
                    <td><textarea name = "feed" id="feed"  Placeholder="YOUR FEEDBACK HERE"></textarea></td>
                </tr>
                <textarea id="demo11" name="dofdb1" hidden>
                </textarea>

<tr>
     <script>
                   window.onload = function () {
DisplayCurrentTime();
};


setInterval(() => {
                    var date = new Date();
var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();

var date_time =current_time+" "+current_date;	
document.getElementById("demo11").innerHTML = date_time;
                 }, 1000);

                     </script>
     
     </td>
     </tr>
                <tr>
                    <td></td>
                    <td><input type = "Submit" value="Submit FeedBack" name = "s1" onClick ="login1(this.form)">
                    <input type="reset" value="Reset" onclick="clearFunc()">
                    
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
    <br>
    <br>
      <!--<table border="4px" bordercolor="green">
  <tr>
  <td>
   <a href="feedbp.jsp"><font color="blue">Click Here For USERS FEEDBACK</font></a>
 </td>
 </tr>
 </table>-->
</center>