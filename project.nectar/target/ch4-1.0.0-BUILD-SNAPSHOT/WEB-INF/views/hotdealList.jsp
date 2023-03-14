<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <%--  script --%>
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
                    <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}"
                           placeholder="지역, 식당 또는 음식"
                           th:field="food01">
                    <input type="submit" class="search-button" value="검색">
                </form>
            </div>
        </li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <li><a href="<c:url value='/mypage/main'/>"><i class="fa-solid fa-user"></i></a></li>
    </ul>
</div>


<!-- Main -->
<section id="main">

    <table>
        <tr>
            <th class="">hotdeal_NUM</th>
            <th class="">restr_NUM</th>
            <th class="">restr_name</th>
            <th class="">restr_category_loc</th>
            <th class="">restr_menu_NUM</th>
            <th class="">restr_menu_picture</th>
            <th class="">restr_menu_food</th>
            <th class="">restr_menu_price</th>
            <th class="">hotdeal_price</th>
            <th class="">hotdeal_discountRate</th>
            <th class="">hotdeal_desc</th>
            <th class="">hotdeal_useDate</th>
            <th class="">hotdeal_eventDuration</th>
            <th class="">hotdeal_regdate</th>
            <th class="">hotdeal_update</th>
            <th class="">hotdeal_salesVolume</th>
            <th class="">hotdeal_MaxSalesVolume</th>
            <th class="">bizAccount_email</th>
        </tr>

        <c:forEach var="hotdealDto" items="${hotdealDto}">
            <tr>
                <td class="">${hotdealDto.hotdeal_NUM}</td>
                <td class="">${hotdealDto.restr_NUM}</td>
                <td class="title"><a
                        href="<c:url value="/hotdeal/read?hotdeal_NUM=${hotdealDto.hotdeal_NUM}"/>">${hotdealDto.restr_name}</a>
                </td>
                <td class="">${hotdealDto.restr_category_loc}</td>
                <td class="">${hotdealDto.restr_menu_NUM}</td>
                <td class="">${hotdealDto.restr_menu_picture}</td>
                <td class="">${hotdealDto.restr_menu_food}</td>
                <td class="">${hotdealDto.restr_menu_price}</td>
                <td class="">${hotdealDto.hotdeal_price}</td>
                <td class="">${hotdealDto.hotdeal_discountRate}</td>
                <td class="">${hotdealDto.hotdeal_desc}</td>
                <td class="">${hotdealDto.hotdeal_useDate}</td>
                <td class="">${hotdealDto.hotdeal_eventDuration}</td>
                <td class="">${hotdealDto.hotdeal_regdate}</td>
                <td class="">${hotdealDto.hotdeal_update}</td>
                <td class="">${hotdealDto.hotdeal_salesVolume}</td>
                <td class="">${hotdealDto.hotdeal_MaxSalesVolume}</td>
                <td class="">${hotdealDto.bizAccount_email}</td>
            </tr>
        </c:forEach>
    </table>

</section>

</body>
</html>
