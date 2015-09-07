<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/24/15
  Time: 11:31 AM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <meta name="layout" content="main"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Social Media Listerning</title>

</head>

<body style="background-color: #a6e1ec">
<p>This text should remain and unaffected because the form below will use AJAX</p>

<div id="mainContent">
<g:formRemote url="[controller:'sentimentAnalysis', action:'retrieveTweets']" update="mainContent" name="getTweet">
    <div class="form-group">
        <g:textField name="searchTerm" class="form-control" placeholder="search term" />
    </div>
    <g:submitButton class="btn btn-primary block full-width m-b" name="submitButton" value="Get Data" />
</g:formRemote>

</div>

<g:remoteLink controller="sentimentAnalysis" action="ajaxtest"
              update="ajaxContent">Render String</g:remoteLink><br/>

<div id="ajaxContent">
</div>


</body>
</html>