<%-- 
    Document   : quizTest
    Created on : Feb 9, 2021, 5:56:17 PM
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
        <title>Test Quiz Online</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
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

            #quizmain {
                font-family: "Segoe UI",Arial,sans-serif;
                margin: 0 auto auto;
                width:90%;
                background-color:#fff;
            }
            #qtext {
                font-size:18px;
                margin-bottom:40px;
            }
            #altcontainer {
                background-color:#fff;
                font-size:120%;
                line-height:1.7em;
            }
            #answerbuttoncontainer {
                position:relative;
                padding:20px 0;
            }
            .answerbutton {
                background-color:#4CAF50;
                padding:12px 30px !important;
                font-size:17px;
                color: #ffffff;
            }
            #timer {
                position:absolute;
                right:0;
                text-align:right;
                border:none;
                font-family: "Segoe UI",Arial,sans-serif;
                font-size:16px;
                width:80px;
            }
            .linktotutdiv {
                color:#555;
            }
            .linktotutdiv a {
                padding:10px 20px;
                text-decoration:none;
                color:black!important;
                background-color:rgba(255, 235, 59,0.6)!important;
            }
            .linktotutdiv a:hover,.linktotutdiv a:active {
                background-color:rgba(255, 235, 59,1)!important;
            }
            /* The radiocontainer */
            .radiocontainer {
                background-color:#f1f1f1;
                display: block;
                position: relative;
                padding:10px 10px 10px 50px;
                margin-bottom: 1px;
                cursor: pointer;
                font-size: 18px;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
                word-wrap: break-word;
            }

            /* Hide the browser's default radio button */
            .radiocontainer input {
                position: absolute;
                opacity: 0;
                cursor: pointer;
            }

            /* Create a custom radio button */
            .checkmark {
                position: absolute;
                top: 15px;
                left: 15px;
                height: 19px;
                width: 19px;
                background-color: #fff;
                border-radius: 50%;
            }
            .checkedlabel {
                background-color:#ddd;
            }
            /* On mouse-over, add a grey background color */

            .radiocontainer:hover {
                background-color: #ddd;
            }

            /* When the radio button is checked, add a blue background */
            .radiocontainer input:checked ~ .checkmark {
                background-color: #2196F3;
            }

            /* Create the indicator (the dot/circle - hidden when not checked) */
            .checkmark:after {
                content: "";
                position: absolute;
                display: none;
            }

            /* Show the indicator (dot/circle) when checked */
            .radiocontainer input:checked ~ .checkmark:after {
                display: block;
            }
            /* Style the indicator (dot/circle) */
            .radiocontainer .checkmark:after {
                top: 6px;
                left: 6px;
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: white;
            }
            @media screen and (max-width:600px) {
                .quizresultbtn {
                    display:block;
                    width:100%;
                }
            }
            .styleH1{
                margin-top: 20px;
                margin-left: 35px;

            }

        </style>
    </head>
    <body>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/material-design-iconic-font/2.2.0/css/material-design-iconic-font.min.css" integrity="sha256-3sPp8BkKUE7QyPSl6VfBByBroQbKxKG7tsusY2mhbVY=" crossorigin="anonymous" />
        <header class="header-area overlay">
            <nav class="navbar navbar-expand-md navbar-dark">
                <div class="container">
                    <a style="color: white" class="navbar-brand">Quiz Online</a>

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
        <main>
            <h1 class="styleH1">${sessionScope.QUIZ_TEST_UPDATE.subjectID} Quiz</h1>

            <div id="quizmain">
                <div id="quizcontainer">

                    <script>
                        function countDown() {
                            var count = document.getElementById("timeDo").value;
                            var timer = document.getElementById("timer");
                            if (count > 0) {
                                count--;
                                timer.innerHTML = format(count);
                                setTimeout("countDown()", 1000);
                                document.getElementById("timeDo").value = count;
                            } else {                                 
                                var redirect = "ShowResultTimeOut?numberQuizExam=${requestScope.numberQuizExam}&answerChoose=";
                                if (document.querySelector('input[name="quizChoose"]:checked') !== null) {
                                    var answerChoose = document.querySelector('input[name="quizChoose"]:checked').value;
                                    redirect +=answerChoose+"&numberFix=${requestScope.numberQuiz}";
                                }
                                window.location.href = redirect;  
                            }
                        }
                        function format(time) {
                            var hrs = ~~(time / 3600);
                            var mins = ~~((time % 3600) / 60);
                            var secs = ~~time % 60;
                            var ret = "";
                            if (hrs > 0) {
                                ret += "" + hrs + ":" + (mins < 10 ? "0" : "");
                            }
                            ret += "" + mins + ":" + (secs < 10 ? "0" : "");
                            ret += "" + secs;
                            return ret;
                        }
                    </script>

                    <h3>Question ${requestScope.numberQuiz} of ${requestScope.numberQuizExam}:</h3>


                    <p id="qtext">${sessionScope.QUIZ_TEST_UPDATE.question_content}</p>
                    <form role="form" id="quizform" name="quizform" action="GetQuestion" method="post">                      
                        <div style="position:relative;width:100%;">
                            <div id="altcontainer" class="notranslate">
                                <label class='radiocontainer'> ${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(0).answer_content}
                                    <%--<c:if test="${sessionScope.QUIZ_TEST_UPDATE.answerChoose == 1}">checked</c:if>--%>
                                    <input type="radio" name="quizChoose" value="${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(0).answerID}" ><span class='checkmark'></span>
                                    </label>
                                    <label class='radiocontainer'> ${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(1).answer_content}
                                    <input type="radio" name="quizChoose" value="${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(1).answerID}" ><span class='checkmark'></span>
                                    </label>
                                    <label class='radiocontainer'> ${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(2).answer_content}
                                    <input type="radio" name="quizChoose" value="${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(2).answerID}" ><span class='checkmark'></span>
                                    </label>
                                    <label class='radiocontainer'> ${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(3).answer_content}
                                    <input type="radio" name="quizChoose" value="${sessionScope.QUIZ_TEST_UPDATE.listAnswer.get(3).answerID}" ><span class='checkmark'></span>
                                    </label>
                                </div>
                            </div>
                            <div id="answerbuttoncontainer">  


                            <c:if test="${requestScope.numberQuiz < requestScope.numberQuizExam}">
                                <input type="hidden" name="numberQuiz" value="${requestScope.numberQuiz + 1}">
                                <input type="hidden" name="numberFix" value="${requestScope.numberQuiz}">
                                <input type="hidden" name="numberQuizExam" value="${requestScope.numberQuizExam}">
                                <button class="answerbutton w3-right w3-btn" >Next &#10095;</button>     
                            </c:if>
                            <c:if test="${requestScope.numberQuiz == requestScope.numberQuizExam}">
                                <input type="hidden" name="numberQuiz" value="${requestScope.numberQuiz}">
                                <input type="hidden" name="numberFix" value="${requestScope.numberQuiz}">
                                <input type="hidden" name="numberQuizExam" value="${requestScope.numberQuizExam}">
                                <button class="answerbutton w3-right w3-btn" >&#9989; Submit</button> 
                            </c:if>
                            <input type="hidden" name="timeDo" value="${requestScope.timeDo}" id="timeDo"> 
                            <p id="timer"><script>countDown();</script></p>
                        </div>
                    </form>
                </div>
                <c:if test="${not empty sessionScope.ERROR_DO_QUIZ}">
                    <div class="alert alert-danger">
                        <strong>Warning!</strong> ${sessionScope.ERROR_DO_QUIZ}.
                    </div>
                </c:if>

            </div>

        </main>



        <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

    </body>
</html>
