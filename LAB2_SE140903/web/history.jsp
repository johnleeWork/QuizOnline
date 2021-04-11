<%-- 
    Document   : history
    Created on : Feb 13, 2021, 5:58:10 PM
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
        <title>Quiz History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <style type="text/css">
            @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
            @import url('https://fonts.googleapis.com/css?family=Lobster');

            body {
                font-family: 'Open Sans', sans-serif;
                font-size: 1.6rem;
                font-weight: 400;
            }
            h1 {
                margin-bottom: 0.5em;
                font-size: 3.6rem;
            }
            p {
                margin-bottom: 0.5em;
                font-size: 1.6rem;
                line-height: 1.6;
            }
            .button {
                display: inline-block;
                margin-top: 20px;
                padding: 8px 25px;
                border-radius: 4px;
            }
            .button-primary {
                position: relative;
                background-color: #c0ca33;
                color: #fff;
                font-size: 1.8rem;
                font-weight: 700;
                transition: color 0.3s ease-in;
                z-index: 1;
            }
            .button-primary:hover {
                color: #c0ca33;
                text-decoration: none;
            }
            .button-primary::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                top: 0;
                background-color: #fff;
                border-radius: 4px;
                opacity: 0;
                -webkit-transform: scaleX(0.8);
                -ms-transform: scaleX(0.8);
                transform: scaleX(0.8);
                transition: all 0.3s ease-in;
                z-index: -1;
            }
            .button-primary:hover::after {
                opacity: 1;
                -webkit-transform: scaleX(1);
                -ms-transform: scaleX(1);
                transform: scaleX(1);
            }
            .overlay::after {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                top: 0;
                background-color: rgba(0, 0, 0, .3);
            }
            .header-area {
                position: relative;
                height: 10vh;
                background: #5bc0de;
                background-attachment: fixed;
                background-position: center center;
                background-repeat: no-repear;
                background-size: cover;
                font-size: 62.5%;
                margin-bottom: 10px;
            }
            .banner {
                display: flex;
                align-items: center;
                position: relative;
                height: 100%;
                color: #fff;
                text-align: center;
                z-index: 1;
            }
            .banner h1 {
                font-weight: 800;
            }
            .banner p {
                font-weight: 700;
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
            .navbar .navbar-toggler {
                position: relative;
                height: 50px;
                width: 50px;
                border: none;
                cursor: pointer;
                outline: none;
            }
            .navbar .navbar-toggler .menu-icon-bar {
                position: absolute;
                left: 15px;
                right: 15px;
                height: 2px;
                background-color: #fff;
                opacity: 0;
                -webkit-transform: translateY(-1px);
                -ms-transform: translateY(-1px);
                transform: translateY(-1px);
                transition: all 0.3s ease-in;
            }
            .navbar .navbar-toggler .menu-icon-bar:first-child {
                opacity: 1;
                -webkit-transform: translateY(-1px) rotate(45deg);
                -ms-sform: translateY(-1px) rotate(45deg);
                transform: translateY(-1px) rotate(45deg);
            }
            .navbar .navbar-toggler .menu-icon-bar:last-child {
                opacity: 1;
                -webkit-transform: translateY(-1px) rotate(135deg);
                -ms-sform: translateY(-1px) rotate(135deg);
                transform: translateY(-1px) rotate(135deg);
            }
            .navbar .navbar-toggler.collapsed .menu-icon-bar {
                opacity: 1;
            }
            .navbar .navbar-toggler.collapsed .menu-icon-bar:first-child {
                -webkit-transform: translateY(-7px) rotate(0);
                -ms-sform: translateY(-7px) rotate(0);
                transform: translateY(-7px) rotate(0);
            }
            .navbar .navbar-toggler.collapsed .menu-icon-bar:last-child {
                -webkit-transform: translateY(5px) rotate(0);
                -ms-sform: translateY(5px) rotate(0);
                transform: translateY(5px) rotate(0);
            }
            .navbar-dark .navbar-nav .nav-link {
                position: relative;
                color: #fff;
                font-size: 1.6rem;
            }
            .navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover {
                color: #fff;
            }
            .navbar .dropdown-menu {
                padding: 0;
                background-color: rgba(0, 0, 0, .9);
            }
            .navbar .dropdown-menu .dropdown-item {
                position: relative;
                padding: 10px 20px;
                color: #fff;
                font-size: 1.4rem;
                border-bottom: 1px solid rgba(255, 255, 255, .1);
                transition: color 0.2s ease-in;
            }
            .navbar .dropdown-menu .dropdown-item:last-child {
                border-bottom: none;
            }
            .navbar .dropdown-menu .dropdown-item:hover {
                background: transparent;
                color: #c0ca33;
            }
            .navbar .dropdown-menu .dropdown-item::before {
                content: '';
                position: absolute;
                bottom: 0;
                left: 0;
                top: 0;
                width: 5px;
                background-color: #c0ca33;
                opacity: 0;
                transition: opacity 0.2s ease-in;
            }
            .navbar .dropdown-menu .dropdown-item:hover::before {
                opacity: 1;
            }
            .navbar.fixed-top {
                position: fixed;
                -webkit-animation: navbar-animation 0.6s;
                animation: navbar-animation 0.6s;
                background-color: rgba(0, 0, 0, .9);
            }
            .navbar.fixed-top.navbar-dark .navbar-nav .nav-link.active {
                color: #c0ca33;
            }
            .navbar.fixed-top.navbar-dark .navbar-nav .nav-link::after {
                background-color: #c0ca33;
            }
            .content {
                padding: 120px 0;
            }
            .select-container {
                position: relative;
            }

            .select-container:before {
                position: absolute;
                right: 15px;
                top: calc(50% - 14px);
                font-size: 18px;
                color: #ffffff;
                content: '\F2F9';
                font-family: "Material-Design-Iconic-Font";
            }
            .custom-select {
                background-color: rgba(255, 255, 255, 0.2);
                border: 0;
                padding: 12px 15px;

                width: 100%;
                border-radius: 5px;
                text-align: left;
                height: auto;
                background-image: none;
            }

            .custom-select:focus {
                -webkit-box-shadow: none;
                box-shadow: none;
            }
            @media screen and (max-width: 768px) {
                .navbar-brand {
                    margin-left: 20px;
                }
                .navbar-nav {
                    padding: 0 20px;
                    background-color: rgba(0, 0, 0, .9);
                }
                .navbar.fixed-top .navbar-nav {
                    background: transparent;
                }
            }
            @media screen and (min-width: 767px) {
                .banner {
                    padding: 0 150px;
                }
                .banner h1 {
                    font-size: 5rem;
                }
                .banner p {
                    font-size: 2rem;
                }
                .navbar-dark .navbar-nav .nav-link {
                    padding: 23px 15px;
                }
                .navbar-dark .navbar-nav .nav-link::after {
                    content: '';
                    position: absolute;
                    bottom: 15px;
                    left: 30%;
                    right: 30%;
                    height: 1px;
                    background-color: #fff;
                    -webkit-transform: scaleX(0);
                    -ms-transform: scaleX(0);
                    transform: scaleX(0);
                    transition: transform 0.1s ease-in;
                }
                .navbar-dark .navbar-nav .nav-link:hover::after {
                    -webkit-transform: scaleX(1);
                    -ms-transform: scaleX(1);
                    transform: scaleX(1);
                }
                .dropdown-menu {
                    min-width: 200px;
                    -webkit-animation: dropdown-animation 0.3s;
                    animation: dropdown-animation 0.3s;
                    -webkit-transform-origin: top;
                    -ms-transform-origin: top;
                    transform-origin: top;
                }
            }
            @-webkit-keyframes navbar-animation {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(-100%);
                    -ms-transform: translateY(-100%);
                    transform: translateY(-100%);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0);
                    -ms-transform: translateY(0);
                    transform: translateY(0);
                }
            }
            @keyframes navbar-animation {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(-100%);
                    -ms-transform: translateY(-100%);
                    transform: translateY(-100%);
                }
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0);
                    -ms-transform: translateY(0);
                    transform: translateY(0);
                }
            }
            @-webkit-keyframes dropdown-animation {
                0% {
                    -webkit-transform: scaleY(0);
                    -ms-transform: scaleY(0);
                    transform: scaleY(0);
                }
                75% {
                    -webkit-transform: scaleY(1.1);
                    -ms-transform: scaleY(1.1);
                    transform: scaleY(1.1);
                }
                100% {
                    -webkit-transform: scaleY(1);
                    -ms-transform: scaleY(1);
                    transform: scaleY(1);
                }
            }
            @keyframes dropdown-animation {
                0% {
                    -webkit-transform: scaleY(0);
                    -ms-transform: scaleY(0);
                    transform: scaleY(0);
                }
                75% {
                    -webkit-transform: scaleY(1.1);
                    -ms-transform: scaleY(1.1);
                    transform: scaleY(1.1);
                }
                100% {
                    -webkit-transform: scaleY(1);
                    -ms-transform: scaleY(1);
                    transform: scaleY(1);
                }
            }
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
                font-size: 20px;
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
            .hea{
                margin-bottom: 30px;
            }

        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />

        <header class="header-area overlay">
            <nav class="navbar navbar-expand-md navbar-dark">
                <div class="container">
                    <a style="color: white" class="navbar-brand" href="quiz">Quiz History</a>

                    <button type="button" class="navbar-toggler collapsed" data-toggle="collapse" data-target="#main-nav">
                        <span class="menu-icon-bar"></span>
                        <span class="menu-icon-bar"></span>
                        <span class="menu-icon-bar"></span>
                    </button>

                    <div id="main-nav" class="collapse navbar-collapse">
                        <ul class="navbar-nav ml-auto">
                            <li><a style="color: white" class="nav-item nav-link active">Welcome ${sessionScope.LOGIN_USER.getName()}</a></li>					
                            <li><a href="Logout" class="nav-item nav-link">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>



        </header>


        <div class="container">

            <div class="row">
                <div class="col-lg-10 mx-auto">
                    <div class="career-search mb-40">

                        <form action="SearchHistory" class="career-form mb-60">
                            <div class="row hea">
                                <div class="col-md-6 col-lg-3 my-3">
                                    <select class="custom-select" name="txtSubjectSearch">
                                        <option disabled selected>Select Subject</option>
                                        <c:set var="list" value="${sessionScope.LIST_SUBJECT}"></c:set>
                                        <c:set var="subjectSearch" value="${param.txtSubjectSearch}"></c:set>
                                        <c:if test="${not empty list}">
                                            <c:forEach var="e" items="${list}" varStatus="counter">
                                                <option value="${e.subjectID}" <c:if test="${subjectSearch ==e.subjectID}">selected</c:if>>${e.subjectName}</option>
                                            </c:forEach>
                                        </c:if>
                                    </select>
                                </div>
                                <div class="col-md-6 col-lg-3 my-3">
                                    <input name="txtEmailSearch" value="${sessionScope.LOGIN_USER.email}" type="hidden">
                                    <button type="submit" class="btn btn-lg btn-block btn-light btn-custom" id="contact-submit">
                                        Search
                                    </button>
                                </div>
                            </div>
                        </form>
                        <c:set var="listHistory" value="${sessionScope.HISTORY_EXAM}"></c:set>
                        <c:if test="${not empty listHistory}">
                            <c:forEach var="examHistory" items="${listHistory}" varStatus="counter">
                                <div class="filter-result">                           
                                    <div class="job-box d-md-flex align-items-center justify-content-between mb-30">
                                        <div class="job-left my-4 d-md-flex align-items-center flex-wrap">
                                            <div class="img-holder mr-md-4 mb-md-0 mb-4 mx-auto mx-md-0 d-md-none d-lg-flex">
                                                ${examHistory.subjectID}
                                            </div>
                                            <div class="job-content">
                                                <h5 class="text-center text-md-left">ExamID: ${examHistory.examID}</h5>
                                                <ul class="d-md-flex flex-wrap text-capitalize ff-open-sans">
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-calendar-note"></i> Point: ${examHistory.point}
                                                    </li>
                                                    <li class="mr-md-4">
                                                        <i class="zmdi zmdi-time mr-2"></i> ${examHistory.dateTimeFinish}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="job-right my-4 flex-shrink-0">
                                            <a href="ShowHistoryDetail?txtExamIDDetail=${examHistory.examID}" class="btn d-block w-100 d-sm-inline-block btn-light">Detail</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>

                        </c:if>


                    </div>
                </div>
            </div>
            <nav aria-label="Page navigation">
                <ul class="pagination pagination-reset justify-content-center">
                    <c:url var="nextpage" value="SearchHistory">
                        <c:param name="txtSubjectSearch" value="${param.txtSubjectSearch}"></c:param>
                        <c:param name="txtEmailSearch" value="${param.txtEmailSearch}"></c:param>
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
        </div>


        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

    </body>
</html>