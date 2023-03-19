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


<%-- My Page--%>
<section id="myPage">
  <!-- Left Side -->
  <div class="sideMenu">
    <button class="sideMenu__mypage">My Page</button>
    <button class="sideMenu__user">회원정보</button>
  </div>

  <!-- Right Side -->
  <div class="userInfo">
    <div class="tab log active">
      <!-- 회원 작성 리뷰 -->
      <h1>${userDto.user_name}님이 작성한 모든 리뷰에요 ✏️</h1>
      <ul class="restrList">
        <c:forEach var="reviewDto" items="${reviewDto}">
          <li class="restr">
            <a href="">
              <img src="./img/pizza.png" alt="" class="restr__img"/>
            </a>
            <div class="restr__content">
              <div class="restr__head">
                <div class="restr__info">
                  <div class="restr__title">
                    <a href="">${reviewDto.restr_name}</a> <span
                          class="star">${reviewDto.review_star}</span>
                  </div>
                  <div class="restr__location">
                      ${reviewDto.restr_location}
                  </div>
                </div>
                <div class="restr__like">
                  <i class="fa-solid fa-heart"></i>
                </div>
              </div>
              <div class="restr__review">
                <div class="img__wrap">
                  <img
                          src="https://images.unsplash.com/photo-1679164841386-f6897cbe0e02?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60"
                          alt=""
                          class="user-picture"
                  />
                </div>

                <div class="user-review__wrap">
                  <span class="user-name">${userDto.user_name}</span>
                  <span class="user-review"
                  > ${reviewDto.review_comment}

                  </span>
                  <span class="reviewReadBtn">더보기</span>
                </div>
              </div>
            </div>
          </li>
        </c:forEach>
      </ul>
      <!-- 회원이 누른 좋아요 -->
      <h1>${userDto.user_name}님이 좋아요 누른 맛집이에요 ❤️</h1>
      <ul class="likeRestrList">
        <c:forEach var="getMyLikeList" items="${getMyLikeList}">

          <li class="likeRestr">
            <div class="likeRestr__imgWrap">
              <img
                      src="https://images.unsplash.com/photo-1627834377411-8da5f4f09de8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fCVFQyVCQyU4MCVFQyU5RCVCNCVFRCU4MSVBQ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"
                      alt=""
                      class="likeRestr__img"
              />
            </div>
            <div class="likeRestr__content">
              <h3 class="likeRestr__content name">${getMyLikeList.restr_name}</h3>
              <div class="likeRestr__content foodtype">
                <h6>음식종류 <span>${getMyLikeList.restr_foodType}</span></h6>
              </div>
              <div class="likeRestr__content location">
                <h6>지역<span> ${getMyLikeList.restr_location}</span></h6>
              </div>
            </div>
          </li>
        </c:forEach>

      </ul>
    </div>

    <div class="tab user">
      <!-- 회원정보수정 -->
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
            <input type="file" class="userPrflUpld" name="user_picture"/>
          </div>
          <div class="userInfo__items">
            <div class="userNameId">
              <div class="userNameId item">
                <span class="details">이름</span>
                <input type="text" name="name" value="${userDto.user_name}" required/>
              </div>
              <div class="userNameId item">
                <span class="details">휴대폰</span>
                <input type="text" name="phone" value="${userDto.user_phone}" required/>
              </div>
            </div>
            <div class="userEmail">
              <span for="">이메일</span>
              <input type="text" name="email" value="${userDto.user_email}" required/>
            </div>
          </div>
        </div>
        <div class="userInfo__btnWrap">
          <button class="modifyBtn">변경사항저장</button>
        </div>
      </form>
    </div>
  </div>
</section>



<%--<div id="MyReviewlist">--%>
<%--  <h3>Use 가 작성한 모든 리뷰 </h3>--%>
<%--  <c:forEach var="reviewDto" items="${reviewDto}">--%>
<%--    ${reviewDto.review_NUM}--%>
<%--    ${reviewDto.restr_NUM}--%>
<%--    ${reviewDto.user_email}--%>
<%--    ${reviewDto.user_name}--%>
<%--    ${reviewDto.user_picture}--%>
<%--    ${reviewDto.review_comment}--%>
<%--    ${reviewDto.review_picture}--%>
<%--    ${reviewDto.review_star}--%>
<%--    ${reviewDto.review_regdate}--%>
<%--    ${reviewDto.review_update}</br>--%>
<%--    ----------------------------------</br>--%>
<%--  </c:forEach>--%>
<%--</div>--%>

<%--<div id="MyLikelist">--%>
<%--  <h3>User 가 좋아요 누른 모든 가게 </h3>--%>
<%--  <c:forEach var="getMyLikeList" items="${getMyLikeList}">--%>
<%--    ${getMyLikeList.restr_NUM} </br>--%>
<%--    ${getMyLikeList.restr_name}</br>--%>
<%--    ${getMyLikeList.restr_location}</br>--%>
<%--    ${getMyLikeList.restr_phone}</br>--%>
<%--    ${getMyLikeList.restr_time}</br>--%>
<%--    ${getMyLikeList.restr_star}</br>--%>
<%--    ${getMyLikeList.restr_foodType}</br>--%>
<%--    ${getMyLikeList.restr_cost}</br>--%>
<%--    ${getMyLikeList.restr_parking}</br>--%>
<%--    ${getMyLikeList.restr_tag}</br>--%>
<%--    ${getMyLikeList.restr_menu}</br>--%>
<%--    ${getMyLikeList.restr_cost}</br>--%>
<%--    ${getMyLikeList.restr_menu}</br>--%>
<%--    ${getMyLikeList.restr_picture}</br>--%>
<%--    ${getMyLikeList.restr_viewCnt}</br>--%>
<%--    ${getMyLikeList.restr_reviewCnt}</br>--%>
<%--    ${getMyLikeList.restr_likeCnt}</br>--%>
<%--    ----------------------------------</br>--%>
<%--  </c:forEach>--%>
<%--</div>--%>


<%--<div id="user_info">--%>
<%--  <h3>User 에 대한 정보 </h3>--%>
<%--  ${userDto.user_email}--%>
<%--  ${userDto.user_pwd}--%>
<%--  ${userDto.user_name}--%>
<%--  ${userDto.user_phone}--%>
<%--  ${userDto.user_picture}--%>
<%--  ${userDto.user_regdate}--%>
<%--  ${userDto.user_state_code}</br>--%>
<%--</div>--%>


</body>
</html>

<script>
  const mypageTab = document.querySelector(".sideMenu__mypage");
  const mypage = document.querySelector(".tab.log.active");

  const userTab = document.querySelector(".sideMenu__user");
  const info = document.querySelector(".tab.user");

  mypageTab.addEventListener("click", (e) => {
    if (mypage.className === "tab log active") {
      return;
    }
    info.classList.toggle("active");
    mypage.classList.toggle("active");
  });

  userTab.addEventListener("click", (e) => {
    if (info.className === "tab user active") {
      return;
    }

    info.classList.toggle("active");
    mypage.classList.toggle("active");
  });
</script>