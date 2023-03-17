<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Nectar</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/css/restrList.css'/>"/>
  <%--  script --%>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script
          src="https://kit.fontawesome.com/43ede2213f.js"
          crossorigin="anonymous"
  ></script>

</head>
<body>
<div id="menu">
  <ul>
    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
    <li>
      <form action="<c:url value="/restr/search"/>" class="search-form" method="get">
        <input type="hidden" name="option" value="searchEngine"/>
        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식">
        <input type="submit" class="search-button" value="검색">
      </form>
    </li>
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


<%--/////////TagFilter 시작///////////////////////////////////////////////--%>



  <div id="tag10" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag='/>">#전체</a>
      <img src=""> ${tagPic}
    </label>
  </div>


  <div id="tag01" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=인스타그램'/>">#인스타그램</a>
      <img src=""> ${tagPic}
    </label>
  </div>

  <div id="tag02" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=데이트'/>">#데이트</a>
      <img src="">
    </label>
  </div>


  <div id="tag03" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=분위기 좋은곳'/>">#분위기 좋은곳</a>
      <img src="">
    </label>
  </div>


  <div id="tag04" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=가로수길'/>">#가로수길</a>
      <img src="">
    </label>
  </div>

  <div id="tag05" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=핫플'/>">#핫플</a>
      <img src="">
    </label>
  </div>

  <div id="tag06" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=커플'/>">#커플</a>
      <img src="">
    </label>
  </div>


  <div id="tag07" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=예쁜'/>">#예쁜</a>
      <img src="">
    </label>
  </div>

  <div id="tag08" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=셀카'/>">#셀카</a>
      <img src="">
    </label>
  </div>

  <div id="tag09" class="tag__list__wrap">
    <label>
      <a href="<c:url value='/restr/search?option=tagFilter&tag=셀카'/>">#인스타</a>
      <img src="">
    </label>
  </div>


</body>
</html>
