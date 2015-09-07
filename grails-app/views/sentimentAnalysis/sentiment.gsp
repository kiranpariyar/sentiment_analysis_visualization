<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/18/15
  Time: 4:47 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>

<p>Hello Kiran</p>

<g:each in="${afterSentimentAnalysis}" var="tweet">
    <p>${tweet.tweet} :  ${tweet.sentimentRank} ${tweet.brandName}</p>
</g:each>

</body>
</html>