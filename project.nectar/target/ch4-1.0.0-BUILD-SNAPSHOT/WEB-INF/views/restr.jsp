<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="loginUserEmail" value="${sessionScope.User_email}"/>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- Swiper Css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/restr.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

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
                <img src="<c:url value='/images/pizza.png'/>"/>
                <%--        <img src="${restrPic.restr_pic_path}" />--%>
                <%--        restr_pic 테이블에 사진이 여러장(4~5장)이라, foreach를 쓰면서 restr_pic의 list를 나열 --%>
            </div>
            <div class="swiper-slide">
                <img src="<c:url value='/images/pizza.png'/>"/>
            </div>
            <div class="swiper-slide">
                <img src="<c:url value='/images/pizza.png'/>"/>
            </div>
            <div class="swiper-slide">
                <img src="<c:url value='/images/pizza.png'/>"/>
            </div>
            <div class="swiper-slide">
                <img src="<c:url value='/images/pizza.png'/>"/>
            </div>
            <div class="swiper-slide">
                <img src="<c:url value='/images/pizza.png'/>"/>
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
                <h4 >지역</h4>
                <p class="location-name">${restrDto.restr_name}</p>
            </div>
            <div class="info">
                <h4 >음식종류</h4>
                <p class="location-name">${restrDto.restr_foodType}</p>
            </div>
            <div class="info">
                <h4 >매장소개</h4>
                <p class="location-name">${restrDto.restr_desc}</p>
            </div>
            <div class="info">
                <h4 >메뉴</h4>
                <c:forEach var="restrMenuDto" items="${restrMenuDto}">
                    <ul class="menuList">
                        <li class="menu">
                            <span class="food">${restrMenuDto.restr_menu_food}</span>
                            <span class="price">${restrMenuDto.restr_menu_price}원 </span>
                                <%--핫딜 이벤트 진행 메뉴에는 "핫딜 진행중" 이라는 링크가 나타나고, 링크를 누르면 해당 핫딜 페이지로 넘어갑니다.--%>
                            <c:if test="${restrMenuDto.restr_menu_hotdeal_NUM ne '-1'}">
                            <span class="hotdeal">
                                <a href="<c:url value='/hotdeal/read?hotdeal_NUM=${restrMenuDto.restr_menu_hotdeal_NUM}'/>">
                                    <i class="fa-solid fa-gift">핫딜로 이동하기</i>
                                </a>
                            </span>
                            </c:if>
                        </li>
                    </ul>
                </c:forEach>
            </div>
        </section>
        <section class="section-right">
            <ul class="my-list">
                <li class="myList restr-eval-like">
                    <!--로그인이 된 상태에서만-->
                    <form id="likeForm" action="" method="">
                        <button type="button" id="likeBtn">
                            <input type="hidden" name="restr_NUM"  value="${restrDto.restr_NUM}">
                            <input type="hidden" name="user_email"  value="${loginUserEmail}">

                            <!--로그인 했니? && 로그인한 이메일이랑 likelistDto에 있는 email이랑 같니 ? ❤️ : 빈하트 -->
                            <i class="fa-${not empty loginUserEmail && (likelistDto.user_email eq loginUserEmail) ? "solid" : "regular"} fa-heart"></i>
                            <%--                            likelistDto.restr_NUM : ${likelistDto.restr_NUM}--%>
                            <%--                            likelistDto.user_email : ${likelistDto.user_email}--%>
                            <%--                            loginUserEmail : ${loginUserEmail}--%>
                        </button>
                        <p class="likeText">좋아요</p>
                    </form>

                </li>

            </ul>
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
        <form id="form" action="<c:url value="/review/write"/>" method="post">
            <input type="hidden" name="restr_NUM" value="${restrDto.restr_NUM}">
            <input type="hidden" name="user_email" value="${userDto.user_email}">
            <input type="hidden" name="user_name" value="${userDto.user_name}">
            <input type="hidden" name="user_picture" value="${userDto.user_picture}">
            <div class="review__header">${restrDto.restr_name}</div>
            <span class="text">에 대한 솔직한 리뷰를 써주세요.</span>

            <div class="review__wrap">
                <div class="review__wrap">
                    <fieldset class="rating">
                        <input type="radio" id="star5" name="review_star" value="5"/>
                        <label
                                class="full"
                                for="star5"
                                title="rating5"
                        ></label>
                        <input
                                type="radio"
                                id="star4half"
                                name="review_star"
                                value="4.5"
                        /><label
                            class="half"
                            for="star4half"
                            title="rating4half"
                    ></label>
                        <input type="radio" id="star4" name="review_star" value="4"/><label
                            class="full"
                            for="star4"
                            title="rating4"
                    ></label>
                        <input
                                type="radio"
                                id="star3half"
                                name="review_star"
                                value="3.5"
                        /><label
                            class="half"
                            for="star3half"
                            title="rating3half"
                    ></label>
                        <input type="radio" id="star3" name="review_star" value="3"/><label
                            class="full"
                            for="star3"
                            title="rating3"
                    ></label>
                        <input
                                type="radio"
                                id="star2half"
                                name="review_star"
                                value="2.5"
                        /><label
                            class="half"
                            for="star2half"
                            title="rating2half"
                    ></label>
                        <input type="radio" id="star2" name="review_star" value="2"/><label
                            class="full"
                            for="star2"
                            title="rating2"
                    ></label>
                        <input
                                type="radio"
                                id="star1half"
                                name="review_star"
                                value="1.5"
                        /><label
                            class="half"
                            for="star1half"
                            title="rating1half"
                    ></label>
                        <input type="radio" id="star1" name="review_star" value="1"/><label
                            class="full"
                            for="star1"
                            title="rating1"
                    ></label>
                        <input
                                type="radio"
                                id="starhalf"
                                name="review_star"
                                value="0.5"
                        /><label
                            class="half"
                            for="starhalf"
                            title="rating0half"
                    ></label>
                    </fieldset>
                    <textarea
                            name="review_comment"
                            id="review-editor"
                            cols="30"
                            rows="10"
                    <%--                    ${mode=="User_access" ? "" : 'readonly' = "readonly"}--%>
                            placeholder="${userDto.user_name} 님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
                    >${param.review_comment}</textarea>
                </div>

                ${param.review_picture}
                ${param.review_star}



                <div class="pictureUploadButtons_wrap">
                    <div class="review__pictureUpload">
                        <label class="reviewPicUploadBtn" for="reviewPicUpload">
                            <i class="fa-solid fa-upload"></i>
                        </label>
                        <input
                                type="file"
                                id="reviewPicUpload"
                                name="review_picture"
                                accept="image/jpeg"
                                required
                        />
                    </div>

                    <%--                <c:if test="${mode eq 'User'}">--%>
                    <div class="buttons">
                        <%--                    <button type="submit" class="uploadBtn">리뷰작성</button>--%>
                        <%--type=submit으로 하면 작동을 안해요. 일단 type=button으로 바꾸고 jquery로 작동시킬게요.  --%>

                        <button type="button" id="submitBtn" class="uploadBtn">리뷰작성</button>
                        <button type="button" class="delBtn">취소</button>
                    </div>
                    <%--                </c:if>--%>
                </div>



        </form>
    </div>

    <!-- Review Read Page -->

    <ul class="review-list">
        <c:forEach var="reviewDto" items="${reviewDto}">
            <li class="review">
                <div class="review__user">
                    <div class="review__user__wrap">
                        <div class="review__picWrap">
                            <img src="https://hips.hearstapps.com/sev.h-cdn.co/assets/16/40/980x980/square-1475780811-disney-pixar-dug-up.jpg?resize=1200:*" alt=""/>
                                <%--  나중에 review_picture 이미지 잘 넣어 주세요  --%>
                                <%--  ${reviewDto.review_picture}}  --%>
                        </div>
                        <span class="reivew__userName">
                                ${reviewDto.user_name}
                        </span>
                    </div>
                </div>

                    <%-- user_picture 이미지도 잘 넣어 주세요  --%>
                    <%-- ${reviewDto.user_picture}--%>

                <div class="review__content">
                    <div class="review__content__wrap">
          <span class="review__regdate">
            ${reviewDto.review_update}
<%--            2023. 03. 06--%>
          </span>

                        <!--🍎리뷰 수정🍎-->
                        <div class="review__text">
                            <form id="reviewModifyForm" action="" method="post">
                                <input name="review_NUM" type="hidden" value="${reviewDto.review_NUM}"/>
                                <input name="review_star" type="hidden" value="${reviewDto.review_star}"/>
                                <input name="restr_NUM" type="hidden" value="${restrDto.restr_NUM}"/>
                                <input name="user_email" type="hidden" value="${reviewDto.user_email}"/>
                                <textarea name="review_comment" readonly>${reviewDto.review_comment}</textarea>
                            </form>
                        </div>
                        <!--🍎리뷰 수정 끝🍎-->
                    </div>
                    <ul class="review__picture__list">
                        <li class="review__picture">
                            <div class="review__picture__wrap">
                                <img src="<c:url value='/images/pizza.png'/>" alt="" class="reviewPicture"/>
                                    <%--              <img src=${reviewDto.review_picture} alt="" class="reviewPicture" />--%>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="review__rating">
                        ${reviewDto.review_star}
                </div>

                <!--🍎로그인 되어있을 때만 리뷰 수정 삭제 loginUserEmail 로 체크했는데..확인바라요🍎-->
                <c:if test="${reviewDto.user_email == loginUserEmail}">
                    <button id="reviewModifyBtn">수정</button>
                    <button id="reviewDelBtn">삭제</button>
                </c:if>

            </li>
            <div class="underline"></div>
        </c:forEach>

    </ul>
</section>

</body>
</html>


<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>


<!-- JavaScript -->
<script src="<c:url value='/js/script.js'/>"></script>


<%--JQuery--%>
<script>
    $(document).ready(() => {
        $("#review-editor").on("click", () => {
            if (${not empty sessionScope.User_email}) {      // 사용자(User) 계정으로 로그인 했니?
                return;
            }else if (${not empty sessionScope.Biz_email}) { // 사업자(Biz) 계정으로 로그인 했니?
                if (!confirm("사용자 계정으로 로그인을 해야 리뷰를 남길 수 있습니다. 사용자 계정으로 로그인 하시겠습니까?")) return;
                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";
            }else{
                if (!confirm("로그인을 해야 리뷰를 남길 수 있습니다. 로그인 하시겠습니까?")) return;
                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";
            }
        });


        $("#submitBtn").on("click", () => {

            let form = $("#form");
            form.attr("action", "<c:url value='/review/write'/>")
            form.attr("method", "post")
            form.submit();


        });


        $(".review").on("click", "#reviewModifyBtn", (e) => {
            let li = e.target.parentNode;
            let form = $("#reviewModifyForm", li);
            console.log(form)
            let isReadOnly = $("textarea[name=review_comment]", li).attr("readonly");


            // 읽기상태 -> 수정상태
            if (isReadOnly == "readonly") {
                $("textarea[name=review_comment]", li).attr('readonly', false);
                e.target.innerHTML = "리뷰등록";
                return;
            }

            // 리뷰등록

            form.attr("action", "<c:url value="/review/modify"/>");
            form.attr("method", "post");
            form.submit();


        });


        $(".review").on("click", "#reviewDelBtn", (e) => {

            let li = e.target.parentNode;
            let form = $("#reviewModifyForm", li);
            form.attr("action", "<c:url value="/review/delete"/>");
            form.attr("method", "post");
            form.submit();

        })


        // 20230312 여기 하는 중 !

        // 혜빈 좋아요 버튼 이거 로직 틀렸어요. 사업자로 로그인해서 좋아요 누르면 로그인 하라는 알림 계속 떠요.
        // 오빠가 만든 리뷰작성 버튼의 로직 보고 비슷하게 만들어 보세요.
        //  아래를 참고해요.

        <%--$(document).ready(() => {--%>
        <%--    $("#review-editor").on("click", () => {--%>
        <%--        if (${not empty sessionScope.User_email}) {      // 사용자(User) 계정으로 로그인 했니?--%>
        <%--            return;--%>
        <%--        }else if (${not empty sessionScope.Biz_email}) { // 사업자(Biz) 계정으로 로그인 했니?--%>
        <%--            if (!confirm("사용자 계정으로 로그인을 해야 리뷰를 남길 수 있습니다. 사용자 계정으로 로그인 하시겠습니까?")) return;--%>
        <%--            location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";--%>
        <%--        }else{--%>
        <%--            if (!confirm("로그인을 해야 리뷰를 남길 수 있습니다. 로그인 하시겠습니까?")) return;--%>
        <%--            location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";--%>
        <%--        }--%>
        <%--    });--%>

        $("#likeBtn").on("click", function (e) {

            let form = $("#likeForm");
            let heartState = $("i", $(this)).attr("class");  // "fa-regular fa-heart"

            if (${empty loginUserEmail}) {
                if (!confirm("로그인을 해야 좋아요를 남길 수 있습니다.. 로그인 하시겠습니까?")) return;
                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";
                return;
            }

            //  하트가 비워져 있는 상태 (fa-regular fa-heart) 면 ❤️ 상태로 바꾸기

            if (heartState == "fa-regular fa-heart") {
                $("i", $(this)).attr("class", "fa-solid fa-heart");
                form.attr("action", "<c:url value="/likelist/add"/>");
                form.attr("method", "post")
                form.submit();
                return;
            }

            // 좋아요를 해지하면 삭제 요청하기
            $("i", $(this)).attr("class", "fa-regular fa-heart");
            form.attr("action", "<c:url value="/likelist/cancel?restr_num=${restr_NUM}"/>");
            form.attr("method", "post")
            form.submit();

        })

    });
</script>












<%--<%@ page language="java" contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<c:set var="loginUserEmail" value="${sessionScope.User_email}"/>--%>



<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Nectar</title>--%>
<%--    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>--%>
<%--    <!-- Swiper Css -->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>--%>
<%--    <!-- CSS -->--%>
<%--    <link rel="stylesheet" href="<c:url value='/css/restr.css'/>"/>--%>
<%--    &lt;%&ndash;    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />&ndash;%&gt;--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>--%>
<%--    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>--%>

<%--</head>--%>
<%--<body>--%>

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


<%--<!-- Restaurant Detail Page -->--%>

<%--<!-- Title -->--%>

<%--<section id="restr-detail">--%>
<%--    <div class="title-box">--%>
<%--        <h3 class="title">--%>
<%--            ${restrDto.restr_name}--%>
<%--            <strong class="star">${restrDto.restr_star}</strong>--%>
<%--        </h3>--%>
<%--        <ul class="reaction">--%>
<%--            <li class="reaction likeCnt">--%>
<%--                <i class="fa-regular fa-heart"></i>--%>
<%--                <span class="reaction restr__likeCnt">--%>
<%--                    ${restrDto.restr_likeCnt}</span--%>
<%--                >--%>
<%--            </li>--%>
<%--            <li class="reaction reviewCnt">--%>
<%--                <i class="fa-solid fa-pencil"></i>--%>
<%--                <span class="reaction restr_reviewCnt">--%>
<%--                    ${restrDto.restr_reviewCnt}</span--%>
<%--                >--%>
<%--            </li>--%>
<%--            <li class="reaction viewCnt">--%>
<%--                <i class="fa-regular fa-eye"></i>--%>
<%--                <span class="reaction restr__viewCnt">--%>
<%--                    ${restrDto.restr_viewCnt}</span--%>
<%--                >--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </div>--%>

<%--    <!-- Review IMG Slider -->--%>


<%--    <!-- Review IMG Slider -->--%>
<%--    <!-- Swiper -->--%>
<%--    <div class="swiper mySwiper">--%>
<%--        <div class="swiper-wrapper">--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--                &lt;%&ndash;        <img src="${restrPic.restr_pic_path}" />&ndash;%&gt;--%>
<%--                &lt;%&ndash;        restr_pic 테이블에 사진이 여러장(4~5장)이라, foreach를 쓰면서 restr_pic의 list를 나열 &ndash;%&gt;--%>
<%--            </div>--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--            </div>--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--            </div>--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--            </div>--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--            </div>--%>
<%--            <div class="swiper-slide">--%>
<%--                <img src="<c:url value='/images/pizza.png'/>"/>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="swiper-button-next"></div>--%>
<%--        <div class="swiper-button-prev"></div>--%>
<%--        <div class="swiper-scrollbar"></div>--%>
<%--        <div class="swiper-pagination"></div>--%>
<%--    </div>--%>

<%--    <!-- Restaurant Information -->--%>

<%--    <div class="content">--%>
<%--        <section class="section-left">--%>
<%--            <div class="info">--%>
<%--                <h4 class="location">지역</h4>--%>
<%--                <p class="location-name">${restrDto.restr_name}</p>--%>
<%--            </div>--%>
<%--            <div class="info">--%>
<%--                <h4 class="location">음식종류</h4>--%>
<%--                <p class="location-name">${restrDto.restr_foodType}</p>--%>
<%--            </div>--%>
<%--            <div class="info">--%>
<%--                <h4 class="location">매장소개</h4>--%>
<%--                <p class="location-name">${restrDto.restr_desc}</p>--%>
<%--            </div>--%>
<%--            <div class="info">--%>
<%--                <h4 class="menu">메뉴</h4>--%>
<%--                <c:forEach var="restrMenuDto" items="${restrMenuDto}">--%>
<%--                <ul class="menuList">--%>
<%--                    <li class="menu">--%>
<%--                        <span class="food">${restrMenuDto.restr_menu_food}</span>--%>
<%--                        <span class="price">${restrMenuDto.restr_menu_price} </span>--%>
<%--                        <span class="description">${restrMenuDto.restr_menu_desc} </span>--%>
<%--                        &lt;%&ndash;핫딜 이벤트 진행 메뉴에는 "핫딜 진행중" 이라는 링크가 나타나고, 링크를 누르면 해당 핫딜 페이지로 넘어갑니다.&ndash;%&gt;--%>
<%--                        <c:if test="${restrMenuDto.restr_menu_hotdeal_NUM ne '-1'}">--%>
<%--                            <span class="hotdeal">--%>
<%--                                <a href="<c:url value='/hotdeal/read?hotdeal_NUM=${restrMenuDto.restr_menu_hotdeal_NUM}'/>">--%>
<%--                                    <i class="fa-solid fa-gift">핫딜로 이동하기</i>--%>
<%--                                </a>--%>
<%--                            </span>--%>
<%--                        </c:if>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--                </c:forEach>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--        <section class="section-right">--%>
<%--            <ul class="my-list">--%>
<%--                <li class="myList restr-eval-like">--%>

<%--                    <!--로그인이 된 상태에서만-->--%>
<%--                    <form id="likeForm" action="" method="">--%>
<%--                        <button type="button" id="likeBtn">--%>
<%--                            <input name="restr_NUM"  value="${restrDto.restr_NUM}">--%>
<%--                            <input name="user_email"  value="${loginUserEmail}">--%>

<%--                            <!--로그인 했니? && 로그인한 이메일이랑 likelistDto에 있는 email이랑 같니 ? ❤️ : 빈하트 -->--%>
<%--                            <i class="fa-${not empty loginUserEmail && (likelistDto.user_email eq loginUserEmail) ? "solid" : "regular"} fa-heart"></i>--%>
<%--                            likelistDto.restr_NUM : ${likelistDto.restr_NUM}--%>
<%--                            likelistDto.user_email : ${likelistDto.user_email}--%>
<%--                            loginUserEmail : ${loginUserEmail}--%>
<%--                        </button>--%>
<%--                        <p>좋아요</p>--%>
<%--                    </form>--%>

<%--                </li>--%>

<%--            </ul>--%>
<%--            <div class="tag__wrap">--%>
<%--                <h4>이 매장 연관 태그</h4>--%>
<%--                <ul class="tagList">--%>
<%--                    <li class="tag">--%>
<%--                        <a href="">${restrDto.restr_tag}</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
<%--            </div>--%>
<%--        </section>--%>
<%--    </div>--%>

<%--    <!-- Review Write Page -->--%>


<%--    <div class="review-box">--%>
<%--        <form id="form" action="<c:url value="/review/write"/>" method="post">--%>
<%--            <input type="text" name="restr_NUM" value="${restrDto.restr_NUM}">--%>
<%--            <input type="text" name="user_email" value="${userDto.user_email}">--%>
<%--            <input type="hidden" name="user_name" value="${userDto.user_name}">--%>
<%--            <input type="hidden" name="user_picture" value="${userDto.user_picture}">--%>
<%--            <div class="review__header">${restrDto.restr_name}</div>--%>
<%--            <span class="text">에 대한 솔직한 리뷰를 써주세요.</span>--%>

<%--            <div class="review__wrap">--%>
<%--                <div class="review__wrap">--%>
<%--                    <fieldset class="rating">--%>
<%--                        <input type="radio" id="star5" name="review_star" value="5"/>--%>
<%--                        <label--%>
<%--                                class="full"--%>
<%--                                for="star5"--%>
<%--                                title="rating5"--%>
<%--                        ></label>--%>
<%--                        <input--%>
<%--                                type="radio"--%>
<%--                                id="star4half"--%>
<%--                                name="review_star"--%>
<%--                                value="4.5"--%>
<%--                        /><label--%>
<%--                            class="half"--%>
<%--                            for="star4half"--%>
<%--                            title="rating4half"--%>
<%--                    ></label>--%>
<%--                        <input type="radio" id="star4" name="review_star" value="4"/><label--%>
<%--                            class="full"--%>
<%--                            for="star4"--%>
<%--                            title="rating4"--%>
<%--                    ></label>--%>
<%--                        <input--%>
<%--                                type="radio"--%>
<%--                                id="star3half"--%>
<%--                                name="review_star"--%>
<%--                                value="3.5"--%>
<%--                        /><label--%>
<%--                            class="half"--%>
<%--                            for="star3half"--%>
<%--                            title="rating3half"--%>
<%--                    ></label>--%>
<%--                        <input type="radio" id="star3" name="review_star" value="3"/><label--%>
<%--                            class="full"--%>
<%--                            for="star3"--%>
<%--                            title="rating3"--%>
<%--                    ></label>--%>
<%--                        <input--%>
<%--                                type="radio"--%>
<%--                                id="star2half"--%>
<%--                                name="review_star"--%>
<%--                                value="2.5"--%>
<%--                        /><label--%>
<%--                            class="half"--%>
<%--                            for="star2half"--%>
<%--                            title="rating2half"--%>
<%--                    ></label>--%>
<%--                        <input type="radio" id="star2" name="review_star" value="2"/><label--%>
<%--                            class="full"--%>
<%--                            for="star2"--%>
<%--                            title="rating2"--%>
<%--                    ></label>--%>
<%--                        <input--%>
<%--                                type="radio"--%>
<%--                                id="star1half"--%>
<%--                                name="review_star"--%>
<%--                                value="1.5"--%>
<%--                        /><label--%>
<%--                            class="half"--%>
<%--                            for="star1half"--%>
<%--                            title="rating1half"--%>
<%--                    ></label>--%>
<%--                        <input type="radio" id="star1" name="review_star" value="1"/><label--%>
<%--                            class="full"--%>
<%--                            for="star1"--%>
<%--                            title="rating1"--%>
<%--                    ></label>--%>
<%--                        <input--%>
<%--                                type="radio"--%>
<%--                                id="starhalf"--%>
<%--                                name="review_star"--%>
<%--                                value="0.5"--%>
<%--                        /><label--%>
<%--                            class="half"--%>
<%--                            for="starhalf"--%>
<%--                            title="rating0half"--%>
<%--                    ></label>--%>
<%--                    </fieldset>--%>
<%--                    <textarea--%>
<%--                            name="review_comment"--%>
<%--                            id="review-editor"--%>
<%--                            cols="30"--%>
<%--                            rows="10"--%>
<%--                    &lt;%&ndash;                    ${mode=="User_access" ? "" : 'readonly' = "readonly"}&ndash;%&gt;--%>
<%--                            placeholder="${userDto.user_name}님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"--%>
<%--                    >${param.review_comment}</textarea>--%>
<%--                </div>--%>

<%--                ${param.review_picture}--%>
<%--                ${param.review_star}--%>

<%--                <div class="review__pictureUpload">--%>
<%--                    <label className="reviewPicUploadBtn" for="reviewPicUpload">--%>
<%--                        <i class="fa-solid fa-upload"></i>--%>
<%--                    </label>--%>
<%--                    <input--%>
<%--                            type="file"--%>
<%--                            id="reviewPicUpload"--%>
<%--                            name="review_picture"--%>
<%--                            accept="image/jpeg"--%>
<%--                            required--%>
<%--                    />--%>
<%--                </div>--%>

<%--                &lt;%&ndash;                <c:if test="${mode eq 'User'}">&ndash;%&gt;--%>
<%--                <div class="buttons">--%>
<%--                    &lt;%&ndash;                    <button type="submit" class="uploadBtn">리뷰작성</button>&ndash;%&gt;--%>
<%--                    &lt;%&ndash;type=submit으로 하면 작동을 안해요. 일단 type=button으로 바꾸고 jquery로 작동시킬게요.  &ndash;%&gt;--%>

<%--                    <button type="button" id="submitBtn" class="uploadBtn">리뷰작성</button>--%>
<%--                    <button type="button" class="delBtn">취소</button>--%>
<%--                </div>--%>
<%--                &lt;%&ndash;                </c:if>&ndash;%&gt;--%>

<%--        </form>--%>
<%--    </div>--%>

<%--    <!-- Review Read Page -->--%>

<%--    <ul class="review-list">--%>
<%--        <c:forEach var="reviewDto" items="${reviewDto}">--%>
<%--            <li class="review">--%>
<%--                <div class="review__user">--%>
<%--                    <div class="review__user__wrap">--%>
<%--                        <div class="review__picWrap">--%>
<%--                            <img src="/img/hani.jpg" alt=""/>--%>
<%--                                &lt;%&ndash;  나중에 review_picture 이미지 잘 넣어 주세요  &ndash;%&gt;--%>
<%--                                &lt;%&ndash;  ${reviewDto.review_picture}}  &ndash;%&gt;--%>
<%--                        </div>--%>
<%--                        <span class="reivew__userName">--%>
<%--                                ${reviewDto.user_name}--%>
<%--                        </span>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--                    &lt;%&ndash; user_picture 이미지도 잘 넣어 주세요  &ndash;%&gt;--%>
<%--                    &lt;%&ndash; ${reviewDto.user_picture}&ndash;%&gt;--%>

<%--                <div class="review__content">--%>
<%--                    <div class="review__content__wrap">--%>
<%--          <span class="review__regdate">--%>
<%--            ${reviewDto.review_update}--%>
<%--&lt;%&ndash;            2023. 03. 06&ndash;%&gt;--%>
<%--          </span>--%>

<%--                        <!--🍎리뷰 수정🍎-->--%>
<%--                        <div class="review__text">--%>
<%--                            <form id="reviewModifyForm" action="" method="post">--%>
<%--                                <input name="review_NUM" type="hidden" value="${reviewDto.review_NUM}"/>--%>
<%--                                <input name="review_star" type="hidden" value="${reviewDto.review_star}"/>--%>
<%--                                <input name="restr_NUM" type="hidden" value="${restrDto.restr_NUM}"/>--%>
<%--                                <input name="user_email" type="hidden" value="${reviewDto.user_email}"/>--%>
<%--                                <textarea name="review_comment" readonly>${reviewDto.review_comment}</textarea>--%>
<%--                            </form>--%>
<%--                        </div>--%>
<%--                        <!--🍎리뷰 수정 끝🍎-->--%>
<%--                    </div>--%>
<%--                    <ul class="review__picture__list">--%>
<%--                        <li class="review__picture">--%>
<%--                            <div class="review__picture__wrap">--%>
<%--                                <img src="<c:url value='/images/pizza.png'/>" alt="" class="reviewPicture"/>--%>
<%--                                    &lt;%&ndash;              <img src=${reviewDto.review_picture} alt="" class="reviewPicture" />&ndash;%&gt;--%>
<%--                            </div>--%>
<%--                        </li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--                <div class="review__rating">--%>
<%--                        ${reviewDto.review_star}--%>
<%--                </div>--%>

<%--                <!--🍎로그인 되어있을 때만 리뷰 수정 삭제 loginUserEmail 로 체크했는데..확인바라요🍎-->--%>
<%--                <c:if test="${reviewDto.user_email == loginUserEmail}">--%>
<%--                    <button id="reviewModifyBtn">수정</button>--%>
<%--                    <button id="reviewDelBtn">삭제</button>--%>
<%--                </c:if>--%>

<%--            </li>--%>
<%--        </c:forEach>--%>

<%--    </ul>--%>
<%--</section>--%>

<%--</body>--%>
<%--</html>--%>


<%--<!-- Swiper JS -->--%>
<%--<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>--%>


<%--<!-- JavaScript -->--%>
<%--<script src="<c:url value='/js/script.js'/>"></script>--%>


<%--&lt;%&ndash;JQuery&ndash;%&gt;--%>
<%--<script>--%>
<%--    $(document).ready(() => {--%>
<%--        $("#review-editor").on("click", () => {--%>
<%--            if (${not empty sessionScope.User_email}) {      // 사용자(User) 계정으로 로그인 했니?--%>
<%--                return;--%>
<%--            }else if (${not empty sessionScope.Biz_email}) { // 사업자(Biz) 계정으로 로그인 했니?--%>
<%--                if (!confirm("사용자 계정으로 로그인을 해야 리뷰를 남길 수 있습니다. 사용자 계정으로 로그인 하시겠습니까?")) return;--%>
<%--                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";--%>
<%--            }else{--%>
<%--                if (!confirm("로그인을 해야 리뷰를 남길 수 있습니다. 로그인 하시겠습니까?")) return;--%>
<%--                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";--%>
<%--            }--%>
<%--        });--%>


<%--        $("#submitBtn").on("click", () => {--%>

<%--            let form = $("#form");--%>
<%--            form.attr("action", "<c:url value='/review/write'/>")--%>
<%--            form.attr("method", "post")--%>
<%--            form.submit();--%>


<%--        });--%>


<%--        $(".review").on("click", "#reviewModifyBtn", (e) => {--%>
<%--            let li = e.target.parentNode;--%>
<%--            let form = $("#reviewModifyForm", li);--%>
<%--            console.log(form)--%>
<%--            let isReadOnly = $("textarea[name=review_comment]", li).attr("readonly");--%>


<%--            // 읽기상태 -> 수정상태--%>
<%--            if (isReadOnly == "readonly") {--%>
<%--                $("textarea[name=review_comment]", li).attr('readonly', false);--%>
<%--                e.target.innerHTML = "리뷰등록";--%>
<%--                return;--%>
<%--            }--%>

<%--            // 리뷰등록--%>

<%--            form.attr("action", "<c:url value="/review/modify"/>");--%>
<%--            form.attr("method", "post");--%>
<%--            form.submit();--%>


<%--        });--%>


<%--        $(".review").on("click", "#reviewDelBtn", (e) => {--%>

<%--            let li = e.target.parentNode;--%>
<%--            let form = $("#reviewModifyForm", li);--%>
<%--            form.attr("action", "<c:url value="/review/delete"/>");--%>
<%--            form.attr("method", "post");--%>
<%--            form.submit();--%>

<%--        })--%>


<%--        // 20230312 여기 하는 중 !--%>

<%--        // 혜빈 좋아요 버튼 이거 로직 틀렸어요. 사업자로 로그인해서 좋아요 누르면 로그인 하라는 알림 계속 떠요.--%>
<%--        // 오빠가 만든 리뷰작성 버튼의 로직 보고 비슷하게 만들어 보세요.--%>
<%--        //  아래를 참고해요.--%>

<%--        &lt;%&ndash;$(document).ready(() => {&ndash;%&gt;--%>
<%--        &lt;%&ndash;    $("#review-editor").on("click", () => {&ndash;%&gt;--%>
<%--        &lt;%&ndash;        if (${not empty sessionScope.User_email}) {      // 사용자(User) 계정으로 로그인 했니?&ndash;%&gt;--%>
<%--        &lt;%&ndash;            return;&ndash;%&gt;--%>
<%--        &lt;%&ndash;        }else if (${not empty sessionScope.Biz_email}) { // 사업자(Biz) 계정으로 로그인 했니?&ndash;%&gt;--%>
<%--        &lt;%&ndash;            if (!confirm("사용자 계정으로 로그인을 해야 리뷰를 남길 수 있습니다. 사용자 계정으로 로그인 하시겠습니까?")) return;&ndash;%&gt;--%>
<%--        &lt;%&ndash;            location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";&ndash;%&gt;--%>
<%--        &lt;%&ndash;        }else{&ndash;%&gt;--%>
<%--        &lt;%&ndash;            if (!confirm("로그인을 해야 리뷰를 남길 수 있습니다. 로그인 하시겠습니까?")) return;&ndash;%&gt;--%>
<%--        &lt;%&ndash;            location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";&ndash;%&gt;--%>
<%--        &lt;%&ndash;        }&ndash;%&gt;--%>
<%--        &lt;%&ndash;    });&ndash;%&gt;--%>

<%--        $("#likeBtn").on("click", function (e) {--%>

<%--            let form = $("#likeForm");--%>
<%--            let heartState = $("i", $(this)).attr("class");  // "fa-regular fa-heart"--%>

<%--            if (${empty loginUserEmail}) {--%>
<%--                if (!confirm("로그인을 해야 좋아요를 남길 수 있습니다.. 로그인 하시겠습니까?")) return;--%>
<%--                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";--%>
<%--                return;--%>
<%--            }--%>

<%--            //  하트가 비워져 있는 상태 (fa-regular fa-heart) 면 ❤️ 상태로 바꾸기--%>

<%--            if (heartState == "fa-regular fa-heart") {--%>
<%--                $("i", $(this)).attr("class", "fa-solid fa-heart");--%>
<%--                form.attr("action", "<c:url value="/likelist/add"/>");--%>
<%--                form.attr("method", "post")--%>
<%--                form.submit();--%>
<%--                return;--%>
<%--            }--%>

<%--            // 좋아요를 해지하면 삭제 요청하기--%>
<%--            $("i", $(this)).attr("class", "fa-regular fa-heart");--%>
<%--            form.attr("action", "<c:url value="/likelist/cancel?restr_num=${restr_NUM}"/>");--%>
<%--            form.attr("method", "post")--%>
<%--            form.submit();--%>

<%--        })--%>

<%--    });--%>
<%--</script>--%>

