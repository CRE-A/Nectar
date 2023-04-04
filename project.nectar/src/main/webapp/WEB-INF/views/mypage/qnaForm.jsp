<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
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
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/qnaForm.css'/>"/>

</head>


<body>

<section id="navbar">
    <div class="logo">
        <a href="<c:url value='/'/>"> <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img"/></a>
    </div>
    <div class="searchBar">
        <form action="<c:url value="/restr/search"/>" class="search-form" method="get">
            <button type="button" class="searchBtn" value="검색">
                <i class="fa-solid fa-magnifying-glass"></i>
            </button>
            <input type="hidden" name="option" value="searchEngine"/>
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

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>


<%--board--%>

<section id="board">
    <form id="qnaForm">
        <header id="header">
            <h1>QNA</h1>
        </header>
        <section id="title">
            <%--        <h1 class="title">${qnaDto.qna_title}   </h1>--%>
            <input name="qna_title" ${mode == 'new' ? '' : 'readonly = "readonly"'} value="${qnaDto.qna_title}" placeholder="제목을 입력해주세요.">
            <div class="user_info">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <c:if test="${not empty bizAccountDto && empty userDto}">
                    <input name="qna_name" type="hidden" value="${bizAccountDto.bizAccount_name}">
                    <input name="qna_writer" type="hidden" value="${bizAccountDto.bizAccount_email}">
                    <span class="name">${mode == "new" ? bizAccountDto.bizAccount_name : qnaDto.qna_name}(${mode == "new" ? bizAccountDto.bizAccount_email :qnaDto.qna_writer})</span> <span
                        class="date">${qnaDto.qna_regdate}</span>
                </c:if>
                <c:if test="${not empty userDto && empty bizAccountDto}">
                    <input name="qna_name" type="hidden" value="${userDto.user_name}">
                    <input name="qna_writer" type="hidden" value="${userDto.user_email}">
                    <span class="name">${mode == "new" ? userDto.user_name : qnaDto.qna_name}(${mode == "new" ? userDto.user_email : qnaDto.qna_writer})</span> <span
                        class="date">${qnaDto.qna_regdate}</span>
                </c:if>
            </div>
        </section>
        <section id="content">
            <textarea name="qna_content" ${mode == 'new' ? '' : 'readonly = "readonly"'} id="" cols="30" rows="10"
                      placeholder="문의글을 작성해주세요.">${qnaDto.qna_content}</textarea>
        </section>
    </form>

    <%--   QNA 답변 LIST --%>
    <h2> QNA 답변 list</h2>
    <c:forEach var="qnaCommentDto" items="${qnaCommentDto}">
        ${qnaCommentDto.qna_comment}
        ${qnaCommentDto.qna_commenter}
        </br>
    </c:forEach>
    <%--  댓글 삭제 BTN도 있어요. /mypage/admin/QNA/removeComment      --%>


    </br>
    </br>
    <%--   QNA 답변 등록 FORM --%>
    <h2> QNA 답변 등록은 여기서</h2>
    <form action="<c:url value="/mypage/admin/QNA/addComment"/>" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="hidden" name="qna_NUM" value="${qnaDto.qna_NUM}">
        <input type="text" name="qna_comment" placeholder="답변을 입력하세요." value="${qnaDto.qna_comment}">
        <input type="hidden" name="qna_commenter" value="${email}">
        <button> 답변 등록</button>
    </form>

    <%--    --%>

    <footer>


        <c:choose>
            <c:when test="${mode eq 'new'}">
                <security:authorize access="hasRole('USER')">
                    <button id="userwriteBtn">등록</button>
                </security:authorize>
                <security:authorize access="hasRole('BIZ')">
                    <button id="bizwriteBtn">등록</button>
                </security:authorize>
            </c:when>

            <c:otherwise>
                <div class="judge">
                    <security:authorize access="hasRole('USER')">
                        <a href="<c:url value='/mypage/user/main'/>">
                            <button class="listBtn">수정</button>
                        </a>
                    </security:authorize>
                    <security:authorize access="hasRole('BIZ')">
                        <a href="<c:url value='/mypage/biz/main'/>">
                            <button class="listBtn">수정</button>
                        </a>
                    </security:authorize>
                </div>

            </c:otherwise>

        </c:choose>

        <div class="judge">
            <security:authorize access="hasRole('USER')">
                <a href="<c:url value='/mypage/user/main'/>">
                    <button class="listBtn">목록</button>
                </a>
            </security:authorize>
            <security:authorize access="hasRole('BIZ')">
                <a href="<c:url value='/mypage/biz/main'/>">
                    <button class="listBtn">목록</button>
                </a>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value='/mypage/admin/main'/>">
                    <button class="listBtn">목록</button>
                </a>
            </security:authorize>
        </div>



    </footer>
</section>


<script>

    $(document).ready(() => {

        $("#userwriteBtn").on("click", function (){

            let form = $("#qnaForm");
            form.attr("action", "<c:url value='/mypage/user/QNA/write'/>");
            form.attr("method", "post");
            form.submit();

        })// 문의글 남기기

         $("#bizwriteBtn").on("click", function (){
             let form = $("#qnaForm");
             form.attr("action", "<c:url value='/mypage/biz/QNA/write'/>");
             form.attr("method", "post");
             form.submit();
        })// 문의글 남기기

    }) // ready()


</script>


</body>
</html>
