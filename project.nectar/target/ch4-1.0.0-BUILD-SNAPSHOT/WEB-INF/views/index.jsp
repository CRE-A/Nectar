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
    <title>CREA_WORLD</title>
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
            margin-right: 20px;
        }

        div>ul>li>a{
            color : white;
            align-items : center;
            transition : all 300ms ease-in-out;
            margin-left : 20px;
        }

        div>ul>li>a:hover{
            color:navy;
            transform: scale(1.1);
        }

        #menu_title{
            padding-left : 10px;
            margin-right : auto;
            display: flex;
        }

    /* index_JH css   */

        .board-container {
            width: 60%;
            height: 1200px;
            margin: 0 auto;
            /* border: 1px solid black; */
        }
        .search-container {
            background-color: rgb(253, 253, 250);
            width: 100%;
            height: 110px;
            border: 1px solid #ddd;
            margin-top : 10px;
            margin-bottom: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .search-form {
            height: 37px;
            display: flex;
        }
        .search-option {
            width: 100px;
            height: 100%;
            outline: none;
            margin-right: 5px;
            border: 1px solid #ccc;
            color: gray;
        }
        .search-option > option {
            text-align: center;
        }
        .search-input {
            color: gray;
            background-color: white;
            border: 1px solid #ccc;
            height: 100%;
            width: 300px;
            font-size: 15px;
            padding: 5px 7px;
        }
        .search-input::placeholder {
            color: gray;
        }
        .search-button {
            /* 메뉴바의 검색 버튼 아이콘  */
            width: 20%;
            height: 100%;
            background-color: rgb(22, 22, 22);
            color: rgb(209, 209, 209);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 15px;
        }
        .search-button:hover {
            color: rgb(165, 165, 165);
        }


    </style>

</head>
<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/cafe/list'/>">카페리스트</a></li>
        <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a> </li>
<%--        <li><a href="<c:url value='/register/add'/>">Sign in</a> </li>--%>
<%--        <li><a href=""><i class="fa-solid fa-magnifying-glass"></i></a></li>--%>
    </ul>
</div>



<div style="text-align:center">
    <div class="board-container">
        <h2 style="text-align: center">멍멍이도 야옹하는 그 맛, 매일 새로운 핫딜<br>넥터 </h2>
        <div class="search-container">
            <form action="<c:url value="/cafe/list"/>" class="search-form" method="get">
                <select class="search-option" name="option">
                    <option value="A" ${ph.sc.option=='A' || ph.sc.option=='' ? "selected" : ""}>식당</option>
                    <option value="T" ${ph.sc.option=='T' ? "selected" : ""}>지역</option>
                    <option value="W" ${ph.sc.option=='W' ? "selected" : ""}>음식</option>
                </select>

                <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식">
                <input type="submit" class="search-button" value="검색">
            </form>
        </div>
    </div>
</div>
</body>
</html>
