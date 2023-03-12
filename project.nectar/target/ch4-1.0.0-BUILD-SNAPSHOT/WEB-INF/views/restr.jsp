<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="loginBizEmail" value="${sessionScope.Biz_email}"/>
<c:set var="loginUserEmail" value="${sessionScope.User_email}"/>
<c:set var="loginOut" value="${not empty loginUserEmail ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginUserEmail ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CREA_WORLD</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    <!-- Swiper Css -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
    <!-- CSS -->
    <%--  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />--%>
    <link rel="stylesheet" href="<c:url value='/css/restr.css'/>"/>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>

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

                    <!--로그인이 된 상태에서만-->
                    <form id="likeForm" action="" method="">
                        <button type="button" id="likeBtn">
                            <input name="restr_NUM" type="hidden" value="${restrDto.restr_NUM}">
                            <input name="user_email" type="hidden" value="${loginID}">
                            <i class="fa-${not empty likelistDto.user_email ? 'solid' : 'regular'} fa-heart"></i>
                        </button>
                        <p>좋아요</p>
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
            <input type="text" name="restr_NUM" value="${restrDto.restr_NUM}">
            <input type="text" name="user_email" value="${UserDto.user_email}">
            <input type="hidden" name="user_name" value="${UserDto.user_name}">
            <input type="hidden" name="user_picture" value="${UserDto.user_picture}">
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
                            placeholder="${UserDto.user_name}님, 주문하신 메뉴는 어떠셨나요? 식당의 분위기와 서비스도 궁금해요!"
                    >${param.review_comment}</textarea>
                </div>

                ${param.review_picture}
                ${param.review_star}

                <div class="review__pictureUpload">
                    <label className="reviewPicUploadBtn" for="reviewPicUpload">
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

                <c:if test="${mode eq 'User'}">
                <div class="buttons">
                    <button type="submit" class="uploadBtn">리뷰작성</button>
                    <button type="button" class="delBtn">취소</button>
                </div>
                </c:if>


        </form>
    </div>

    <!-- Review Read Page -->

    <ul class="review-list">
        <c:forEach var="reviewDto" items="${reviewDto}">
            <li class="review">
                <div class="review__user">
                    <div class="review__user__wrap">
                        <div class="review__picWrap">
                            <img src="/img/hani.jpg" alt=""/>
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

                <!--🍎로그인 되어있을 때만 리뷰 수정 삭제 loginID 로 체크했는데..확인바라요🍎-->
                <c:if test="${reviewDto.user_email == loginID}">
                    <button id="reviewModifyBtn">수정</button>
                    <button id="reviewDelBtn">삭제</button>
                </c:if>

            </li>
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

        $("#likeBtn").on("click", function () {

            let form = $("#likeForm");

            console.log(form)

            if (${empty loginID}) {
                if (!confirm("로그인을 해야 좋아요를 남길 수 있습니다.. 로그인 하시겠습니까?")) return;
                location.href = "<c:url value='/login/beforeReview?restr_NUM=${restrDto.restr_NUM}'/> ";
                return;
            }

            // 클릭하면 /likeList/add 에 요청하기
            form.attr("action", "<c:url value="/likelist/add"/>");
            form.attr("method", "post")


        })

    });
</script>

