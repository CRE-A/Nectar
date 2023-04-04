<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>


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
    <link rel="stylesheet" href="<c:url value='/css/qna.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/userLiking.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/globalPage.css'/>"/>

</head>


<body>
<section id="navbar">
    <div class="logo">
        <a href="<c:url value='/'/>"> <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img"/></a>
    </div>
    <div class="searchBar">
        <form action="<c:url value="/restr/search"/>" class="search-form" method="get">
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

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>


<%-- My Page--%>
<section id="myPage">
    <!-- Left Side -->
    <div class="sideMenu">
        <%--    <button class="sideMenu__mypage">My Page</button>--%>
        <%--    <button class="sideMenu__user">회원정보</button>--%>

        <button class="tab index active">My Page</button>
        <button class="tab index">회원정보</button>
        <button class="tab index">거래내역</button>
        <button class="tab index">FAQ</button>
    </div>

    <!-- Right Side -->
    <div class="userInfo">
        <!--tab user tab log-->
        <div class="content index active">
            <!-- 회원이 누른 좋아요 -->
            <h1 class="h1">${userDto.user_name}님이 좋아요 누른 맛집이에요 ❤️</h1>
            <div class="swiper mySwiper">
                <ul class="swiper-wrapper likeRestrList">
                    <c:forEach var="getMyLikeList" items="${MyLikeList}">
                        <div class="swiper-slide">
                            <li class="likeRestr">
                                <div class="likeRestr__imgWrap">
                                    <img
<%--                                            src="https://images.unsplash.com/photo-1627834377411-8da5f4f09de8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fCVFQyVCQyU4MCVFQyU5RCVCNCVFRCU4MSVBQ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60"--%>
                                            src="<c:url value='/uploadFile/${getMyLikeList.restr_picture}'/>"
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
                        </div>

                    </c:forEach>

                </ul>
            </div>

            <!-- 회원 작성 리뷰 -->
            <h1 class="h1">${userDto.user_name}님이 작성한 모든 리뷰에요 ✏️</h1>
            <ul class="restrList">
                <c:forEach var="reviewDto" items="${reviewDto}">
                    <li class="restr">
                        <a href="">
                            <img src="<c:url value='/uploadFile/${reviewDto.review_picture}'/>" alt="" class="restr__img"/>
<%--                            <img src="https://images.unsplash.com/photo-1622896784083-cc051313dbab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGNha2V8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60" alt="" class="restr__img"/>--%>
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
                            </div>
                            <div class="restr__review">
                                <div class="img__wrap">
                                    <img
<%--                                            src="https://images.unsplash.com/photo-1679164841386-f6897cbe0e02?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw4fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=600&q=60"--%>
                                            src="<c:url value='/uploadFile/${userDto.user_picture}'/>"
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


        </div>        <!--My Page-->
        <div class="content index">
            <!-- 회원정보수정 -->
            <h1>회원정보수정</h1>
            <form action="" id="userInfoForm">
                <%--            --%>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <%--            --%>
                <div class="userInfo__box">
                    <div class="userInfo__profile">
                        <img
                                src="<c:url value='/uploadFile/${userDto.user_picture}'/>"
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
                                <input type="text" name="user_name" readonly value="${userDto.user_name}" required/>
                            </div>
                            <div class="userNameId item">
                                <span class="details">휴대폰</span>
                                <input  type="text" name="user_phone" readonly value="${userDto.user_phone}" required/>
                            </div>
                        </div>
                        <div class="userEmail">
                            <span class="details">이메일</span>
                            <input type="text" name="user_email" readonly value="${userDto.user_email}" required/>
                        </div>
                        <%--            --%>
                        <%--    userPwd로 고쳐야함        --%>
                        <div class="userEmail">
                            <span class="details">비밀번호</span>
                            <input type="password" name="user_pwd" readonly value="" required/>
                        </div>
                        <input type="hidden" name="user_picture"  value="${userDto.user_picture}" required/>
                    </div>
                </div>
                <div class="userInfo__btnWrap">
                    <button  type="button" id="modifyBtn">프로필 수정</button>
                </div>
            </form>

            <h1 style="margin-top: 30px">계정탈퇴</h1>
            <div class="container item">
                <h3>회원 탈퇴 신청 시 아래 사항을 반드시 확인해주세요.</h3>
                <p> 1. 탈퇴 시 탈퇴 대기기간 없이 즉시 탈퇴가 완료되며, 계정 정보 및 개인 정보(이름, 생년월일 등)가 즉시 파기되어 복구할 수 없습니다.  </p>
                <p> 2. 탈퇴 시에는 즉시 계정 정보 및 개인 정보(이름, 생년월일 등)가 파기되기 때문에 탈퇴 취소 신청이 불가능합니다.  </p>

                <form id="userDelForm">
                    <button type="button" id="userDelBtn"> 탈퇴하기 </button>
                </form>

            </div>
        </div>               <!--회원정보-->
        <div class="content index">                  <!--결제내역-->
            <!-- 핫딜 구매 내역-->
            <h1 class="h1">${userDto.user_name}님의 결제 정보에요! 💸️</h1>
            <div class="userList">
                <table>
                    <thead>
                    <tr>
                        <th>주문ID</th>
                        <th>거래일자</th>
                        <th>항목</th>
                        <th>가격</th>
                        <th>사용기간</th>
                        <th>이벤트기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="MyPaymentList" items="${MyPaymentList}">
                        <tr>
                            <td class="no">${MyPaymentList.imp_uid}</td>
                            <td class="qnaTitle">${MyPaymentList.pay_date}</td>
                            <td class="writer">${MyPaymentList.restr_menu_food}</td>
                            <td class="writer">${MyPaymentList.amount} 원</td>
                            <td class="writer">${MyPaymentList.hotdeal_eventDuration}</td>
                            <td class="writer">${MyPaymentList.hotdeal_useDate}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>


            </div>


        </div>
        <div class="content index">
            <h1>문의 남기기 ✏️</h1>
            <div class="userList">
                <table>
                    <thead>
                    <tr>
                        <th>no</th>
                        <th>제목</th>
                        <th>이름</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="QNADto" items="${QNADto}">
                        <tr>
                            <td class="no"> ${QNADto.qna_NUM}</td>
                            <td class="qnaTitle"><a
                                    href="<c:url value="/mypage/user/QNA/read?qna_NUM= ${QNADto.qna_NUM}"/>">  ${QNADto.qna_title}</a>
                            </td>
                            <td class="writer">${QNADto.qna_name}</td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
                <button id="writeBtn"> 문의 남기기 </button>

            </div>
        </div>               <!--FAQ-->



    </div>
</section>










<%--</div>--%>
<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        width : 230,
        slidesPerView: "auto",
        centeredSlides: false,
        spaceBetween: 30,
        grabCursor: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true
        },

    });
</script>
</body>
</html>

<script>


    // TAB 기능 //

    const tabs = document.querySelectorAll("button.tab");
    const contents = document.querySelectorAll(".content");

    tabs.forEach((tab, idx) => {
        tab.addEventListener("click", (e) => {

            contents.forEach((content) => {
                content.classList.remove('active')
            })

            tabs.forEach((tab) => {
                tab.classList.remove('active')
            })

            tabs[idx].classList.add('active')
            contents[idx].classList.add('active')
        });
    });

    // TAB 기능 //

    $(document).ready(function (){

        $("#userDelBtn").on("click", (e) => {

            let form = $("#userDelForm");
            form.attr("action", "<c:url value="/mypage/user/profile/delete?email=${userDto.user_email}"/>");
            form.attr("method", "post");
            form.submit();

        }) // 회원 탈퇴

        $("#modifyBtn").on("click", (e) => {
            let form = $("#userInfoForm");
            let name = $("input[name=user_name]");

            let isReadOnly = name.attr("readonly");

            if (isReadOnly == "readonly") {

                $("input[name=user_name]").attr('readonly', false);
                // $("input[name=user_email]").attr('readonly', false);
                $("input[name=user_phone]").attr('readonly', false);
                // $("input[name=user_pwd]").attr('readonly', false);
                $("#modifyBtn").html("변경사항저장");

                return;
            }  // 읽기상태 -> 수정상태

            form.attr("action", "<c:url value="/mypage/user/profile/modify"/>");
            form.attr("method", "post");
            form.submit();

        });  // 회원 프로필 수정

        $("#writeBtn").on("click", function (){
            location.href = "<c:url value='/mypage/user/QNA/write'/>";
        }) // 문의글 남기기


    })// ready()



</script>



