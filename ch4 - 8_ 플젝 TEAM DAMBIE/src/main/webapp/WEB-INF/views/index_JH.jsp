<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>
<c:set var="loginID" value="${not empty pageContext.request.getSession(false)? pageContext.request.session.getAttribute('id'):''}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>


    <style>
        *{
            box-sizing : border-box;
            margin:0;
            padding:0;
        }

        a{
            text-decoration : none;
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

        #homeText{
            margin-top: 40px;
        }
    /* index_JH css   */
    </style>

</head>
<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/board/list'/>">(Board)</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">HOT딜</a> </li>
        <li><a href="<c:url value='/mat/list'/>">맛집LIST</a> </li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a> </li>
        <li><a href="<c:url value='/mycpn/list'/>">My쿠폰</a> </li>
        <li><a href="<c:url value='/mypage/list'/>">MyPage</a> </li>
<%--        <li><a href="<c:url value='/register/add'/>">Sign in</a> </li>--%>
<%--        <li><a href=""><i class="fa-solid fa-magnifying-glass"></i></a></li>--%>
    </ul>
</div>
<div id="homeText" style="text-align: center">
    <h1>This is Home</h1>
    <h1>This is Home</h1>
    <h1>This is Home</h1>
</div>

</body>
</html>
