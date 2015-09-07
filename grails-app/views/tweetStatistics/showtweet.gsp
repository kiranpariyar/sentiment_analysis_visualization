<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/10/15
  Time: 6:10 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<g:each in="${doc}" var="tweet">
    <p>${tweet.tweet} : ${tweet.date}    ${tweet.sentimentRank}</p>
</g:each>
<p>Total Negative Tweet = ${negative}</p>



</body>
</html>