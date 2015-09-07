<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/7/15
  Time: 4:47 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
total tweets :${howmanytweets}
<p>${date1}</p>
<p>Positive : ${count3}</p>
<p>Neutral  : ${count2}</p>
<p>Negative : ${count1}</p>
<g:each in="${doc}" var="tweet">
    <p>${tweet}</p>
</g:each>


</body>
</html>

