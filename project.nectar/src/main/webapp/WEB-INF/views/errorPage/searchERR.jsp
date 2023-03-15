<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CREA_WORLD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/restrList.css'/>"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script
            src="https://kit.fontawesome.com/43ede2213f.js"
            crossorigin="anonymous"
    ></script>

</head>
<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li>
            <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
                <input type="hidden" name="option" value="searchEngine"/>
                <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식">
                <input type="submit" class="search-button" value="검색">
            </form>
        </li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <li>
            <a href="<c:url value='/mypage/main'/>">
                <c:choose>
                    <c:when test="${not empty sessionScope.Admin_email}"><i class="fa-solid fa-user-secret"></i></a></c:when>
                    <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
                    <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
                    <c:otherwise><i class="fa-regular fa-user"></i></a></c:otherwise>
            </c:choose>
        </li>
    </ul>
</div>

<h1 style="text-align: center">검색 결과와 일치하는 가게가 없습니다.</h1>
<h1 style="text-align: center">검색 결과와 일치하는 가게가 없습니다.</h1>
<h1 style="text-align: center">검색 결과와 일치하는 가게가 없습니다.</h1>