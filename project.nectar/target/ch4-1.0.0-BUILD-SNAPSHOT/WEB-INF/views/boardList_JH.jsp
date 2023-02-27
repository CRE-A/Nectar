<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<%--<c:set var="loginID" value="${not empty pageContext.request.getSession(false)? pageContext.request.session.getAttribute('id'):''}"/>--%>
<c:set var="loginID" value="${sessionScope.id}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CREA_WORLD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>


    <style>
        *{
            box-sizing : border-box;
            margin:0;
            padding:0;
        }

        a{
            text-decoration : none;
            color : black;
            font-weight: normal;
        }

        div>ul{
            display : flex;
            align-items: center;
            justify-content: space-between;
            list-style-type : none;
            background-color: #8edc88;
            width : 100%;
            height : 50px;
        }

        div>ul>li{
            color : white;
            font-size : 22px;
        }

        div>ul>li>a{
            color : white;
            align-items : center;
            transition : all 300ms ease-in-out;
            margin-left : 40px;
        }

        div>ul>li>a:hover{
            color:navy;
            transform: scale(1.1);
        }

        #menu_title{
            padding-left : 40px;
            margin-right : auto;
            display: flex;
        }
        /* index_JH css   */


        #searchBar{
            width :250px;
            height : 30px;
            margin : 30px 10px 20px 50px;
            padding : 10px;
        }

        #writeButton{
            width : 100px;
            height : 30px;
        }

        /*search bar*/


        #boardList_table{
            width : 900px;
            height : 450px;
            margin: auto;
            margin-top : 80px;
        }

        #table_bar{
            margin : auto;
            background-color: #aae0a5;
            width : 50px;
        }

        #table_main{
            margin : auto;
            text-align: center;
            background-color: #f2f6f6;
        }

        #table_title{
            width : 300px;
        }

        #navBar{
            padding-top : 20px;
            margin : auto;
            text-align: center;
            font-size: 18px;
        }
    </style>

</head>
<body>
<div id="menu">
    <ul>
        <li id="menu_title">CREA_WORLD</li>
        <li><a href="<c:url value='/'/>">Home</a></li>
        <li><a href="<c:url value='/board/list'/>">Board</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a> </li>
        <li><a href="<c:url value='/register/add'/>">Sign in</a> </li>
        <li><a href=""><i class="fa-solid fa-magnifying-glass"></i></a></li>
    </ul>
</div>

<script>
    let msg="${msg}"
    if(msg=="DEL_OK"){
        alert("게시물이 삭제되었습니다.")
    }
    if(msg=="WRT_OK"){
        alert("게시물이 등록되었습니다.")
    }
    if(msg=="MOD_OK"){
        alert("게시물이 수정되었습니다.")
    }
</script>

<div>
<input id="searchBar" type="text" name="search" placeholder="검색어를 입력하세요" autofocus>
<button id ="writeButton">게시판 글쓰기</button>
</div>


<table id="boardList_table">
    <tr id="table_bar">
        <th>번호</th>
        <th id="table_title">제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th>조회수</th>
    </tr>

    <c:forEach var="dto" items="${selectPage}">
    <tr id="table_main">
        <td>${dto.bno}</td>
        <td><a href="<c:url value='/board/read?bno=${dto.bno}&page=${page}&pageSize=${pageSize}'/>">${dto.title}</a></td>
        <td>${dto.writer}</td>
        <td>${dto.reg_date}</td>
        <td>${dto.view_cnt}</td>
    </tr>
    </c:forEach>
</table>

<%--model 에서 selectPage, ph, page, pageSize 넘겨줘야함--%>
<div id="navBar">
    <c:if test="${ph.showPrev}">
        <a href="<c:url value='/board/list?page=${ph.beginPage-1}&pageSize=${pageSize}'/>">&lt;</a>

    </c:if>
    <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
        <a href="<c:url value='/board/list?page=${i}&pageSize=${pageSize}'/>">${i}</a>
    </c:forEach>

    <c:if test="${ph.showNext}">
        <a href="<c:url value='/board/list?page=${ph.endPage+1}&pageSize=${pageSize}'/>">&gt;</a>
    </c:if>
</div>
</body>
</html>

<script>
    $(document).ready(()=>{
        $('#writeButton').on('click', ()=>{
        // alert("writeBtn clicked")
        location.href="<c:url value='/board/write'/>"
        })
    })
</script>
