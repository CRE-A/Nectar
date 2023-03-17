<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/loginform.css'/>"/>
    <%--  script --%>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

</head>
<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li>
            <form action="<c:url value="/restr/search"/>" class="search-form" method="get">
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

<div id="form_container">
    <h1 id="title">NAVER</h1>
    <form id="form" action="<c:url value="/login/login"/>" method="post" onsubmit="return loginFormCheck(this);">
        <div id="inputBox">
            <div id="inputBox1">
                <i class="fa-solid fa-id-badge"></i>
                <input type="text" name="email" placeholder="이메일" value="${cookie.email.value}" autofocus>
            </div>

            <div id="inputBox2">
                <i class="fa-sharp fa-solid fa-key"></i>
                <input type="password" name="pwd" placeholder="비밀번호" value="${cookie.pwd.value}">
            </div>
        </div>
        <input type="hidden" name="toURL" value="${param.toURL}">
        <label><input type="checkbox" name="rememberEmailPwd" ${not empty cookie.email.value? "checked":""}>로그인 상태
            유지</label>
        <div id="msg">
            ${param.msg}
        </div>
        <button id="loginBtn">로그인</button>
    </form>
    <div id="below_form">
        <a href="">비밀번호 찾기</a> | <a href="">아이디 찾기</a> | <a href="<c:url value="/register/add"/>">회원가입</a>
    </div>
</div>
<div class="googleLogin">
    <a href="<c:url value="${google_url}"/>">
        <img width="300" src="<c:url value='/images/google-login.png'/>">
    </a>
</div>

<script>
    function loginFormCheck(frm) {
        if (frm.email.value.length == 0) {
            setMessage("이메일을 입력해 주세요")
            return false;
        }
        if (frm.pwd.value.length == 0) {
            setMessage("비밀번호를 입력해 주세요.")
            return false;
        }
        return true;
    }

    function setMessage(msg) {
        document.getElementById("msg").innerHTML = `${'${msg}'}`;
    }
</script>

</body>
</html>
