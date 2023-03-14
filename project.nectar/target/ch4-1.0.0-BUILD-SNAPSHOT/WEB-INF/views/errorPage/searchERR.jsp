<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="loginUserEmail" value="${sessionScope.User_email}"/>


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
            <div>
                <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
                    <input type="hidden" name="option" value="searchEngine"/>
                    <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식"
                           th:field="food01">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>
        </li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <%--    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
        <li><a href="<c:url value='/mypage/main'/>"><i class="fa-solid fa-user"></i></a></li>
    </ul>
</div>

<h1>검색 결과와 일치하는 가게가 없습니다.</h1>
<h1>검색 결과와 일치하는 가게가 없습니다.</h1>
<h1>검색 결과와 일치하는 가게가 없습니다.</h1>