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



<h1>MYPAGE FOR BIZACCOUNT</h1>
<h1>MYPAGE FOR BIZACCOUNT</h1>
<h1>MYPAGE FOR BIZACCOUNT</h1>

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


<div id="MyRestrantlist">
  <h3>BIZ가 운영중인 레스토랑 </h3>
  <c:forEach var="restrDto" items="${restrDto}">
    ${restrDto.restr_NUM} </br>
    ${restrDto.restr_name}</br>
    ${restrDto.restr_location}</br>
    ${restrDto.restr_phone}</br>
    ${restrDto.restr_time}</br>
    ${restrDto.restr_star}</br>
    ${restrDto.restr_foodType}</br>
    ${restrDto.restr_cost}</br>
    ${restrDto.restr_parking}</br>
    ${restrDto.restr_tag}</br>
    ${restrDto.restr_menu}</br>
    ${restrDto.restr_cost}</br>
    ${restrDto.restr_menu}</br>
    ${restrDto.restr_picture}</br>
    ${restrDto.restr_viewCnt}</br>
    ${restrDto.restr_reviewCnt}</br>
    ${restrDto.restr_likeCnt}</br>
    ----------------------------------</br>
  </c:forEach>
</div>

<div id="MyhotdealList">
  <h3>Biz 가 진행 한 핫딜 </h3>
  <c:forEach var="hotdealDto" items="${hotdealDto}">
    ${hotdealDto.hotdeal_NUM} </br>
    ${hotdealDto.restr_NUM} </br>
    ${hotdealDto.restr_category_loc} </br>
    ${hotdealDto.restr_menu_NUM} </br>
    ${hotdealDto.restr_menu_picture} </br>
    ${hotdealDto.restr_menu_food} </br>
    ${hotdealDto.restr_menu_price} </br>
    ${hotdealDto.hotdeal_price} </br>
    ${hotdealDto.hotdeal_discountRate} </br>
    ${hotdealDto.hotdeal_desc} </br>
    ${hotdealDto.hotdeal_useDate} </br>
    ${hotdealDto.hotdeal_eventDuration} </br>
    ${hotdealDto.hotdeal_regdate} </br>
    ${hotdealDto.hotdeal_update} </br>
    ${hotdealDto.hotdeal_salesVolume} </br>
    ${hotdealDto.hotdeal_MaxSalesVolume} </br>
    ${hotdealDto.bizAccount_email} </br>
    ----------------------------------</br>
  </c:forEach>
</div>


<br id="BIZ_info">
  <h3>BIZ 에 대한 정보 </h3>
  ${bizAccountDto.bizAccount_email}
  ${bizAccountDto.bizAccount_pwd}
  ${bizAccountDto.bizAccount_name}
  ${bizAccountDto.bizAccount_phone}
  ${bizAccountDto.bizAccount_picture}
  ${bizAccountDto.bizAccount_regdate}
  ${bizAccountDto.bizAccount_state_code} </br>
</div>









</body>
</html>
