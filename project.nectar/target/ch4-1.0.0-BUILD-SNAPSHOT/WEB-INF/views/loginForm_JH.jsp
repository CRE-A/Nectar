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



        #form_container{
            margin : auto;
            margin-top : 150px;
            display: flex;
            flex-direction : column;
            align-items: center;
        }


        #title{
            text-align:center;
            margin : 20px;
            color: lightgreen;
            font-size : 48px;
            font-weight : bolder;
        }

        form{

            display:flex;
            flex-direction : column;
            align-items:center;
            width : 500px;
            height : 350px;
            /*border: black;*/
            background-color : white;
            border-radius : 10px;
            /*border : 5px black;*/
            padding-top: 10px;
            border: solid;
            border-color : lightgray;
        }

        #inputBox{
            border : solid;
            border-radius: 10px;
            border-color : lightgray;

        }

        #inputBox1{
            padding:0 10px;
            border-bottom : solid;
            border-color : lightgray;


        }

        #inputBox2{
            padding:0 10px;
        }

        form>div>i{
            margin-left : 10px;
        }

        input[type="text"], input[type="password"]{
            width : 400px;
            height: 40px;
            border-radius : 5px;
            padding : 10px;
            background-color : lightblue;
            box-sizing : border-box;
            border:none;
            margin : 10px;
        }

        form>label{
            margin-right: auto;
            margin-left : 20px;
            margin-top : 8px;
            margin-bottom :15px;
        }


        #loginBtn{
            width : 85%;
            height : 60px;
            background-color:lightgreen;
            border: none;
            border-radius: 5px;
            color : white;
            font-size : 24px;
        }

        #below_form{
            padding : 20px;
        }

        #msg{
            color : red;
            font-size : 18px;
            margin-bottom: 20px;
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

<div id="form_container">
    <h1 id="title">NAVER</h1>
    <form action="<c:url value="/login/login"/>" method="post" onsubmit="return loginFormCheck(this);">
        <div id="inputBox">
            <div id="inputBox1">
                <i class="fa-solid fa-id-badge"></i>
<%--                <i class="fa-regular fa-id-badge"></i>--%>
                <input type="text" name="id" placeholder="아이디" value="${cookie.id.value}" autofocus>
            </div>

            <div id="inputBox2">
                <i class="fa-sharp fa-solid fa-key"></i>
                <input type="password" name="pwd" placeholder="비밀번호" value="${cookie.pwd.value}">
            </div>

        </div>
        <input type="hidden" name="toURL" value="${param.toURL}">
        <label><input type="checkbox" name="rememberIdPwd" ${not empty cookie.id.value? "checked":""}>로그인 상태 유지</label>
        <div id="msg">
<%--            ${not empty param.msg ? URLDecoder.decode(param.msg): ""}--%>
<%--            ${URLDecoder.decode(param.msg)}--%>
            ${param.msg}
        </div>
        <button id="loginBtn">로그인</button>
    </form>
    <div id="below_form">
        <a href="">비밀번호 찾기</a> | <a href="">아이디 찾기</a> | <a href="">회원가입</a>
    </div>
</div>

<script>
    function loginFormCheck(frm){
        if(frm.id.value.length==0){
            setMessage("아이디를 입력해 주세요")
            return false;
        }
        if(frm.pwd.value.length==0){
            setMessage("비밀번호를 입력해 주세요.")
            return false;
            }
        return true;
    }

    function setMessage(msg){
        document.getElementById("msg").innerHTML= `${'${msg}'}`;
        <%--$('#msg').innerHTML = `${'${msg}'}`--%>
    }
</script>

</body>
</html>