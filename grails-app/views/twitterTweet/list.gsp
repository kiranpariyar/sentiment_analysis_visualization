<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/18/15
  Time: 4:11 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>

    <title></title>
</head>

<body>

<g:each in="${tweet}" var="t">
    <p>${t.tweet}</p>
</g:each>

</body>
</html>