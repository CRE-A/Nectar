<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script
            src="https://kit.fontawesome.com/43ede2213f.js"
            crossorigin="anonymous"
    ></script>

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarHome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/qnaForm.css'/>"/>


    <style>
        section#navbar.qnaForm {
            z-index: 2;
            width: 100vw;
            background-color: #e9bea2;
            display: flex;
            justify-content: space-between;
            position: relative;
        }
    </style>


</head>


<body>

<div id="menu" class="qnaForm">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <li class="menu item">
            <security:authorize access="isAnonymous()">
                <a href="<c:url value='/login/login'/>">LOGIN</a>
            </security:authorize>
            <security:authorize access="hasRole('USER')">
                <a href="<c:url value='/mypage/user/main'/>"><i class="fa-solid fa-user"></i></a>
            </security:authorize>
            <security:authorize access="hasRole('BIZ')">
                <a href="<c:url value='/mypage/biz/main'/>"><i class="fa-solid fa-user-tie"></i></a>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value='/mypage/admin/main'/>"><i class="fa-solid fa-user-secret"></i></a>
            </security:authorize>
        </li>
    </ul>
</div>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>



<%--board--%>

<section id="board">
    <header id="header">
        <h1>FAQ</h1>
        <button class="listBtn">목록</button>
    </header>
    <section id="title">
        <h1 class="title">${qnaDto.qna_title}</h1>
        <div class="user_info">
            <span class="name">${qnaDto.qna_name}</span> <span class="date">${qnaDto.qna_regdate}</span>
        </div>
    </section>
    <section id="content">
        ${qnaDto.qna_content}
    </section>
    <footer>
        <div class="judge">
            <button class="completeBtn">답글달기</button>
        </div>
    </footer>
</section>


<script>

    $(document).ready(() => {




    }) // ready()


</script>


</body>
</html>
