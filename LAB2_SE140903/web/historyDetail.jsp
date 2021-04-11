<%-- 
    Document   : historyDetail
    Created on : Feb 13, 2021, 5:58:34 PM
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
        <title>Quiz History Detail</title>
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
                    <a style="color: white" class="navbar-brand" href="quiz">Quiz History Detail</a>
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
            <section class="panel">


                <table class="table table-hover p-table">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>ID</th>
                            <th>Question</th>
                            <th>Answer</th>


                        </tr>
                    </thead>

                    <tbody>
                        <c:set var="list" value="${sessionScope.HISTORY_EXAM_DETAIL}"></c:set>
                        <c:if test="${not empty list}">
                            <c:forEach var="e" items="${list}" varStatus="counter">                                 
                                 <c:forEach var="listAnswers" items="${e.listAnswer}" varStatus="counterr">
                                     <c:if test="${listAnswers.statusResult}">
                                         <c:set var="answerCorrectID" value="${listAnswers.answerID}"></c:set>           
                                     </c:if>
                                 </c:forEach>
                                <tr>
                                    <td>
                                        ${counter.count}
                                    </td>
                                    <td>
                                        ${e.questionID}
                                    </td>
                                    <td width="40%" class="p-name">
                                        <a >${e.question_content}</a>
                                        <br>
                                    </td> 
                                    <td class="p-progress">
                                        <c:choose>
                                            <c:when test="${e.statusAnswer}">
                                                <ol type="a">
                                                    <li <c:if test="${e.listAnswer.get(0).statusResult}">class="alert alert-success" role="alert"</c:if>>
                                                        ${e.listAnswer.get(0).answer_content} <c:if test="${e.listAnswer.get(0).answerID == answerCorrectID}"><i class="far fa-check-circle" style="color: #33ff66"></i></c:if></li>
                                                    <li <c:if test="${e.listAnswer.get(1).statusResult}">class="alert alert-success" role="alert"</c:if>>
                                                        ${e.listAnswer.get(1).answer_content} <c:if test="${e.listAnswer.get(1).answerID == answerCorrectID}"><i class="far fa-check-circle" style="color: #33ff66"></i></c:if></li>
                                                    <li <c:if test="${e.listAnswer.get(2).statusResult}">class="alert alert-success" role="alert"</c:if>>
                                                        ${e.listAnswer.get(2).answer_content} <c:if test="${e.listAnswer.get(2).answerID == answerCorrectID}"><i class="far fa-check-circle" style="color: #33ff66"></i></c:if></li>
                                                    <li <c:if test="${e.listAnswer.get(3).statusResult}">class="alert alert-success" role="alert"</c:if>>
                                                        ${e.listAnswer.get(3).answer_content} <c:if test="${e.listAnswer.get(3).answerID == answerCorrectID}"><i class="far fa-check-circle" style="color: #33ff66"></i></c:if></li>

                                                    </ol>   
                                            </c:when>

                                            <c:otherwise>
                                                <ol type="a">                                                    
                                                    <li <c:if test="${e.answerChoose == e.listAnswer.get(0).answerID}">class="alert alert-danger" role="alert"</c:if>
                                                                                            <c:if test="${e.listAnswer.get(0).statusResult}">class="alert alert-success" role="alert"</c:if>>${e.listAnswer.get(0).answer_content} <c:if test="${e.answerChoose == e.listAnswer.get(0).answerID}"><i class="fas fa-times-circle" style="color:red"></i></c:if></li>
                                                    <li <c:if test="${e.answerChoose == e.listAnswer.get(1).answerID}">class="alert alert-danger" role="alert"</c:if>
                                                                                            <c:if test="${e.listAnswer.get(1).statusResult}">class="alert alert-success" role="alert"</c:if>>${e.listAnswer.get(1).answer_content} <c:if test="${e.answerChoose == e.listAnswer.get(1).answerID}"><i class="fas fa-times-circle" style="color:red"></i></c:if></li>
                                                    <li <c:if test="${e.answerChoose == e.listAnswer.get(2).answerID}">class="alert alert-danger" role="alert"</c:if>
                                                                                            <c:if test="${e.listAnswer.get(2).statusResult}">class="alert alert-success" role="alert"</c:if>>${e.listAnswer.get(2).answer_content} <c:if test="${e.answerChoose == e.listAnswer.get(2).answerID}"><i class="fas fa-times-circle" style="color:red"></i></c:if></li>
                                                    <li <c:if test="${e.answerChoose == e.listAnswer.get(3).answerID}">class="alert alert-danger" role="alert"</c:if>
                                                                                            <c:if test="${e.listAnswer.get(3).statusResult}">class="alert alert-success" role="alert"</c:if>>${e.listAnswer.get(3).answer_content} <c:if test="${e.answerChoose == e.listAnswer.get(3).answerID}"><i class="fas fa-times-circle" style="color:red"></i></c:if></li>                                                  
                                                    </ol>   
                                            </c:otherwise>
                                        </c:choose>                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                    </tbody>
                </table>
            </section>



        </div>
        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <script type="text/javascript">

        </script>
    </body>
</html>
