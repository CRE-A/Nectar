<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


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

<section id="navbar">
    <div class="logo">
        <a href="<c:url value='/'/>">  <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img" /></a>
    </div>
    <div class="searchBar">
        <form action="" class="search-form" method="get">
            <button type="button" class="searchBtn" value="검색">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
            <input type="hidden" name="option" value="searchEngine" />
            <input
                    type="text"
                    name="keyword"
                    class="search-input"
                    value="${ph.sc.keyword}"
                    placeholder="지역, 식당 또는 음식"
            />
            <button type="submit" class="search-button" value="검색">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
        </form>
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

<div id="form_container">
    <h1 id="title">NECTAR</h1>
    <form id="form" action="<c:url value="/login/loginProcess"/>" method="post" onsubmit="return loginFormCheck(this);">
        <div id="inputBox">
            <div id="inputBox1">
                <i class="fa-solid fa-id-badge"></i>
                <input class="detail" type="text" name="user_email" placeholder="이메일" value="${cookie.email.value}" autofocus>
            </div>
            <div id="inputBox2">
                <i class="fa-sharp fa-solid fa-key"></i>
                <input class="detail" type="password" name="user_pwd" placeholder="비밀번호">
            </div>
        </div>
        <input type="hidden" name="toURL" value="${param.toURL}">
        <%--        --%><%--        --%>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <%--        --%><%--        --%>
        <label><input type="checkbox" name="rememberEmail" ${not empty cookie.email.value? "checked":""}>로그인 상태
            유지</label>
<%--        <div id="msg">--%>
<%--            ${param.msg}--%>
<%--        </div>--%>
        <%--        --%><%--        --%>
        <div id="msg">
            <c:if test="${LoginFailMessage!=null}">
                <p> Error : <c:out value="${LoginFailMessage}"/> </p><br/>
            </c:if>
        </div>
        <%--        --%><%--        --%>

        <button id="loginBtn">로그인</button>
        <div class="googleLogin">
            <a href="<c:url value="${google_url}"/>">
                <img width="300" src="data:image/png;base64,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">
            </a>
        </div>
    </form>
    <div id="below_form">
        <a href="">비밀번호 찾기</a> | <a href="">아이디 찾기</a> | <a href="<c:url value="/register/add"/>">회원가입</a>
    </div>
</div>


<script>
    function loginFormCheck(frm) {
        if (frm.user_email.value.length == 0) {
            setMessage("이메일을 입력해 주세요")
            return false;
        }
        if (frm.user_pwd.value.length == 0) {
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
