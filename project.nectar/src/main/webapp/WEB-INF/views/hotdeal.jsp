<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- CSS -->
<%--    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>--%>
    <link rel="stylesheet" href="<c:url value='/css/hotdeal.css'/>"/>
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


<!-- Main -->
<section id="hotdeal">


    <div class="hotdeal__container">
        <div class="hotdeal__imgContainer">
            <img
                    src="https://img.hellofresh.com/f_auto,fl_lossy,q_auto,w_1200/hellofresh_s3/image/6243263a18a51738954a3a82-044a399e.jpg"
                    alt=""
                    class="hotdeal__img"
            />
        </div>
        <div class="hotdeal__content">
            <div class="hotdeal__head">
                <div class="head__restrName">
                    <a href="<c:url value='/restr/read?restr_NUM=${hotdealDto.restr_NUM}'/>"><h1>🔥[${hotdealDto.restr_category_loc}] ${hotdealDto.restr_name} 🔥</h1></a>
                    <a href=""><h4>식당정보보기</h4></a>
                </div>
                <div class="head__event">
                    <div class="head__event menu">${hotdealDto.restr_menu_food}
                    </div>
                    <div class="head__event useDate">
                        사용기간 : ${hotdealDto.hotdeal_useDate}
                        <span> 2023.03.15 - 2023.08.15 </span>
                    </div>
                </div>
                <div class="head__priceInfo">
                    <div class="head__priceInfo menuPrice">&#8361 ${hotdealDto.restr_menu_price}</div>
                    <div class="head__priceInfo-wrap">
                        <div class="head__priceInfo discountRate">${hotdealDto.hotdeal_discountRate}%</div>
                        <div class="head__priceInfo eventPrice">&#8361 ${hotdealDto.hotdeal_price}</div>
                    </div>
                </div>
            </div>
            <!-- <div class="hotdeal__desc">
              <i>🍟</i>
              <h4>
                서귀포 멋진 항구가 보이는 동남아 휴양지 느낌 가득한 카페 레스토랑
              </h4>
            </div> -->
            <div class="hotdeal__Info">
                <div class="info">
                    <h4 class="location">매장소개</h4>
                    <p class="location-nmae">
                        ${hotdealDto.hotdeal_desc}
                    </p>
                </div>
                <div class="info">
                    <h4 class="location">지역</h4>
                    <p class="location-name">${hotdealDto.restr_category_loc}</p>
                </div>
                <div class="info">
                    <h4 class="foodtype">음식종류</h4>
                    <p class="food-name">이탈리안</p>
                </div>
                <div class="info">
                    <h4 class="notice">유의사항 (꼭! 확인해주세요)</h4>
                    <ul class="noticeList">
                        <li class="notice__item">
                            사용 기간: 구매 시점으로부터 93일
                        </li>
                        <li class="notice__item">
                            양도 및 재판매 불가합니다.
                        </li>
                        <li class="notice__item">
                            구매 전 전용 지점을 꼭 확인해주세요.
                        </li>
                        <li class="notice__item">
                            방문 전 영업시간 및 휴무일 확인을 부탁드립니다.
                        </li>
                        <li class="notice__item">
                            테이블 당 1매만 사용 가능합니다.
                        </li>
                        <li class="notice__item">
                            HOTDEAL 외에 다른 쿠폰 및 딜과 중복 사용 불가합니다.
                        </li>
                    </ul>
                </div>
                <div class="info">
                    <h4 class="notice">사용 방법</h4>
                    <ul class="noticeList">
                        <li class="notice__item">
                            구매하신 HOTDEAL은 최신 버전 앱에서만 사용 가능합니다.
                        </li>
                        <li class="notice__item">
                            결제 시 넥타르 앱 > 내정보 > 구매한 EAT딜을 선택하여 매장에 비치된 QR코드를 스캔합니다.
                        </li>
                        <li class="notice__item">
                            QR코드 스캔이 불가능할 시 매장 직원에게 화면 하단 12자리 숫자 코드를 보여주세요.
                        </li>
                        <li class="notice__item">
                            사용 처리가 완료된 HOTDEAL은 재사용 및 환불 불가합니다.
                        </li>
                    </ul>
                </div>
                <div class="info">
                    <h4 class="foodtype">문의</h4>
                    <p class="food-name">넥타르 앱 > 내정보 > 설정 > 고객센터 로 문의주세요.</p>
                </div>
            </div>
        </div>
        <button class="buyBtn">
            <span>구입하기</span>
        </button>
    </div>


</section>

</body>
</html>
