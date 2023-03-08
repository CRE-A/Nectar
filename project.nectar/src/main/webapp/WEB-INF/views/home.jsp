<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginID"  value="${not empty pageContext.request.getSession(false)? pageContext.request.session.getAttribute('User_email'):''}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREA_WORLD</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />

  <script>
    function trackEvent() {
      window.open("<c:url value='/home/filter'/>", "popup", "width=600,height=700,left=100,top=50");
    }

  </script>
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


<div style="text-align:center">
  <div class="board-container">
    <h2 style="text-align: center">멍멍이도 야옹하는 그 맛, 매일 새로운 핫딜 <br> Nectar </h2>
    <div class="search-container">
      <div style="margin: 10pt">
        <input type="image" onclick="trackEvent()" style="display: block" width=45pt" height="45pt"
               src="img/filter.png">
      </div>
      <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식"
               th:field="food01">
        <input type="hidden" name="option" value="searchEngine"/>
        <input type="submit" class="search-button" value="검색">
      </form>
    </div>
  </div>
</div>

</body>
</html>
