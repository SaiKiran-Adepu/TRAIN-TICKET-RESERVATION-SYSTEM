<%@ include file="sessionvala.jsp"%>
<%@ include file="packaget.jsp"%>
 <!doctype html>
 <html lang="en">
    <head>
        <title>General TICKET</title>
		<script LANGUAGE="JavaScript">
         
    function login(form)
	{
		var t1 = document.getElementById("train1").value;
		var t2 = document.getElementById("train2").value;
		var ad = document.getElementById("ad").value;
		//ad=0;
		//var ch = document.getElementById("ch").value;
		
		if(t1 =='')
		{
			alert("Please Select From");
			return false;
		}
		else if(t2=='')
		{
        	alert("Please select TO");
			return false;
		}
		else if(document.F1.train1.value==document.F1.train2.value)
       {
	     alert("Your Selected Same Stations !"); 
	     document.F1.train1.focus();
	     document.F1.train2.value="";	
	     return false;
		 
	   }
	    /*else if(ad=='')
		{
        	ad=0;
			//
			alert("Please select Number of Adults");
			document.getElementById("ad").innerHTML = ad;
			return false;
		}*/
		
		
	}
		function clearFunc()
	{
		document.getElementById("email").value="";
		document.getElementById("pwd1").value="";
	}	
		</script>
			 <style>
        /* Style for the button */
        .transparent-button {
            background: transparent;
            border: none;
            cursor: pointer;
            padding: 0;
			
    }
	  .clickable-img {
        cursor: pointer; /* Change cursor to pointer when hovering over the image */
        }
    </style>
		<script>
		   function swapText() {
            // Get the values from the text boxes
            var textBox1Value = document.getElementById("train1").value;
            var textBox2Value = document.getElementById("train2").value;

            // Swap the values
            document.getElementById("train1").value = textBox2Value;
            document.getElementById("train2").value = textBox1Value;
        }
		</script>
		  </head>
    <body>


	<center>
        <form name=F1 method = "POST" onSubmit="return login(this)" action ="genticketb.jsp">
			<fieldset style="width:28%; background-color:#B3DED4; border-end-start-radius:25;">
           <h3><font>GENERAL TICKET</font></h3>
			<table>
			<tr><td><img src="images/from2.png" width="21" height="16">
			FROM:<font color="red">*</font>&nbsp:</td>
			<td><input list="source" name="SOURCE" id="train1" placeholder="FROM"></td></tr>

			<datalist id="source" name="train1">
			  <%@ include file="trainstations1.jsp" %>
			</datalist>
	<tr>
		<td></td><td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

        
<img src="images/updo.png" alt="Arrow Up" width="20" height="20" onclick="swapText()" class="clickable-img">

  </td>
	
	</tr>
			<tr><td><img src="images/to.jpg" width="22" height="16">
			TO:<font color="red">*</font>&nbsp:</td>
			<td><input list="dest" name="DEST" id="train2" placeholder="TO"></td></tr>
			<datalist id="dest" name="train2">
				 <%@ include file="trainstations.jsp" %>
			</datalist>
		
			  <tr>

  <td>ADULT:<font color="red">*</font>&nbsp:</td><td><input type = "number" name = "ad" id="ad" value=0 Placeholder="NUMBER OF ADULT"></td>
     </tr>

	 <tr>
	 <td>CHILD:<font color="red">*</font>&nbsp:</td><td> <input type = "number" name = "ch" id="ch" value=0 Placeholder="NUMBER OF CHILD"></td>             
      </tr>
	
  <tr>
  <td>
 <textarea id="demo1" name="dcut"readonly  hidden>
                               </textarea>				      		
							<script>
                                  window.onload1 = function () {
        DisplayCurrentTime();
    };

  
	setInterval(() => {
                                   var date = new Date();
	var current_date = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+ date.getDate();
	var current_time = date.getHours()+":"+date.getMinutes()+":"+ date.getSeconds();
	
	var date_time =current_time+" "+current_date;	
	document.getElementById("demo1").innerHTML = date_time;
							    }, 1000);
    							
   	                             </script>
 </td>
  </tr>
  </table>
 
					<input type = "submit" value="CUT" onClick ="login(this.form)">
					<input type="button" value="BACK!" onclick="history.back()">
				<input type="reset" value="RESET" onclick="clearFunc()">
					</fieldset>
        </form>
		     <br>
 </center>
	</body>
</html>