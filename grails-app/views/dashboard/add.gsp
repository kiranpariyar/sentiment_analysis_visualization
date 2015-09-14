<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 9/7/15
  Time: 10:32 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://webapplayers.com/inspinia_admin-v2.2/index.html -->
<html>
<head>

    <meta name="layout" content="home"/>
    <title>brand form</title>
</head>

<body>

<div class="pace-done">
    <div class="row wrapper border-bottom white-bg page-heading">
        <div class="col-lg-10">
            <h2>Brand is not added in the system so Add brand first.</h2>
        </div>
        <div class="col-lg-2">

        </div>
    </div>

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-lg-7">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>Fill Following Form</h5>
                    </div>
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-lg-6">
                                <g:form class="m-t" controller = "brand" action = "addBrand">
                                    <div class="form-group">
                                        <input name="brandName" class="form-control" placeholder="Brand Name" required="required" />
                                    </div>
                                    <div class="form-group">
                                        <input name="searchTerm" class="form-control" placeholder="Search Term" />
                                    </div>
                                    <g:submitButton class="btn btn-primary block m-b" name="submitButton" value="Save" />
                                </g:form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>