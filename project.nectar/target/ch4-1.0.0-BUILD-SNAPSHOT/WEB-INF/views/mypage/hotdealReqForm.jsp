<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
    <%--    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>--%>
    <%--    <link rel="stylesheet" href="<c:url value='/css/globalPage.css'/>"/>--%>

</head>


<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <li>
            <a href="<c:url value='/mypage/main'/>">
                <c:choose>
                <c:when test="${not empty sessionScope.Admin_email}"><i
                    class="fa-solid fa-user-secret"></i></a></c:when>
            <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
            <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
            <c:otherwise><i class="fa-regular fa-user"></i></a></c:otherwise>
            </c:choose>
        </li>
    </ul>
</div>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>

<form id="form" action="<c:url value=''/>" method="">

    <label><input name="restr_name" type="text" value="${request_hotdealDto.request_hotdeal_restr_name}"/> 사업장명
        : ${request_hotdealDto.request_hotdeal_restr_name}</label>
    <label><input name="bizAccount_email" type="text" value="${request_hotdealDto.request_bizAccount_email}"/> 사업자 이메일
        : ${request_hotdealDto.request_bizAccount_email}</label>
    <label><input name="restr_menu_food" type="text" value="${request_hotdealDto.request_restr_menu_food}"/> 핫딜 메뉴 이름
        : ${request_hotdealDto.request_hotdeal_restr_menu_food}</label>
    <label><input name="restr_menu_pricele" type="text" value="${request_hotdealDto.request_restr_menu_price}"/> 기존 메뉴 가격
        : ${request_hotdealDto.request_restr_menu_price}</label>
    <label><input name="hotdeal_price" type="text" value="${request_hotdealDto.request_hotdeal_price}"/> 핫딜 메뉴 가격
        : ${request_hotdealDto.request_hotdeal_price}</label>
    <label><input name="hotdeal_discountRate" type="text" value="${request_hotdealDto.request_hotdeal_discountRate}"/> 핫딜 할인률
        : ${request_hotdealDto.request_hotdeal_discountRate}</label>
    <label><input name="hotdeal_desc" type="text" value="${request_hotdealDto.request_hotdeal_desc}"/> 핫딜 메뉴 설명
        : ${request_hotdealDto.request_hotdeal_desc}</label>
    <label><input name="hotdeal_useDate" type="text" value="${request_hotdealDto.request_hotdeal_useDate}"/> 사용기간
        : ${request_hotdealDto.request_hotdeal_useDate}</label>
    <label><input name="hotdeal_eventDuratio" type="text" value="${request_hotdealDto.request_hotdeal_eventDuration}"/> 이벤트 기간
        : ${request_hotdealDto.request_hotdeal_eventDuration}</label>
    <label><input name="hotdeal_picture" type="text" value="${request_hotdealDto.request_hotdeal_picture}"/>
        <img src="${request_hotdealDto.request_hotdeal_picture}">
    </label>
    <button type="button" id="registerBtn">심사완료</button>
    <button type="button" id="denyBtn">심사반려</button>
    <button type="button" id="listBtn">목록</button>

</form>

<script>
    $(document).ready(function () {
        let formCheck = function () {
            let form = document.getElementById("form");
            if (form.title.value == "") {
                alert("제목을 입력해주세요.");
                form.title.focus();
                return false;
            }
            if (form.content.value == "") {
                alert("제목을 입력해주세요.");
                form.title.focus();
                return false;
            }
            return true;
        }

        $("#listBtn").on("click", function () {
            location.href = "<c:url value='/mypage/admin/main'/>";
        });

        $("#registerBtn").on("click", function () {
            let form = $("#form");
            form.attr("action", "<c:url value='/mypage/admin/hotdeal/register'/>");
            form.attr("method", "post");
            if (formCheck())
                form.submit();
        });

        $("#listBtn").on("click", function () {
            location.href = "<c:url value='/mypage/admin/main'/>";
        });

        $("#denyBtn").on("click", function () {
            if (!confirm("핫딜 등록 요청을 반려하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/mypage/admin/hotdeal/deny'/>");
            form.attr("method", "get");
            form.submit();

        });// 버튼을 클릭하면 /board/remove POST 로 요청하기

    })
</script>

</body>
</html>
