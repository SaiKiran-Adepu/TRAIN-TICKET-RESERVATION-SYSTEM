<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Passenger</title>
    <script type="text/javascript">
        function addFields() {
            var container = document.getElementById("dynamicFields");
            var newFieldSet = document.createElement("fieldset");
            newFieldSet.innerHTML =
                '<legend>Passenger</legend>' +
                'Passenger Name: <input type="text" name="pname[]" /><br><br>' +
                'Passenger Age: <input type="text" name="page[]" /><br><br>' +
                'Passenger Gender: <input type="text" name="pgen[]" /><br><br>' +
                'Passenger Berth: <input type="text" name="pbth[]" /><br><br>';
            newFieldSet.style.maxWidth = "410px";
            container.appendChild(newFieldSet);
        }

        function removeLastField() {
            var container = document.getElementById("dynamicFields");
            var fieldsets = container.getElementsByTagName("fieldset");
            if (fieldsets.length > 1) {
                container.removeChild(fieldsets[fieldsets.length - 1]);
            } else {
                alert("Cannot remove the last passenger field.");
            }
        }
    </script>
</head>
<body>
    <form action="test4.jsp" method="post" width="30%">
        <div id="dynamicFields">
            <!-- Initial fields -->
            <fieldset style="width:28%">
                <legend>Passenger Details</legend>
                Name: <input type="text" name="pname[]" /><br><br>
                Age: <input type="text" name="page[]"/><br><br>
                Gender: <input type="text" name="pgen[]" /><br><br>
                Berth: <input type="text" name="pbth[]" /><br><br>
            </fieldset>
        </div>
        <br>
        <input type="button" value="Add Passenger" onclick="addFields()" />
        <input type="button" value="Remove Passenger" onclick="removeLastField()" />
        <input type="submit" value="Submit" />
    </form>
</body>
</html>
