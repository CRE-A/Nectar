<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
  <link rel="stylesheet" href="<c:url value='/css/mypage.css'/>"/>

</head>


<body>
<div id="menu">
  <ul>
    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
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

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>


<h1>MYPAGE FOR ADMINISTRATOR</h1>
<h1>MYPAGE FOR ADMINISTRATOR</h1>
<h1>MYPAGE FOR ADMINISTRATOR</h1>











<section id="myPage">
  <div class="sideMenu">
    <button class="userInfoUpdate"> 회원 관리</button>
    <button class="userInfoUpdate">사업 관리</button>
  </div>
  <div class="userInfo">
    <h1>회원 리스트</h1>
    <div class="userList">
      <table >
        <thead>
        <tr>
          <th>no</th>
          <th class="name">이름</th>
          <th>이메일</th>
          <th>휴대폰</th>
          <th>회원등급</th>
          <th>상태변경</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach var="userDto" items="${list}">
          <form action="/" method="post" id="adminForm">
            <tr>
              <td><input type="hidden" name="user_NUM" value="31">31</td>
              <td><input type="hidden" name="user_name" value="홍혜빈">홍혜빈</td>
              <td><input type="hidden" name="user_email" value="">hongbin12345@naver.com</td>
              <td><input type="hidden" name="user_ph" value="">01080218815</td>
              <td>
                <select name="user_state_code">
                  <option value="0">일반회원</option>
                  <option value="-1">리뷰작성금지</option>
                  <option value="-2">핫딜결제금지</option>
                  <option value="-3">계정삭제</option>
                </select>
              </td>
              <td>
                <input class="userBtn" type="submit" value="회원등급변경">
              </td>
            </tr>
          </form>

        </c:forEach>

        </tbody>
      </table>
    </div>
</section>


<form action=""></form>

<select name="" id="">
  <option value="">전체</option>
  <option value="">이메일</option>
  <option value="">이름</option>
  <option value="">상태코드</option>
</select>

<input type="text" >
<button>검색</button>





<%--<div id="user_info">--%>
<%--  <h3>User 에 대한 정보 </h3>--%>
<%--  <c:forEach var="SearchResultUserList" items="SearchResultUserList">--%>
<%--    ${SearchResultUserList.user_email}--%>
<%--    ${SearchResultUserList.user_pwd}--%>
<%--    ${SearchResultUserList.user_name}--%>
<%--    ${SearchResultUserList.user_phone}--%>
<%--    ${SearchResultUserList.user_picture}--%>
<%--    ${SearchResultUserList.user_regdate}--%>
<%--    ${SearchResultUserList.user_state_code}</br>--%>
<%--  </c:forEach>--%>
<%--</div>--%>


<%--<div id="Biz_info">--%>
<%--  <h3>User 에 대한 정보 </h3>--%>
<%--  <c:forEach var="SearchResultUserList" items="SearchResultUserList"--%>
<%--  ${SearchResultBizAccountList.user_email}--%>
<%--  ${SearchResultBizAccountList.user_pwd}--%>
<%--  ${SearchResultBizAccountList.user_name}--%>
<%--  ${SearchResultBizAccountList.user_phone}--%>
<%--  ${SearchResultBizAccountList.user_picture}--%>
<%--  ${SearchResultBizAccountList.user_regdate}--%>
<%--  ${SearchResultBizAccountList.user_state_code}</br>--%>
<%--</div>--%>


</body>
</html>
