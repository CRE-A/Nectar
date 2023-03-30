<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/hotdeal.css'/>"/>
    <%--  script --%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script
            src="https://kit.fontawesome.com/43ede2213f.js"
            crossorigin="anonymous"
    ></script>
    <!-- 제이쿼리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
    <!-- 아임포트 -->
    <script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

</head>

<body>
<%--NAVBAR--%>

<section id="navbar">
    <div class="logo">
        <a href="<c:url value='/'/>">  <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img" /></a>
    </div>
    <div class="searchBar">
        <form action="<c:url value="/restr/search?"/>"  class="search-form" method="get">
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
            <security:authorize access="isAnonymous()">
                <a href="<c:url value='/login/login'/>">LOGIN</a>
            </security:authorize>
            <security:authorize access="hasRole('USER')">
                <a href="<c:url value='/mypage/user/main'/>"><i class="fa-solid fa-user"></i></a>
            </security:authorize>
            <security:authorize access="hasRole('BIZ')">
                <a href="<c:url value='/mypage/biz/main'/>"><i class="fa-solid fa-user-tie"></i></a>
            </security:authorize>
            <security:authorize access="hasRole('ADMIN')">
                <a href="<c:url value='/mypage/admin/main'/>"><i class="fa-solid fa-user-secret"></i></a>
            </security:authorize>
        </li>
    </ul>
</section>


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
                        사용기간 : ${hotdealDto.hotdeal_eventDuration}
                        <span>  ${hotdealDto.hotdeal_useDate}  </span>
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
        <button type="button" id="buy" class="buyBtn">
            <span>구입하기</span>
        </button>
    </div>


</section>
<script>
    $(document).ready(function(){
        <%--var pay = <%=bvo.getPay_coupon() %>;--%>
        // console.log(pay);

        $("#buy").click(function(e){

            <security:authorize access="isAnonymous()">     // 로그인 안했니?
                if (!confirm("결재를 진행하기 위해서 로그인이 필요합니다. 로그인 하시겠습니까?")) return;
                location.href = "<c:url value='/login/login'/> ";
                return;
            </security:authorize>



            var IMP = window.IMP;
            var code = "imp12875231"; //가맹점 식별코드
            IMP.init(code);

            //결제요청
            IMP.request_pay({
                pg : 'kakaopay',
                pay_method: 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                name : '결제테스트', // 상품명
                amount : 100,       // 가격
                buyer_email : '${UserDto.user_email}',
                buyer_name : '${UserDto.user_name}',
                buyer_tel : '${UserDto.user_phone}',  //필수항목
                //결제완료후 이동할 페이지 kko나 kkopay는 생략 가능
                // m_redirect_url : 'https://localhost:8080/nectar/pay/success'
            }, function(rsp){
                if(rsp.success){//결제 성공시
                    var msg = '결제가 완료되었습니다';
                    var result = {
                        "imp_uid" : rsp.imp_uid,
                        "merchant_uid" : rsp.merchant_uid,
                        "biz_email" : '${hotdealDto.bizAccount_email}',
                        "pay_date" : new Date().getTime(),
                        "amount" : rsp.paid_amount,
                        "card_no" : rsp.apply_num,
                        "refund" : 'payed'
                    }
                    console.log("결제성공 " + msg);
                    console.log("result " + result);

                    $.ajax({
                        url : '/pay/proceed',
                        type :'POST',
                        data : JSON.stringify(result,
                            ['imp_uid', 'merchant_uid', 'biz_email',
                                'pay_date', 'amount', 'card_no', 'refund']),
                        contentType:'application/json;charset=utf-8',
                        dataType: 'json', //서버에서 보내줄 데이터 타입
                        success: function(res){

                            // if(res == 1){
                            //     console.log("추가성공");
                            //     pay += 5;
                            //     $('#pay_coupon').html(pay);
                            // }else{
                            //     console.log("Insert Fail!!!");
                            // }
                        },
                        error:function(){
                            console.log("Insert ajax 통신 실패!!!");
                        }
                    }) //ajax

                }
                else{//결제 실패시
                    var msg = '결제에 실패했습니다';
                    msg += '에러 : ' + rsp.error_msg
                }
                console.log(msg);
            });//pay
        }); //check1 클릭 이벤트
    }); //doc.ready
</script>

</body>
</html>



























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>


<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Nectar</title>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>--%>
<%--    <!-- CSS -->--%>
<%--    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>--%>
<%--    <link rel="stylesheet" href="<c:url value='/css/hotdeal.css'/>"/>--%>
<%--    &lt;%&ndash;  script &ndash;%&gt;--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>--%>
<%--    <script--%>
<%--            src="https://kit.fontawesome.com/43ede2213f.js"--%>
<%--            crossorigin="anonymous"--%>
<%--    ></script>--%>

<%--</head>--%>

<%--<body>--%>
<%--&lt;%&ndash;NAVBAR&ndash;%&gt;--%>

<%--<section id="navbar">--%>
<%--    <div class="logo">--%>
<%--        <a href="<c:url value='/'/>">  <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img" /></a>--%>
<%--    </div>--%>
<%--    <div class="searchBar">--%>
<%--        <form action="" class="search-form" method="get">--%>
<%--            <button type="button" class="searchBtn" value="검색">--%>
<%--                <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--            </button>--%>
<%--            <input type="hidden" name="option" value="searchEngine" />--%>
<%--            <input--%>
<%--                    type="text"--%>
<%--                    name="keyword"--%>
<%--                    class="search-input"--%>
<%--                    value="${ph.sc.keyword}"--%>
<%--                    placeholder="지역, 식당 또는 음식"--%>
<%--            />--%>
<%--            <button type="submit" class="search-button" value="검색">--%>
<%--                <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--            </button>--%>
<%--        </form>--%>
<%--    </div>--%>
<%--    <ul class="menu">--%>
<%--        <li class="menu item">--%>
<%--            <a href="<c:url value='/hotdeal/list'/>">HOTDEAL</a>--%>
<%--        </li>--%>
<%--        <li class="menu item">--%>
<%--            <a href="<c:url value='/restr/list'/>">맛집리스트</a>--%>
<%--        </li>--%>
<%--        <li class="menu item">--%>
<%--            <a href="<c:url value='/mypage/main'/>">--%>
<%--                <c:choose>--%>
<%--                <c:when test="${not empty sessionScope.Admin_email}"><i class="fa-solid fa-user-secret"></i></a></c:when>--%>
<%--            <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>--%>
<%--            <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>--%>
<%--            <c:otherwise>LOGIN</i></a></c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</section>--%>


<%--<!-- Main -->--%>
<%--<section id="hotdeal">--%>


<%--    <div class="hotdeal__container">--%>
<%--        <div class="hotdeal__imgContainer">--%>
<%--            <img--%>
<%--                    src="https://img.hellofresh.com/f_auto,fl_lossy,q_auto,w_1200/hellofresh_s3/image/6243263a18a51738954a3a82-044a399e.jpg"--%>
<%--                    alt=""--%>
<%--                    class="hotdeal__img"--%>
<%--            />--%>
<%--        </div>--%>
<%--        <div class="hotdeal__content">--%>
<%--            <div class="hotdeal__head">--%>
<%--                <div class="head__restrName">--%>
<%--                    <a href="<c:url value='/restr/read?restr_NUM=${hotdealDto.restr_NUM}'/>"><h1>🔥[${hotdealDto.restr_category_loc}] ${hotdealDto.restr_name} 🔥</h1></a>--%>
<%--                    <a href=""><h4>식당정보보기</h4></a>--%>
<%--                </div>--%>
<%--                <div class="head__event">--%>
<%--                    <div class="head__event menu">${hotdealDto.restr_menu_food}--%>
<%--                    </div>--%>
<%--                    <div class="head__event useDate">--%>
<%--                        사용기간 : ${hotdealDto.hotdeal_useDate}--%>
<%--                        <span> 2023.03.15 - 2023.08.15 </span>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--                <div class="head__priceInfo">--%>
<%--                    <div class="head__priceInfo menuPrice">&#8361 ${hotdealDto.restr_menu_price}</div>--%>
<%--                    <div class="head__priceInfo-wrap">--%>
<%--                        <div class="head__priceInfo discountRate">${hotdealDto.hotdeal_discountRate}%</div>--%>
<%--                        <div class="head__priceInfo eventPrice">&#8361 ${hotdealDto.hotdeal_price}</div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <!-- <div class="hotdeal__desc">--%>
<%--              <i>🍟</i>--%>
<%--              <h4>--%>
<%--                서귀포 멋진 항구가 보이는 동남아 휴양지 느낌 가득한 카페 레스토랑--%>
<%--              </h4>--%>
<%--            </div> -->--%>
<%--            <div class="hotdeal__Info">--%>
<%--                <div class="info">--%>
<%--                    <h4 class="location">매장소개</h4>--%>
<%--                    <p class="location-nmae">--%>
<%--                        ${hotdealDto.hotdeal_desc}--%>
<%--                    </p>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <h4 class="location">지역</h4>--%>
<%--                    <p class="location-name">${hotdealDto.restr_category_loc}</p>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <h4 class="foodtype">음식종류</h4>--%>
<%--                    <p class="food-name">이탈리안</p>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <h4 class="notice">유의사항 (꼭! 확인해주세요)</h4>--%>
<%--                    <ul class="noticeList">--%>
<%--                        <li class="notice__item">--%>
<%--                            사용 기간: 구매 시점으로부터 93일--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            양도 및 재판매 불가합니다.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            구매 전 전용 지점을 꼭 확인해주세요.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            방문 전 영업시간 및 휴무일 확인을 부탁드립니다.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            테이블 당 1매만 사용 가능합니다.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            HOTDEAL 외에 다른 쿠폰 및 딜과 중복 사용 불가합니다.--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <h4 class="notice">사용 방법</h4>--%>
<%--                    <ul class="noticeList">--%>
<%--                        <li class="notice__item">--%>
<%--                            구매하신 HOTDEAL은 최신 버전 앱에서만 사용 가능합니다.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            결제 시 넥타르 앱 > 내정보 > 구매한 EAT딜을 선택하여 매장에 비치된 QR코드를 스캔합니다.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            QR코드 스캔이 불가능할 시 매장 직원에게 화면 하단 12자리 숫자 코드를 보여주세요.--%>
<%--                        </li>--%>
<%--                        <li class="notice__item">--%>
<%--                            사용 처리가 완료된 HOTDEAL은 재사용 및 환불 불가합니다.--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="info">--%>
<%--                    <h4 class="foodtype">문의</h4>--%>
<%--                    <p class="food-name">넥타르 앱 > 내정보 > 설정 > 고객센터 로 문의주세요.</p>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <button class="buyBtn">--%>
<%--            <span>구입하기</span>--%>
<%--        </button>--%>
<%--    </div>--%>


<%--</section>--%>

<%--</body>--%>
<%--</html>--%>
