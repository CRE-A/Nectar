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

  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/css/user.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/css/userLiking.css'/>"/>

</head>


<body>
<section id="navbar">
  <div class="logo">
    <a href="<c:url value='/'/>"> <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img"/></a>
  </div>
  <div class="searchBar">
    <form action="" class="search-form" method="get">
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
      <a href="<c:url value='/mypage/main'/>">
        <c:choose>
        <c:when test="${not empty sessionScope.Admin_email}"><i
              class="fa-solid fa-user-secret"></i></a></c:when>
      <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
      <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
      <c:otherwise>LOGIN</i></a></c:otherwise>
      </c:choose>
    </li>
  </ul>
</section>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>



<h2> "성공적으로 등록되었습니다. 사업장 심사에는 최대 일주일 가량 소요될 수 있고 , 빠른 시일 내에 고객님의 이메일( ${RestrDto.bizAccount_email} )로 답변 드리겠습니다.  심사 기간 중 추가적인 요청/문의 사항이 있다면 Mypage 하단의 QNA 게시판을 이용해 주십시오. Nectar를 이용해 주셔서 감사합니다."
</h2>