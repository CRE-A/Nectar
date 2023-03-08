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

        #board_h2{
            margin-top: 30px;
            margin-bottom: 20px;
            font-size: 30px;
            text-align: center;
        }

        #board_form{
            margin-bottom: 10px;
            width : 700px;
            height : 800px;
            margin:auto;
            text-align: center;
        }

        form>input[type=text], form>textarea{
            display: flex;
            flex-direction: column;
            margin : auto;
            margin-bottom: 10px;
            border-radius: 10px;
            padding : 10px;
        }

        form>input[type=text]{
            width : 500px;
            height : 50px;
            border-color: #b4a29a;
        }

        form>textarea{
            width : 500px;
            height : 300px;
            border-color: #b4a29a;
        }

        .board_btn{
            font-size: 18px;
            background-color: #b4a29a;
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

<script>
    let msg="${msg}"
    if(msg=="DEL_ERR"){
        alert("게시물 삭제에 샐패했습니다")
    }
    if(msg=="WRT_ERR"){
        alert("게시물 등록에 샐패했습니다")
    }
    if(msg=="MOD_ERR"){
        alert("게시물 수정에 샐패했습니다")
    }
</script>

<div id="board_container">
    <h2 id="board_h2">${mode=="new"? "게시물 쓰기" : "게시물 읽기" }</h2>
    <form id="board_form">
        <input type="hidden" name="bno" value="${dto.bno}" readonly="readonly" />
        <input type="text" name="title" value="${dto.title}" ${mode=="new"? "" : "readonly='readonly'"} />
        <textarea name="content" rows="10" cols="30" ${mode=="new"? "" : "readonly='readonly'"}>${dto.content}</textarea>
<%--        <button id="writeBtn" class="board_btn">등록</button>--%>
<%--        <button id="modifyBtn" class="board_btn" type="button">수정</button>--%>
<%--        <button id="deleteBtn" class="board_btn">삭제</button>--%>
        <button id="listBtn" class="board_btn" type="button">목록</button>

    </form>

</div>

<script>
    $(document).ready(()=>{
        $('#listBtn').on('click',()=>{
            // alert("listBtn clicked")
            location.href="<c:url value='/cafe/list?page=${page}&pageSize=${pageSize}'/>"
        })

<%--        &lt;%&ndash;$('#deleteBtn').on('click',()=>{&ndash;%&gt;--%>
<%--        &lt;%&ndash;    if(!confirm("정말로 삭제하시겠습니까?")) return ;&ndash;%&gt;--%>
<%--        &lt;%&ndash;    let form = $('#board_form')&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.attr("action","<c:url value='/board/delete'/>?page=${page}&pageSize=${pageSize}")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.attr("method","post")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.submit();&ndash;%&gt;--%>
<%--        &lt;%&ndash;})&ndash;%&gt;--%>
<%--        --%>
<%--        &lt;%&ndash;$('#writeBtn').on('click',()=>{&ndash;%&gt;--%>
<%--        &lt;%&ndash;    let form = $('#board_form')&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.attr("action","<c:url value='/board/write'/>")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.attr("method","post")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    form.submit()&ndash;%&gt;--%>
<%--        &lt;%&ndash;})&ndash;%&gt;--%>
<%--        --%>
<%--        &lt;%&ndash;$('#modifyBtn').on('click',()=>{&ndash;%&gt;--%>
<%--        &lt;%&ndash;    //읽기 모드면, 수정 상태로 변경&ndash;%&gt;--%>
<%--        &lt;%&ndash;    let form = $('#board_form')&ndash;%&gt;--%>
<%--        &lt;%&ndash;    let isReadOnly = $("input[name=title]").attr("readonly")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    // alert("modifyBtn clicked")&ndash;%&gt;--%>
<%--        &lt;%&ndash;    if(isReadOnly=='readonly'){&ndash;%&gt;--%>
<%--        &lt;%&ndash;        // alert("readonly= 'readonly'");&ndash;%&gt;--%>
<%--        &lt;%&ndash;        $('#board_h2').html("게시물 수정")&ndash;%&gt;--%>
<%--        &lt;%&ndash;        $('input[name=title]').attr("readonly",false);&ndash;%&gt;--%>
<%--        &lt;%&ndash;        $('textarea[name=content]').attr("readonly",false);&ndash;%&gt;--%>
<%--        &lt;%&ndash;        $('#modifyBtn').html("<i class='fa fa-pencil'></i> 등록")&ndash;%&gt;--%>
<%--        &lt;%&ndash;        $('#writeBtn').html("글쓰기등록")&ndash;%&gt;--%>
<%--        &lt;%&ndash;        return ;&ndash;%&gt;--%>
<%--            }--%>
<%--                &lt;%&ndash;form.attr("action","<c:url value='/board/modify'/>?page=${page}&pageSize=${pageSize}")&ndash;%&gt;--%>
<%--                form.attr("action","<c:url value='/board/modify?page=${page}&pageSize=${pageSize}'/>")--%>
<%--                form.attr("method","post")--%>
<%--                form.submit();--%>

<%--            //수정 모드면, 등록--%>
<%--        })--%>

    })
</script>

</body>
</html>
