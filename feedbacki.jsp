<html>
<head>
    <title>Your Feedback</title>
</head>
<body>

    <center>
        <form method = "post" onSubmit="return login1(this)" action = "feedbackdui.jsp">
            <fieldset style="width:23%; background-color:lightblue">
                <h3><center><font color="blue">Your FeedBack</font></center></h3>
                <hr>
                <table>
                    <tr>
                        <td><font color="blue">Name:</font></td>
                        <td> <input type = "text" name = "name" id="name" Placeholder="NAME"></td>
                    </tr>
                    <tr>
                        <td><font color="blue">FeedBack:</font></td>
                        <td><textarea name = "feed" id="feed"  Placeholder="YOUR FEEDBACK HERE"></textarea></td>
                    </tr>
					<textarea id="demo11" name="dofdb" hidden>
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
         
	</center>
 



</body>
</html>