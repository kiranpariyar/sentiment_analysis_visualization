<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/14/15
  Time: 2:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>

    <meta name="layout" content="start"/>
    <title>Social Media Analysis And Listening | Login</title>

</head>

<body>

    %{--<div class="middle-box text-center loginscreen animated fadeInDown">--}%
    <div class="middle-box text-center loginscreen animated fadeInDown">

                <div style="margin-top: 150px">
                    <h3>Welcome to Social Media Listening And Analysis</h3>
                    <g:form class="m-t" url="[controller:'user',action:'loginHandle']">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Username" required="required" name="username">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" required="required" name="password">
                        </div>
                        <g:submitButton class="btn btn-primary block full-width m-b" name="submitButton" value="Login" />
                    </g:form>
                </div>

    </div>

</body>

</html>