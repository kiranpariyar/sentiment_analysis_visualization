<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/23/15
  Time: 11:12 AM
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
        <h2>Brand List</h2>
        <ol class="breadcrumb">
            <li>
                <a href="">Home</a>
            </li>
            <li class="active">
                <strong>List</strong>
            </li>
        </ol>
    </div>
    <div class="col-lg-2">

    </div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <h5>List of Brands</h5>
                </div>
                <div class="ibox-content">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                    <th>Brand Name</th>
                                    <th>Search Term</th>
                                    <th class="center-orientation">Action</th>
                            </tr>
                        </thead>

                        <tbody>
                            <g:each in="${brand}" var="b">
                                <tr>
                                    <td>${b.brandName}</td>
                                    <td>${b.searchTerm}</td>
                                    <td>
                                        %{--<g:form controller="brand" action="edit">--}%
                                            %{--<input type="text" name="brandname" value="${b.brandName}"/>--}%
                                            %{--<input type="text" name="brandname" value="${b.searchTerm}"/>--}%
                                            %{--<g:submitButton name="edit" value="Edit"></g:submitButton>--}%
                                        %{--</g:form>--}%
                                        <g:form controller="brand" action="deleteBrand">
                                            <input type="text" name="brandName" value="${b.brandName}" style="display: none"/>
                                            <input type="text" name="searchTerm" value="${b.searchTerm}" style="display: none"/>
                                            <g:submitButton class="btn btn-sm" name="submit" value="Delete"></g:submitButton>
                                        </g:form>

                                        <g:form controller="dashboard" action="summary">
                                            <input type="text" name="name" value="${b.brandName}" style="display: none"/>
                                            <g:submitButton class="btn btn-primary btn-sm" name="submit" value="View Summary"></g:submitButton>
                                        </g:form>
                                    </td>
                                </tr>
                            </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

</body>

</html>