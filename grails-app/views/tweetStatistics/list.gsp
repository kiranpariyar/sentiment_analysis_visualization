<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/10/15
  Time: 5:45 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<p>${count2}</p>

Hello kiran

<g:each in="${doc}" var="tweet">
    <p>${tweet.tweet}    :    ${tweet.date}</p>
</g:each>

<g:each in="${doc2}" var="tweet2">
    <p>${tweet2.tweet}    :    ${tweet2.sentimentRank}</p>
</g:each>

<g:each in="${doc3}" var="tweet3">
    <p>${tweet3.tweet}    :    ${tweet3.date}</p>
</g:each>

</body>
</html>