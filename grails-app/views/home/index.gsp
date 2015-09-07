<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 9/2/15
  Time: 11:03 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <asset:javascript src="jquery/jquery-2.1.1.js"/>
    <g:external dir="javascript" file="drawChart.js" />
</head>

<body>

<div id="positive" style="display: none;">${count[2]}</div>
<div id="neutral">${count[1]}</div>
<div id="negative">${count[0]}</div>

<div id="piechart" style="width: 900px; height: 500px;"></div>


</body>
</html>