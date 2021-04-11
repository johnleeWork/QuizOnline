<%-- 
    Document   : add
    Created on : Feb 7, 2021, 10:11:25 PM
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
        <title>Add New Question</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">

        <style type="text/css">
            @import url('https://fonts.googleapis.com/css?family=Open+Sans:400,700,800');
            @import url('https://fonts.googleapis.com/css?family=Lobster');
            html {
                font-size: 62.5%;
            }
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



            body{background:#eee;}
            .profile img.user { margin: 0 20px 10px 0; }
            .profile .name { margin: 14px 0 10px; }
            .profile h5.sales { margin: 10px 0 10px 10px; }
            .profile .sales .list-group-item i { margin-right: 10px; }
            .profile .list-inline i { margin-right: 7px; }
            .profile .messages .list-group-item img { margin-right: 10px; }
            .well {
                border: 0;
                padding: 20px;
                min-height: 63px;
                background: #fff;
                box-shadow: none;
                border-radius: 3px;
                position: relative;
                max-height: 100000px;
                border-bottom: 2px solid #ccc;
                transition: max-height 0.5s ease;
                -o-transition: max-height 0.5s ease;
                -ms-transition: max-height 0.5s ease;
                -moz-transition: max-height 0.5s ease;
                -webkit-transition: max-height 0.5s ease;
            }

            .form-control {
                height: 45px;
                padding: 10px;
                font-size: 16px;
                box-shadow: none;
                border-radius: 0;
                position: relative;
            }

            label {
                font-weight: 400;
                color: #444;
            }

            .dropzone.dz-clickable {
                cursor: pointer;
            }
            .dropzone .dz-default.dz-message {
                opacity: 1;
                -ms-filter: none;
                filter: none;
                -webkit-transition: opacity 0.3s ease-in-out;
                -moz-transition: opacity 0.3s ease-in-out;
                -o-transition: opacity 0.3s ease-in-out;
                -ms-transition: opacity 0.3s ease-in-out;
                transition: opacity 0.3s ease-in-out;
                background-repeat: no-repeat;
                background-position: 0 0;
                position: absolute;
                width: 428px;
                height: 123px;
                margin-left: -214px;
                margin-top: -61.5px;
                top: 50%;
                left: 50%;
                font-size:40px;
                color:#5bc0de;
            }        
            .wrapper {
                text-align: center;
                margin-left: 35%;
                margin-top: 5px;

            }








        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <header class="header-area overlay">
            <nav class="navbar navbar-expand-md navbar-dark">
                <div class="container">
                    <a style="color: white" class="navbar-brand" href="SearchAD">Quiz Online Manager</a>

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


        <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
        <script src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" data-auto-replace-svg="nest"></script>
        <div class="container bootstrap snippets bootdey">
            <hr>
            <ol class="breadcrumb">
                <li class="pull-right"><a href="" class="text-muted"><i class="fas fa-plus-circle"></i></a> Add new question</li>
            </ol>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="well profile">

                        <div class="tab-pane active" id="tab2">
                            <div class="row">
                                <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10">
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="basic">
                                            <form class="form-horizontal" role="form" action="AddQuestion">
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Question</label>
                                                    <div class="col-lg-10">
                                                        <textarea name="txtQuestion" type="text" rows="3" class="form-control" placeholder="Enter question here"></textarea>                                                    
                                                        <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.question_content}</p>
                                                    </div>
                                                </div>
                                                <hr>
                                                <div class="form-group">
                                                    <label class="col-lg-2 control-label">Answer</label>
                                                    <div class="col-lg-10">
                                                        <ol type="A">
                                                            <li>
                                                                <textarea name="txtAnswerA" type="text" rows="2" class="form-control" placeholder="Enter answer here">${txtAnswerA}</textarea>                    
                                                            </li>
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.answer_content1}</p>
                                                            <hr>
                                                            <li>
                                                                <textarea name="txtAnswerB" type="text" rows="2" class="form-control" placeholder="Enter answer here"></textarea>                    
                                                            </li>
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.answer_content2}</p>
                                                            <hr>
                                                            <li>
                                                                <textarea name="txtAnswerC" type="text" rows="2" class="form-control" placeholder="Enter answer here"></textarea>                    
                                                            </li>
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.answer_content3}</p>
                                                            <hr>
                                                            <li>
                                                                <textarea name="txtAnswerD" type="text" rows="2" class="form-control" placeholder="Enter answer here"></textarea>                    
                                                            </li>                       
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.answer_content4}</p>
                                                            <hr>

                                                            </div>
                                                            </div>

                                                            <div class="form-group">
                                                                <label class="col-lg-2 control-label">Answer correct</label>
                                                                <div class="col-sm-10">
                                                                    <select name="txtAnswerCorrect">
                                                                        <option disabled selected>Select answer</option>
                                                                        <option value="1">A</option>
                                                                        <option value="2">B</option>
                                                                        <option value="3">C</option>
                                                                        <option value="4">D</option>
                                                                    </select>                                                   
                                                                </div>
                                                            </div>
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.answer_correct}</p>

                                                            <div class="form-group">
                                                                <label class="col-lg-2 control-label">Subject</label>
                                                                <div class="col-sm-10">
                                                                    <select name="txtSubjectQuestion">
                                                                        <option disabled selected>Select Subject</option>
                                                                        <c:set var="listSubject" value="${sessionScope.LIST_SUBJECT}"></c:set>
                                                                        <c:if test="${not empty listSubject}">
                                                                            <c:forEach var="sub" items="${listSubject}" varStatus="counter">
                                                                                <option value="${sub.subjectID}">${sub.subjectName}</option>
                                                                            </c:forEach>
                                                                        </c:if>
                                                                    </select>                                                   
                                                                </div>
                                                            </div>  
                                                            <p class="help-block" style="color: red">${requestScope.ERROR_QUESTION_ADD.subjectID}</p>
                                                            <div class="wrapper col-sm-5 col-sm-offset-2 ">                                        
                                                                <button type="submit" class="btn btn-primary" >Add</button>
                                                            </div>
                                                            </form>                                                        
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>   



                <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <script src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


                </body>
                </html>
