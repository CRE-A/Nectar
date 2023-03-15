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
    <button class="userInfoUpdate">회원정보</button>
    <button class="userInfoUpdate">회원정보</button>
  </div>
  <div class="userInfo">
    <h1>회원정보수정</h1>
    <form action="" id="userInfoForm">
      <div class="userInfo__box">
        <div class="userInfo__profile">
          <img src="./img/hani.jpg" alt="" class="user-profile" />
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
            <label for="">이름</label>
            <input type="text" name="name" />
            <label for="">아이디</label>
            <input type="text" name="id" />
          </div>
          <div class="userEmail">
            <label for="">이메일</label>
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
