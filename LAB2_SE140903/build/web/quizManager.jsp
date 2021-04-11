<%-- 
    Document   : quizManager
    Created on : Feb 7, 2021, 10:43:35 AM
    Author     : truon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
        <!--  All snippets are MIT license http://bootdey.com/license -->
        <title>Quiz Manager</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">

        <style type="text/css">
            body{
                background:#f5f5f5;
            }

            /* ===== Career ===== */
            .career-form {
                background-color: #4e63d7;
                border-radius: 5px;
                padding: 0 16px;
            }

            .career-form .form-control {
                background-color: rgba(255, 255, 255, 0.2);
                border: 0;
                padding: 12px 15px;
                color: #fff;
            }

            .career-form .form-control::-webkit-input-placeholder {
                /* Chrome/Opera/Safari */
                color: #fff;
            }

            .career-form .form-control::-moz-placeholder {
                /* Firefox 19+ */
                color: #fff;
            }

            .career-form .form-control:-ms-input-placeholder {
                /* IE 10+ */
                color: #fff;
            }

            .career-form .form-control:-moz-placeholder {
                /* Firefox 18- */
                color: #fff;
            }

            .career-form .custom-select {
                background-color: rgba(255, 255, 255, 0.2);
                border: 0;
                padding: 12px 15px;
                color: #000066;
                width: 100%;
                border-radius: 5px;
                text-align: left;
                height: auto;
                background-image: none;
            }

            .career-form .custom-select:focus {
                -webkit-box-shadow: none;
                box-shadow: none;
            }

            .career-form .select-container {
                position: relative;
            }

            .career-form .select-container:before {
                position: absolute;
                right: 15px;
                top: calc(50% - 14px);
                font-size: 18px;
                color: #ffffff;
                content: '\F2F9';
                font-family: "Material-Design-Iconic-Font";
            }

            .filter-result .job-box {
                -webkit-box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                border-radius: 10px;
                padding: 10px 35px;
            }

            ul {
                list-style: none; 
            }

            .list-disk li {
                list-style: none;
                margin-bottom: 12px;
            }

            .list-disk li:last-child {
                margin-bottom: 0;
            }

            .job-box .img-holder {
                height: 85px;
                width: 85px;
                background-color: #4e63d7;
                background-image: -webkit-gradient(linear, left top, right top, from(rgba(78, 99, 215, 0.9)), to(#5a85dd));
                background-image: linear-gradient(to right, rgba(78, 99, 215, 0.9) 0%, #5a85dd 100%);
                font-family: "Open Sans", sans-serif;
                color: #fff;
                font-size: 22px;
                font-weight: 700;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-pack: center;
                -ms-flex-pack: center;
                justify-content: center;
                -webkit-box-align: center;
                -ms-flex-align: center;
                align-items: center;
                border-radius: 65px;
            }

            .career-title {
                background-color: #4e63d7;
                color: #fff;
                padding: 15px;
                text-align: center;
                border-radius: 10px 10px 0 0;
                background-image: -webkit-gradient(linear, left top, right top, from(rgba(78, 99, 215, 0.9)), to(#5a85dd));
                background-image: linear-gradient(to right, rgba(78, 99, 215, 0.9) 0%, #5a85dd 100%);
            }

            .job-overview {
                -webkit-box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                box-shadow: 0 0 35px 0 rgba(130, 130, 130, 0.2);
                border-radius: 10px;
            }

            @media (min-width: 992px) {
                .job-overview {
                    position: -webkit-sticky;
                    position: sticky;
                    top: 70px;
                }
            }

            .job-overview .job-detail ul {
                margin-bottom: 28px;
            }

            .job-overview .job-detail ul li {
                opacity: 0.75;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .job-overview .job-detail ul li i {
                font-size: 20px;
                position: relative;
                top: 1px;
            }

            .job-overview .overview-bottom,
            .job-overview .overview-top {
                padding: 35px;
            }

            .job-content ul li {
                font-weight: 600;
                opacity: 0.75;
                border-bottom: 1px solid #ccc;
                padding: 10px 5px;
            }

            @media (min-width: 768px) {
                .job-content ul li {
                    border-bottom: 0;
                    padding: 0;
                }
            }

            .job-content ul li i {
                font-size: 20px;
                position: relative;
                top: 1px;
            }
            .mb-30 {
                margin-bottom: 30px;
            }
            .header-area {
                position: relative;
                height: 10vh;
                background: #5bc0de;
                background-attachment: fixed;
                background-position: center center;
                background-repeat: no-repear;
                background-size: cover;
            }
            .navbar {
                position: absolute;
                left: 0;
                top: 0;
                padding: 0;
                width: 100%;
                transition: background 0.6s ease-in;
                z-index: 99999;
            }
            .navbar .navbar-brand {
                font-family: 'Lobster', cursive;
                font-size: 2.5rem;
            }

            .p-table th,
            .p-table td {
                vertical-align: middle !important;
            }


            .p-team img {
                width: 35px;
                height:35px;
                border-radius: 4px;
            }

            .p-progress .progress {
                margin-bottom: 5px;
            }

            .p-name a {
                font-size:14px;
                /*font-weight:bold;*/
            }

            .bold {
                font-weight: bold;
            }

            .p-details .bio-row p span {
                width: auto;
            }

            .p-details .bio-row p span.bold {
                width: 100px;
            }

            .p-team a {
                display: inline-block;
            }

            .project-heading {
                font-size: 20px;
            }

            .mtop20 {
                margin-top: 20px;
            }

            .p-files li a {
                margin-bottom: 10px;
                color: #949494;
                display: block;
            }

            .p-files li i {
                padding-right: 10px;
                width: 20px;
            }

            .p-tag-list li {
                display: inline-block;
                margin:0 5px 7px 0;
            }

            .p-tag-list li a {
                display: inline-block;
                border: 1px solid #ddd;
                padding: 3px 10px;
                color:#797979;
                border-radius: 4px;
                font-size:12px;
            }

            .p-tag-list li a:hover {
                background: #ff6c60;
                border-color: #ff6c60;
                color:#fff;
            }

            .m-thumb img {
                width: 100%;
                border:1px solid #ddd;
            }




            .btn-default {
                background-color: #bec3c7;
                border-color: #bec3c7;
                color: #fff;
            }

            .btn-default:hover, .btn-default:focus, .btn-default:active, .btn-default.active, .open .dropdown-toggle.btn-default {
                background-color: #b0b5b9;
                border-color: #b0b5b9;
                color: #fff;
            }

            .btn-primary ,
            .btn-primary.disabled,
            .btn-primary[disabled],
            .btn-primary.disabled.active,
            .btn-primary.active[disabled]{
                background-color: #41cac0;
                border-color: #41cac0;
                color: #FFFFFF;
            }

            .btn-primary:hover, .btn-primary:focus, .btn-primary:active, .btn-primary.active, .open .dropdown-toggle.btn-primary,
            .btn-primary.disabled,
            .btn-primary[disabled],
            .btn-primary.disabled.active,
            .btn-primary.active[disabled]{
                background-color: #39b2a9;
                border-color: #39b2a9;
                color: #FFFFFF;
            }

            .btn-success {
                background-color: #78CD51;
                border-color: #78CD51;
                color: #FFFFFF;
            }

            .btn-success:hover, .btn-success:focus, .btn-success:active, .btn-success.active, .open .dropdown-toggle.btn-success {
                background-color: #6dbb4a;
                border-color: #6dbb4a;
                color: #FFFFFF;
            }

            .btn-info {
                background-color: #58c9f3;
                border-color: #58c9f3;
                color: #FFFFFF;
            }

            .btn-info:hover, .btn-info:focus, .btn-info:active, .btn-info.active, .open .dropdown-toggle.btn-info {
                background-color: #53bee6;
                border-color: #53BEE6;
                color: #FFFFFF;
            }

            .btn-warning {
                background-color: #f1c500;
                border-color: #f1c500;
                color: #FFFFFF;
            }

            .btn-warning:hover, .btn-warning:focus, .btn-warning:active, .btn-warning.active, .open .dropdown-toggle.btn-warning {
                background-color: #e4ba00;
                border-color: #e4ba00;
                color: #FFFFFF;
            }

            .btn-danger {
                background-color: #ff6c60;
                border-color: #ff6c60;
                color: #FFFFFF;
            }

            .btn-danger:hover, .btn-danger:focus, .btn-danger:active, .btn-danger.active, .open .dropdown-toggle.btn-danger {
                background-color: #ec6459;
                border-color: #ec6459;
                color: #FFFFFF;
            }


            .btn-white {
                box-shadow: none !important;
            }



            .label {
                padding: 0.5em 0.8em;
            }

            .label-default {
                background-color: #a1a1a1;
            }

            .label-primary {
                background-color: #59ace2;
            }

            .label-success {
                background-color: #A9D86E;
            }

            .label-info {
                background-color: #8175c7;
            }

            .label-warning {
                background-color: #FCB322;
            }

            .label-danger {
                background-color: #FF6C60;
            }

            .label-inverse {
                background-color: #344860;
            }
            .panel-heading{
                margin-top:25px;
                margin-bottom:10px;
                margin-left:84%;
            }




        </style>
    </head>
    <body>
        <header class="header-area overlay">
            <nav class="navbar navbar-expand-md navbar-dark">
                <div class="container">
                    <a style="color: white" class="navbar-brand">Quiz Online Manager</a>
                    <div id="main-nav" class="collapse navbar-collapse">
                        <ul class="navbar-nav ml-auto">
                            <li><a style="color: white" class="nav-item nav-link active">Welcome ${sessionScope.LOGIN_USER.getName()}</a></li>					
                            <li><a href="Logout" class="nav-item nav-link">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>


        </header>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <script src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" data-auto-replace-svg="nest"></script>
        <div class="container">
            <div class="row">
                <div class="col-lg-10 mx-auto mb-4">
                    <div class="section-title text-center ">                       
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="career-search mb-60">

                        <form action="SearchAD" class="career-form mb-60">
                            <div class="row">
                                <div class="col-md-6 col-lg-3 my-3">
                                    <div class="input-group position-relative">
                                        <input type="text" name="txtQuestionSearch" value="${param.txtQuestionSearch}" class="form-control" placeholder="Enter Question" id="keywords">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3 my-3">
                                    <div class="select-container">
                                        <select class="custom-select" name="txtSubjectSearch">
                                            <option value="" selected>Select Subject</option>
                                            <c:set var="list" value="${sessionScope.LIST_SUBJECT}"></c:set>
                                            <c:set var="subjectSearch" value="${param.txtSubjectSearch}"></c:set>
                                            <c:if test="${not empty list}">
                                                <c:forEach var="e" items="${list}" varStatus="counter">
                                                    <option value="${e.subjectID}" <c:if test="${subjectSearch ==e.subjectID}">selected</c:if>>${e.subjectName}</option>
                                                </c:forEach>
                                            </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-3 my-3">
                                    <div class="select-container">
                                        <select class="custom-select" name="txtStatusSearch">
                                            <c:set var="statusSearch" value="${param.txtStatusSearch}"></c:set>
                                            <option value="" selected>Question Status</option>
                                                <option value="active" <c:if test="${statusSearch =='active'}">selected</c:if>>Active</option>
                                            <option value="deActive" <c:if test="${statusSearch =='deActive'}">selected</c:if>>deActive</option>                                            
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-3 my-3">
                                        <button type="submit" class="btn btn-lg btn-block btn-light btn-custom" id="contact-submit">
                                            Search
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>



                    </div>
                </div>

            </div>

            <div class="container">
                <section class="panel">
                    <header class="panel-heading">
                        <span class="pull-right ml-auto">                     
                            <a href="add" class=" btn btn-success btn-xs"> Create New Question</a>
                        </span>
                    </header>

                    <table class="table table-hover p-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Subject</th>
                                <th>Status</th>
                                <th>Custom</th>
                            </tr>
                        </thead>

                        <tbody>
                        <c:set var="list" value="${sessionScope.LIST_QUESTIONS_AD}"></c:set>
                        <c:if test="${not empty list}">
                            <c:forEach var="e" items="${list}" varStatus="counter"> 
                                <tr>
                                    <td>
                                        ${e.questionID}
                                    </td>
                                    <td width="40%" class="p-name">
                                        <a >${e.question_content}</a>
                                        <br>
                                        <small>Created ${e.createDate}</small>
                                    </td> 

                                    <td class="p-progress">
                                         <c:set var="listAnswer" value="${e.listAnswer}"></c:set>
                                         <c:if test="${not empty listAnswer}">
                                        <ol type="a">
                                            <c:forEach var="answer" items="${listAnswer}" varStatus="counter">
                                                <li <c:if test="${answer.statusResult}">class="alert alert-success" role="alert"</c:if>>${answer.answer_content}</li>
                                            </c:forEach>
                                            
                                            
                                            </ol> 
                                        </c:if>
                                        </td>
                                        <td class="p-progress">
                                            <a >${e.subjectID}</a>                                                                    
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${e.status == 'active'}">
                                                <span class="label label-primary">Active</span>
                                            </c:when>                    
                                            <c:otherwise>
                                                <span class="label label-default">Inactive</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td width="17.6%">
                                        <a href="ShowEdit?questionID=${e.questionID}" class="btn btn-info btn-xs"><i class="far fa-edit"></i> Edit </a>
                                        <a href="DeleteQuestion?questionID=${e.questionID}" class="btn btn-danger btn-xs"><i class="far fa-trash-alt"></i> Delete </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </section>

            <!-- START Pagination -->

            <nav aria-label="Page navigation">
                <ul class="pagination pagination-reset justify-content-center">
                    <c:url var="nextpage" value="SearchAD">
                        <c:param name="txtQuestionSearch" value="${param.txtQuestionSearch}"></c:param>
                        <c:param name="txtSubjectSearch" value="${param.txtSubjectSearch}"></c:param>
                        <c:param name="txtStatusSearch" value="${param.txtStatusSearch}"></c:param>
                    </c:url>
                    <c:if test="${requestScope.currentPage > 1}">
                        <li class="page-item">
                            <a class="page-link" href="${nextpage}&page=${requestScope.currentPage - 1}" tabindex="-1" aria-disabled="true">
                                <i class="zmdi zmdi-long-arrow-left"></i>
                            </a>
                        </li>                  
                    </c:if>                                           
                    <c:forEach begin="1" end="${requestScope.noOfPages}" var="i">
                        <c:choose >
                            <c:when test="${requestScope.currentPage == i}">                                       
                                <li class="page-item"><a class="page-link" style="color: red">${i}</a></li>                                     
                                </c:when>
                                <c:otherwise>
                                <li class="page-item"><a class="page-link" href="${nextpage}&page=${i}">${i}</a></li>                    
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${requestScope.currentPage < requestScope.noOfPages}">
                        <li class="page-item">
                            <a class="page-link" href="${nextpage}&page=${requestScope.currentPage + 1}">
                                <i class="zmdi zmdi-long-arrow-right"></i>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </nav>

            <!-- END Pagination -->

        </div>
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
