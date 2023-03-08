<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>
<c:set var="loginID" value="${sessionScope.User_email}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREA_WORLD</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script
          src="https://kit.fontawesome.com/43ede2213f.js"
          crossorigin="anonymous"
  ></script>

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/restrList.css'/>" />


</head>
<body>
<div id="menu">
  <ul>
    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
    <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
    <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
  </ul>
</div>


<!-- Main -->
<section id="main">
  <ul id="restrList">
    <c:forEach var="restrDto" items="${list}">
      <li class="restr">
        <a href="<c:url value='/restr/read${ph.sc.queryString}&restr_NUM=${restrDto.restr_NUM}'/>">
          <img src="./img/pizza.png" alt="" class="restr__img" />
        </a>
        <div class="restr__content">
          <div class="restr__head">
            <div class="restr__info">
              <div class="restr__title">
                <a href="">${restrDto.restr_name}</a> <span class="star">${restrDto.restr_star}</span>
              </div>
              <div class="restr__location">
                  ${restrDto.restr_location}
                <span class="foodType">${restrDto.restr_foodType}</span>
              </div>
              <div class="restr__reaction">
                <i class="fa-regular fa-eye"></i> <span>${restrDto.restr_viewCnt}</span>
                <i class="fa-solid fa-pencil"></i> <span>${restrDto.restr_reviewCnt}</span>
              </div>
            </div>
            <div class="restr__like">
              <i class="fa-regular fa-heart"></i>
            </div>
          </div>
        </div>
      </li>
    </c:forEach>

  </ul>
</section>


<%--model 에서 list, ph(page, pageSize 포함) 넘겨줘야함--%>
<div id="pageBar">
  <c:if test="${ph.showPrev}">
    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
  </c:if>
  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
    <a href="<c:url value='/restr/list${ph.sc.getQueryString(i)}'/>">${i}</a>
  </c:forEach>
  <c:if test="${ph.showNext}">
    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
  </c:if>
</div>

</body>
</html>








<%--/////////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


<%--<%@ page language="java" contentType="text/html; charset=UTF-8"%>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page session="true"%>--%>
<%--<c:set var="loginID" value="${sessionScope.Admin_email}"/>--%>
<%--<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>--%>
<%--<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>--%>


<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <title>CREA_WORLD</title>--%>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>--%>
<%--  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>--%>

<%--  <style>--%>
<%--    *{--%>
<%--      box-sizing : border-box;--%>
<%--      margin:0;--%>
<%--      padding:0;--%>
<%--    }--%>

<%--    a{--%>
<%--      text-decoration : none;--%>
<%--      color : black;--%>
<%--      font-weight: normal;--%>
<%--    }--%>

<%--    div>ul{--%>
<%--      display : flex;--%>
<%--      align-items: center;--%>
<%--      justify-content: space-between;--%>
<%--      list-style-type : none;--%>
<%--      background-color: #8edc88;--%>
<%--      width : 100%;--%>
<%--      height : 50px;--%>
<%--    }--%>

<%--    div>ul>li{--%>
<%--      color : white;--%>
<%--      font-size : 22px;--%>
<%--    }--%>

<%--    div>ul>li>a{--%>
<%--      color : white;--%>
<%--      align-items : center;--%>
<%--      transition : all 300ms ease-in-out;--%>
<%--      margin-left : 40px;--%>
<%--    }--%>

<%--    div>ul>li>a:hover{--%>
<%--      color:navy;--%>
<%--      transform: scale(1.1);--%>
<%--    }--%>

<%--    #menu_title{--%>
<%--      padding-left : 40px;--%>
<%--      margin-right : auto;--%>
<%--      display: flex;--%>
<%--    }--%>
<%--    /* index_JH css   */--%>

<%--    #board_h2{--%>
<%--      margin-top: 30px;--%>
<%--      margin-bottom: 20px;--%>
<%--      font-size: 30px;--%>
<%--      text-align: center;--%>
<%--    }--%>

<%--    #board_form{--%>
<%--      margin-bottom: 10px;--%>
<%--      width : 700px;--%>
<%--      height : 800px;--%>
<%--      margin:auto;--%>
<%--      text-align: center;--%>
<%--    }--%>

<%--    form>input[type=text], form>textarea{--%>
<%--      display: flex;--%>
<%--      flex-direction: column;--%>
<%--      margin : auto;--%>
<%--      margin-bottom: 10px;--%>
<%--      border-radius: 10px;--%>
<%--      padding : 10px;--%>
<%--    }--%>

<%--    form>input[type=text]{--%>
<%--      width : 500px;--%>
<%--      height : 50px;--%>
<%--      border-color: #b4a29a;--%>
<%--    }--%>

<%--    form>textarea{--%>
<%--      width : 500px;--%>
<%--      height : 300px;--%>
<%--      border-color: #b4a29a;--%>
<%--    }--%>

<%--    .board_btn{--%>
<%--      font-size: 18px;--%>
<%--      background-color: #b4a29a;--%>
<%--    }--%>

<%--  </style>--%>

<%--</head>--%>
<%--<body>--%>
<%--<div id="menu">--%>
<%--  <ul>--%>
<%--    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>--%>
<%--    <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>--%>
<%--    <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>--%>
<%--    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
<%--  </ul>--%>
<%--</div>--%>





<%--&lt;%&ndash;/////////////////////////////TEST////////////////////////////////////////////&ndash;%&gt;--%>
<%--<table id="boardList_table">--%>
<%--  <tr id="table_bar">--%>
<%--    <th>NUM</th>--%>
<%--    <th id="table_title">name</th>--%>
<%--    <th>location</th>--%>
<%--    <th>location_tag</th>--%>
<%--    <th>phone</th>--%>
<%--    <th>time</th>--%>
<%--    <th>star</th>--%>
<%--    <th>foodType</th>--%>
<%--    <th>cost</th>--%>
<%--    <th>parking</th>--%>
<%--    <th>tag</th>--%>
<%--    <th>menu</th>--%>
<%--    <th>desc</th>--%>
<%--    <th>picture</th>--%>
<%--    <th>category_loc</th>--%>
<%--    <th>biz_reg_num</th>--%>
<%--    <th>viewCnt</th>--%>
<%--    <th>reviewCnt</th>--%>
<%--    <th>likeCnt</th>--%>
<%--  </tr>--%>

<%--  <c:forEach var="restrDto" items="${list}">--%>
<%--    <tr id="table_main">--%>
<%--      <td>${restrDto.restr_NUM}</td>--%>
<%--&lt;%&ndash;      <td><a href="<c:url value='/restr/read?restr_NUM=${restrDto.restr_NUM}&page=${page}&pageSize=${pageSize}'/>">${restrDto.restr_name}</a></td>&ndash;%&gt;--%>
<%--      <td><a href="<c:url value='/restr/read${ph.sc.queryString}&restr_NUM=${restrDto.restr_NUM}'/>">${restrDto.restr_name}</a></td>--%>
<%--      <td>${restrDto.restr_location}</td>--%>
<%--      <td>${restrDto.restr_location_tag}</td>--%>
<%--      <td>${restrDto.restr_phone}</td>--%>
<%--      <td>${restrDto.restr_time}</td>--%>
<%--      <td>${restrDto.restr_star}</td>--%>
<%--      <td>${restrDto.restr_foodType}</td>--%>
<%--      <td>${restrDto.restr_cost}</td>--%>
<%--      <td>${restrDto.restr_parking}</td>--%>
<%--      <td>${restrDto.restr_tag}</td>--%>
<%--      <td>${restrDto.restr_menu}</td>--%>
<%--      <td>${restrDto.restr_desc}</td>--%>
<%--      <td>${restrDto.restr_picture}</td>--%>
<%--      <td>${restrDto.restr_category_loc}</td>--%>
<%--      <td>${restrDto.biz_reg_num}</td>--%>
<%--      <td>${restrDto.restr_viewCnt}</td>--%>
<%--      <td>${restrDto.restr_reviewCnt}</td>--%>
<%--      <td>${restrDto.restr_likeCnt}</td>--%>
<%--    </tr>--%>
<%--  </c:forEach>--%>
<%--</table>--%>

<%--&lt;%&ndash;model 에서 list, ph(page, pageSize 포함) 넘겨줘야함&ndash;%&gt;--%>
<%--<div id="pageBar">--%>
<%--  <c:if test="${ph.showPrev}">--%>
<%--    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>--%>
<%--  </c:if>--%>
<%--  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">--%>
<%--    <a href="<c:url value='/restr/list${ph.sc.getQueryString(i)}'/>">${i}</a>--%>
<%--  </c:forEach>--%>
<%--  <c:if test="${ph.showNext}">--%>
<%--    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>--%>
<%--  </c:if>--%>
<%--</div>--%>
<%--&lt;%&ndash;/////////////////////////////TEST////////////////////////////////////////////&ndash;%&gt;--%>




<%--</body>--%>
<%--</html>--%>



