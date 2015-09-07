<!doctype html>
<html lang="en" class="no-js">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title><g:layoutTitle default="Grails"/></title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        %{--<link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'title.jpg')}" type="image/x-icon" />--}%
        %{--<asset:javascript src="application.js"/>--}%
        %{--<asset:javascript href="bootstrap.min.js"/>--}%
        %{--<asset:stylesheet href="application.css"/>--}%
        <asset:image src="title.jpg"/>
        <asset:javascript src="jquery/jquery-2.1.1.js"/>
        <asset:stylesheet href="templatecss/animate.css" />
        <asset:stylesheet href="templatecss/bootstrap.min.css" />
        <asset:stylesheet href="templatecss/font-awesome.css" />
        <asset:stylesheet href="templatecss/morris-0.4.3.min.css" />
        <asset:stylesheet href="templatecss/style.css" />

        <g:layoutHead/>
    </head>
    <body>

        %{--<div id="grailsLogo" role="banner">--}%
            %{--<a href="http://grails.org">--}%
                %{--<asset:image src="grails_logo.png" alt="Grails"/>--}%
            %{--</a>--}%
        %{--</div>--}%

        <g:layoutBody/>

        %{--<div class="footer" role="contentinfo"></div>--}%
        %{--<div id="spinner" class="spinner" style="display:none;">--}%
            %{--<g:message code="spinner.alt" default="Loading&hellip;"/>--}%
        %{--</div>--}%

    </body>
</html>
