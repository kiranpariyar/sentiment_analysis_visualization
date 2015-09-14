<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 9/2/15
  Time: 4:22 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>

    <title><g:layoutTitle default="Sentiment Analysis"/></title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'title.jpg')}" type="image/x-icon" />
<asset:javascript src="jquery/jquery-2.1.1.js" />
<asset:javascript src="bootstrapjs/bootstrap.min.js" />
<asset:stylesheet href="templatecss/bootstrap.min.css" />
<asset:stylesheet href="templatecss/font-awesome.css" />
<asset:stylesheet href="templatecss/animate.css" />
<asset:stylesheet href="templatecss/style.css" />
<asset:stylesheet href="templatecss/morris-0.4.3.min.css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">

<style type="text/css">.jqstooltip {
    position: absolute;left: 0px;top: 0px;
    visibility: hidden;
    background: rgba(0, 0, 0, 0.6);
    filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
    color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;
    padding: 5px;border: 1px solid white;z-index: 10000;}.jqsfield { color: white;font: 10px arial,
san serif;text-align: left;}
</style>

<g:layoutHead/>

</head>

<body class="pace-done">
<div class="pace  pace-inactive">
    <div class="pace-progress" data-progress-text="100%" data-progress="99" style="-webkit-transform: translate3d(100%, 0px, 0px); transform: translate3d(100%, 0px, 0px);">
        <div class="pace-progress-inner"></div>
    </div>
    <div class="pace-activity">
    </div>
</div>

<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav metismenu" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span>
                            %{--<img alt="image" class="img-circle" src="">--}%
                        </span>
                    </div>
                    <div class="logo-element">
                    </div>
                </li>
                <li>
                    <g:link controller="home" action="userform"><span class="nav-label"><i class="fa fa-th-large"></i>Add User</span></g:link>
                </li>
                <li>
                    <g:link controller="home" action="deleteUser"><span class="nav-label"><i class="fa fa-bar-chart-o"></i>Delete User</span></g:link>
                </li>

                <li>
                    <g:link controller="home" action="list"><span class="nav-label"><i class="fa fa-table"></i>List User</span></g:link>
                </li>

            </ul>

        </div>
    </nav>

    <div id="page-wrapper" class="gray-bg dashbard-1" style="min-height: 635px;">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">

                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Welcome to Social Media Listening</span>
                    </li>
                    <li class="dropdown">
                        <ul class="dropdown-menu dropdown-messages">
                            <li>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                </div>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="dropdown-messages-box">
                                </div>
                            </li>
                        </ul>
                    <li>
                        <g:link controller="User" action="login">
                            <i class="fa fa-sign-out"></i>
                            Log out
                        </g:link>
                    </li>
                </ul>

            </nav>
        </div>

        <g:layoutBody/>

    </div>

</div>


</body>

</html>