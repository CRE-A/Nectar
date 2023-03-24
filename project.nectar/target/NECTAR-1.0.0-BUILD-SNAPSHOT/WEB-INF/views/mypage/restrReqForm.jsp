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


    <style>
        #form {
            display: flex;
            flex-direction: column;


        }
    </style>
</head>


<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
        <li>
            <a href="<c:url value='/mypage/logincheck'/>">
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

<form id="form" >

    <label><input name="restr_NUM" type="hidden" value="${request_restrDto.request_restr_NUM}"/></label>
    <label><input name="bizAccount_email" type="text" value="${request_restrDto.request_bizAccount_email}" readonly/>
        사업주
        : ${request_restrDto.request_bizAccount_email} </label>
    <label><input name="restr_name" type="text" value="${request_restrDto.request_restr_name}"/> 사업장명
        : ${request_restrDto.request_restr_name}</label>
    <label><input name="restr_phone" type="text" value="${request_restrDto.request_restr_phone}"/> 연락처
        : ${request_restrDto.request_restr_phone}</label>
    <label><input name="restr_location" type="text" value="${request_restrDto.request_restr_location}"/> 위치
        : ${request_restrDto.request_restr_location}</label>
    <label><input name="restr_time" type="text" value="${request_restrDto.request_restr_time}"/> 매장 운영 시간
        : ${request_restrDto.request_restr_time}</label>
    <label><input name="restr_tag" type="text" value="${request_restrDto.request_restr_tag}"/> 매장 관련 태그
        : ${request_restrDto.request_restr_tag}</label>
    <label><input name="restr_location_tag" type="text" value="${request_restrDto.request_restr_location_tag}"/> 위치태그
        : ${request_restrDto.request_restr_location_tag}</label>
    <label><input name="restr_foodType" type="text" value="${request_restrDto.request_restr_foodType}"/> 음식종류
        : ${request_restrDto.request_restr_foodType}</label>
    <label><input name="restr_cost" type="text" value="${request_restrDto.request_restr_cost}"/> 가격대
        : ${request_restrDto.request_restr_cost}</label>
    <label><input name="restr_parking" type="text" value="${request_restrDto.request_restr_parking}"/> 주차가능여부
        : ${request_restrDto.request_restr_parking}</label>
    <label><input name="restr_menu" type="text" value="${request_restrDto.request_restr_menu}"/> 메뉴
        : ${request_restrDto.request_restr_menu}</label>
    <label><input name="biz_reg_num" type="text" value="${request_restrDto.request_biz_reg_num}"/> 사업자 등록증 번호
        : ${request_restrDto.request_biz_reg_num}</label>
    <label><input name="restr_desc" type="text" value="${request_restrDto.request_restr_desc}"/> 레스토랑 정보 / 설명
        : ${request_restrDto.request_restr_desc}</label>
    <%--    <label><input name="category_loc" type="text" value="${request_restrDto.request_category_loc}"/> 위치 카테고리--%>
    <%--        : ${request_restrDto.request_category_loc}</label>--%>
    <label><input name="restr_picture" type="text" value="${request_restrDto.request_restr_picture}"
                  placeholder="나중에 input[type=file] 로 변경"/> 레스토랑 이미지파일
        <img src="${request_restrDto.request_restr_picture}">
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
        }); // 목록으로 이동

        $("#registerBtn").on("click", function () {
            let form = $("#form");
            form.attr("action", "<c:url value='/mypage/admin/restr/register?request_restr_NUM=${request_restrDto.request_restr_NUM}'/>");
            form.attr("method", "post");
            form.submit();
        }); // 심사완료

        $("#denyBtn").on("click", function () {
            if (!confirm("사업장 등록 요청을 반려하시겠습니까?")) return;
            let form = $("#form");
            form.attr("action", "<c:url value='/mypage/admin/restr/deny'/>");
            form.attr("method", "get");
            form.submit();

        });// 버튼을 클릭하면 /board/remove POST 로 요청하기

    })
</script>

</body>
</html>
