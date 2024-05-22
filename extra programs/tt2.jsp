<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSP to JavaScript Example</title>
</head>
<body>
    <form>
        <input type="text" id="myTextbox">
    </form>

    <%
        int myIntValue = 42;
    %>

    <script>
        var intValue = <%= myIntValue %>;
        document.getElementById("myTextbox").value = intValue.toString();
    </script>
</body>
</html>
