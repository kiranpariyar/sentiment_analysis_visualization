<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 9/9/15
  Time: 1:02 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="home"/>
    <title>comparision</title>
</head>

<body>
<div class="pace-done">

    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-4">
            <h2>Compare Between Brands</h2>
        </div>

        <div class="col-lg-8">
            <div style="margin-top: 20px;">
                <g:form controller="comparision" action="compare" class="form-inline">
                    <div class="form-group col-lg-2">
                        <select name="brand1" title="select_brand1" class="form-control">
                            <g:each in="${brandList}" var="brand">
                                <option value="${brand.brandName}">${brand.brandName}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="form-group col-lg-2">
                        <select name="brand2" title="select_brand2" class="form-control">
                            <g:each in="${brandList}" var="brand">
                                <option value="${brand.brandName}">${brand.brandName}</option>
                            </g:each>
                        </select>
                    </div>
                    <div class="form-group col-lg-2">
                        <g:submitButton class="btn btn-primary" name="submit" value="compare">compare</g:submitButton>
                    </div>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>