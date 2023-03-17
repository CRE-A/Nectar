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
  <link rel="stylesheet" href="<c:url value='/css/user.css'/>"/>

</head>


<body>
<section id="navbar">
  <div class="logo">
    <a href="<c:url value='/'/>">  <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img" /></a>
  </div>
  <div class="searchBar">
    <form action="" class="search-form" method="get">
      <button type="button" class="searchBtn" value="검색">
        <i class="fa-solid fa-magnifying-glass"></i>
      </button>
      <input type="hidden" name="option" value="searchEngine" />
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
        <c:when test="${not empty sessionScope.Admin_email}"><i class="fa-solid fa-user-secret"></i></a></c:when>
      <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
      <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
      <c:otherwise>LOGIN</i></a></c:otherwise>
      </c:choose>
    </li>
  </ul>
</section>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>



<%-- My Page--%>
<section id="myPage">
  <div class="sideMenu">
    <button class="userInfoUpdate">My Page</button>
    <button class="userInfoUpdate">회원정보</button>
  </div>
  <div class="userInfo">
    <h1>회원정보수정</h1>
    <form action="" id="userInfoForm">
      <div class="userInfo__box">
        <div class="userInfo__profile">
          <img
                  src="https://i.pinimg.com/564x/da/f8/77/daf8770e27db98bad904b66d48168a39.jpg"
                  alt=""
                  class="user-profile"
          />
          <label
                  for="userPrflUpld"
                  class="updateUserProfile"
                  name="user_picture"
          >사진 업데이트</label
          >
          <input type="file" class="userPrflUpld" name="user_picture" />
        </div>
        <div class="userInfo__items">
          <div class="userNameId">
            <div class="userNameId item">
              <span class="details">이름</span>
              <input type="text" name="id" required />
            </div>
            <div class="userNameId item">
              <span class="details">휴대폰</span>
              <input type="text" name="id" required />
            </div>
          </div>
          <div class="userEmail">
            <span for="">이메일</span>
            <input type="text" name="email" />
          </div>
        </div>
      </div>
      <div class="userInfo__btnWrap">
        <button class="modifyBtn">변경사항저장</button>
      </div>
    </form>
  </div>
</section>
</body>
</html>