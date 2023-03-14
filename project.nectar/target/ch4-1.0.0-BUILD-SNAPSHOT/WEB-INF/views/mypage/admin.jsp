<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="loginAdminEmail" value="${sessionScope.Admin_email}"/>
<c:set var="loginOut" value="${not empty loginAdminEmail ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginAdminEmail ?'/login/logout' : '/login/login'}"/>


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
