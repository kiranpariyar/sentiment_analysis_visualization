<%--
  Created by IntelliJ IDEA.
  User: kiran
  Date: 8/21/15
  Time: 11:34 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<!-- saved from url=(0054)http://webapplayers.com/inspinia_admin-v2.2/index.html -->
<html>
<head>

    <meta name="layout" content="admintemplate"/>

</head>

<body>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>Basic Form</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="">Home</a>
                    </li>
                    <li class="active">
                        <strong>Add User</strong>
                    </li>
                </ol>
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
                                    <g:form controller="user" action="addUser">
                                        <div class="form-group"><label>First Name</label>
                                            <g:textField type="text" name= "firstName" placeholder="Enter First Name" class="form-control"/>
                                        </div>
                                        <div class="form-group"><label>Last Name</label>
                                            <g:textField type="text" name="lastName" placeholder="Password" class="form-control"/>
                                        </div>
                                        <div class="form-group"><label>User Name</label>
                                            <g:textField type="text" name="username" placeholder="Enter User Name" class="form-control"/>
                                        </div>
                                        <div class="form-group"><label>Password</label>
                                            <g:passwordField type="password" name="password" placeholder="Password" class="form-control"/>
                                        </div>
                                        <div class="form-group"><label>Address</label>
                                            <g:textField type="text" name="address" placeholder="Enter Address" class="form-control"/>
                                        </div>
                                        <div class="form-group"><label>Phone Number</label>
                                            <g:textField type="text" name="phoneNumber" placeholder="Enter phoneNumber" class="form-control"/>
                                        </div>
                                        <div>
                                            <g:submitButton class="btn btn-sm btn-primary pull-right m-t-n-xs" name="submitButton" value="Create User" ></g:submitButton>
                                        </div>
                                    </g:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">
                    </div>
                </div>
                <div class="footer">
                    <div class="pull-right">
                    </div>
                </div>
            </div>
        </div>


</body>

</html>