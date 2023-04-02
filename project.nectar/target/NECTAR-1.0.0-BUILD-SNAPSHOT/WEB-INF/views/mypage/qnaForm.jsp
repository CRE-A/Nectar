<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="email"/>


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
            <sec:authorize access="isAnonymous()">
                <a href="<c:url value='/login/login'/>">LOGIN</a>
            </sec:authorize>
            <sec:authorize access="hasRole('USER')">
                <a href="<c:url value='/mypage/user/main'/>"><i class="fa-solid fa-user"></i></a>
            </sec:authorize>
            <sec:authorize access="hasRole('BIZ')">
                <a href="<c:url value='/mypage/biz/main'/>"><i class="fa-solid fa-user-tie"></i></a>
            </sec:authorize>
            <sec:authorize access="hasRole('ADMIN')">
                <a href="<c:url value='/mypage/admin/main'/>"><i class="fa-solid fa-user-secret"></i></a>
            </sec:authorize>
        </li>
    </ul>
</div>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>



<%--board--%>

<section id="board">
    <header id="header">
        <h1>FAQ</h1>
    </header>
    <section id="title">
        <h1 class="title">${qnaDto.qna_title}</h1>
        <div class="user_info">
            <span class="name">${qnaDto.qna_name}(${qnaDto.qna_writer})</span> <span class="date">${qnaDto.qna_regdate}</span>
        </div>
    </section>
    <section id="content">
        ${qnaDto.qna_content}
    </section>




    <%--   QNA 답변 LIST --%>
    <h2> QNA 답변 list</h2>
    <c:forEach var="qnaCommentDto" items="${qnaCommentDto}">
        ${qnaCommentDto.qna_comment}
        ${qnaCommentDto.qna_commenter}
        </br>
    </c:forEach>




    </br>
    </br>
    <%--   QNA 답변 등록 FORM --%>
    <h2> QNA 답변 등록은 여기서</h2>
    <form  action="<c:url value="/mypage/admin/QNA/addComment"/>" method="post" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="qna_NUM" value="${qnaDto.qna_NUM}">
        <input type="text" name="qna_comment" placeholder="답변을 입력하세요." value="${qnaDto.qna_comment}">
        <input type="hidden" name="qna_commenter" value="${email}">
        <button> 답변 등록</button>
    </form>

    <%--    --%>





    <footer>
        <div class="judge">
            <a href="<c:url value='/mypage/admin/main'/>"><button class="listBtn">목록</button></a>
        </div>
    </footer>
</section>


<script>

    $(document).ready(() => {





    }) // ready()


</script>


</body>
</html>
