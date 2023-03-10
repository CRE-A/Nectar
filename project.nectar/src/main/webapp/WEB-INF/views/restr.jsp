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
  <!-- Swiper Css -->
  <link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/restr.css'/>" />
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script src="https://kit.fontawesome.com/43ede2213f.js"  crossorigin="anonymous" ></script>

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


<body>
<!-- Restaurant Detail Page -->

<!-- Title -->

<section id="restr-detail">
  <div class="title-box">
    <h3 class="title">
      ${restrDto.restr_name}
      <strong class="star">${restrDto.restr_star}</strong>
    </h3>
    <ul class="reaction">
      <li class="reaction likeCnt">
        <i class="fa-regular fa-heart"></i>
        <span class="reaction restr__likeCnt">
          ${restrDto.restr_likeCnt}</span
        >
      </li>
      <li class="reaction reviewCnt">
        <i class="fa-solid fa-pencil"></i>
        <span class="reaction restr_reviewCnt">
          ${restrDto.restr_reviewCnt}</span
        >
      </li>
      <li class="reaction viewCnt">
        <i class="fa-regular fa-eye"></i>
        <span class="reaction restr__viewCnt">
          ${restrDto.restr_viewCnt}</span
        >
      </li>
    </ul>
  </div>

  <!-- Review IMG Slider -->


  <!-- Review IMG Slider -->
  <!-- Swiper -->
  <div class="swiper mySwiper">
    <div class="swiper-wrapper">
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
<%--        <img src="${restrPic.restr_pic_path}" />--%>
<%--        restr_pic 테이블에 사진이 여러장(4~5장)이라, foreach를 쓰면서 restr_pic의 list를 나열 --%>
      </div>
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
      </div>
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
      </div>
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
      </div>
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
      </div>
      <div class="swiper-slide">
        <img src="<c:url value='/images/pizza.png'/>" />
      </div>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-scrollbar"></div>
    <div class="swiper-pagination"></div>
  </div>

  <!-- Restaurant Information -->

  <div class="content">
    <section class="section-left">
      <div class="info">
        <h4 class="location">지역</h4>
        <p class="location-name">${restrDto.restr_name}</p>
      </div>
      <div class="info">
        <h4 class="location">음식종류</h4>
        <p class="location-name">${restrDto.restr_foodType}</p>
      </div>
      <div class="info">
        <h4 class="location">매장소개</h4>
        <p class="location-name">${restrDto.restr_desc}</p>
      </div>
      <div class="info">

        <h4 class="menu">${restrDto.restr_menu}</h4>    <!--헷갈림 // 나중에 restr_menu의 data 넘겨줌-->
        <ul class="menuList">
          <li class="menu">
            <span class="menuName">${restrMenuDto.menu}</span>
            <span class="price">${restrMenuDto.price} </span>
          </li>


        </ul>
      </div>
    </section>
    <section class="section-right">
      <ul class="my-list">
        <li class="myList restr-eval-like">
          <i class="fa-regular fa-heart"></i>
          <p>좋아요</p>
        </li>
      </ul>
      <button class="favRestr">리뷰쓰기</button>
      <div class="tag__wrap">
        <h4>이 매장 연관 태그</h4>
        <ul class="tagList">
          <li class="tag">
            <a href="">${restrDto.restr_tag}</a>
          </li>
        </ul>
      </div>
    </section>
  </div>

  <!-- Review Write Page -->


  <div class="review-box">
    <form action="<c:url value="/review/write"/>" method="post">
      <div class="review__header">${restrDto.restr_name}</div>
      <span class="text">에 대한 솔직한 리뷰를 써주세요.</span>

      <div class="review__wrap">
        <ul class="restrRcmdPicker__list">
          <li class="restrRcmdPicker_item">
            <button class="restrRcmdPickerBtn">
              <i class="fa-regular fa-face-laugh-squint"></i>
              <span>맛있어요</span>
            </button>
          </li>
          <li class="restrRcmdPicker_item">
            <button class="restrRcmdPickerBtn">
              <i class="fa-regular fa-face-smile-wink"></i>
              <span>괜찮았어요</span>
            </button>
          </li>
          <li class="restrRcmdPicker_item">
            <button class="restrRcmdPickerBtn">
              <i class="fa-regular fa-face-grin-beam-sweat"></i>
              <span>별로에요</span>
            </button>
          </li>
        </ul>
        <textarea
                name="review-editor"
                id="review-editor"
                cols="30"
                rows="10"
                placeholder="홍혜빈님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
        ></textarea>
      </div>

      <div class="review__pictureUpload">
        <label className="reviewPicUploadBtn" for="reviewPicUpload">
          <i class="fa-solid fa-upload"></i>
        </label>
        <input
                type="file"
                id="reviewPicUpload"
                multiple
                name="reviewPic"
                accept="image/jpeg"
                required
        />
      </div>

      <div class="buttons">
        <button class="uploadBtn">리뷰작성</button>
        <button class="delBtn">취소</button>
      </div>
    </form>
  </div>

  <!-- Review Read Page -->

  <ul class="review-list">
    <li class="review">
      <div class="review__user">
        <div class="review__user__wrap">
          <div class="review__picWrap">
            <img src="/img/hani.jpg" alt="" />
          </div>
          <span class="reivew__userName">
<%--            ${reviewDto.user_email}--%>
<%--            ${reviewDto.user_name}--%>
            홍혜빈
          </span>
        </div>
      </div>
      <div class="review__content">
        <div class="review__content__wrap">
          <span class="review__regdate">
<%--            ${reviewDto.review_update}--%>
            2023. 03. 06
          </span>
          <div class="review__text">
<%--            ${reviewDto.review_comment}--%>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit.
            Inventore repudiandae nulla qui hic quod aperiam odio animi
            aliquid exercitationem, at accusantium voluptatum saepe nobis
            soluta illo facere possimus dignissimos officiis! Lorem ipsum,
            dolor sit amet consectetur adipisicing elit. Iure obcaecati
            voluptate doloribus nemo vero? Repudiandae quisquam fuga
            perspiciatis at cupiditate est repellendus, expedita voluptas
            amet beatae velit animi rem sapiente.
          </div>
        </div>
        <ul class="review__picture__list">
          <li class="review__picture">
            <div class="review__picture__wrap">
              <img src="<c:url value='/images/pizza.png'/>" alt="" class="reviewPicture" />
<%--              <img src=${reviewDto.review_picture} alt="" class="reviewPicture" />--%>
            </div>
          </li>
        </ul>
      </div>
      <div class="review__rating">
        <button class="review__ratingBtn">
          <i class="fa-regular fa-face-laugh-squint"></i>
          <span>맛있어요</span>
        </button>
      </div>
    </li>
  </ul>
</section>


</body>
</html>


<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


<!-- JavaScript -->
<script src="<c:url value='/js/script.js'/>"></script>



























<%--////////////////////////////////////////////////////////////////////////////////////////////////////////////--%>


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




<%--</body>--%>
<%--</html>--%>



