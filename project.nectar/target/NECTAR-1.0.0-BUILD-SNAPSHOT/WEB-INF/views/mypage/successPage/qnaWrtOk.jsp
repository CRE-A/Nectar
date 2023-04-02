<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


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

    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarHome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/successPage.css'/>"/>

</head>

<style>
    section#navbar.success {
        z-index: 2;
        width: 100vw;
        background-color: #e9bea2;
        display: flex;
        justify-content: space-between;
        position: relative;
    }
</style>


<body>
<%--NAVBAR--%>

<section id="navbar">
    <div class="logo">
        <a href="<c:url value='/'/>"> <img src="<c:url value='/images/nectarLogo.png'/>" alt="" class="logo__img"/></a>
    </div>
    <ul class="menu">
        <li class="menu item">
            <a href="<c:url value='/hotdeal/list'/>">HOTDEAL</a>
        </li>
        <li class="menu item">
            <a href="<c:url value='/restr/list'/>">맛집리스트</a>
        </li>
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
</section>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>

<section id="info">
    <div class="box">
        <div class="box_item">
            <!-- <i class="fa-solid fa-circle-check"></i> -->
            <div class="emoji">✔️</div>
        </div>
        <h1>성공적으로 등록되었습니다!</h1>
        <p>
            문의를 처리하는 데 며칠 소요되며,  ${qnaDto.qna_name} 님의  이메일( ${qnaDto.qna_writer} )로 답변 드리겠습니다. Nectar를 이용해 주셔서 감사합니다.
        </p>
    </div>
</section>

</body>
