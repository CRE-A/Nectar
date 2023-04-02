<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarHome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/biz.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/qna.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/globalPage.css'/>"/>


    <style>
        section#navbar.biz {
            z-index: 2;
            width: 100vw;
            background-color: #e9bea2;
            display: flex;
            justify-content: space-between;
            position: relative;
        }

    </style>
</head>


<body>
<section id="navbar" class="biz">
    <div class="logo">
        <a href="<c:url value='/'/>"> <img src="<c:url value='/images/nectarLogo.png'/>" alt="" class="logo__img"/></a>
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

<%--  Global Page --%>

<section id="globalPage">
    <!-- Left Side -->
    <div class="sideMenu">
        <button class="tab index active">사업정보</button>
        <button class="tab index">사업자정보</button>
        <button class="tab index">매장등록</button>
        <button class="tab index">메뉴등록</button>
        <button class="tab index">핫딜등록</button>
        <button class="tab index">문의남기기</button>
    </div>

    <!-- Right Side -->
    <div class="main">
        <div class="content index active">

            <h1>${bizAccountDto.bizAccount_name}님이 운영중인 레스토랑 🧑‍🍳</h1>
            <!--운영 중인 매장이 없는 경우-->
            <c:if test="${empty restrDto}">
                <div class="msg__wrap">
                    <i class="fa-solid fa-circle-info"></i>
                    <h3>현재 운영중인 매장이 없습니다.</h3>
                </div>
            </c:if>

            <div class="container item">
                <ul id="restrList">
                    <form id="restrForm" action="" method="">
                        <%--            --%>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <%--            --%>
                        <!-- 게시글 번호 data-restrNum 에 저장-->
                        <li class="restr" data-restrNum="${restrDto.restr_NUM}">
                            <div class="img_wrap">
                                <img class="img"
                                     src="https://images.unsplash.com/photo-1677523875173-e1f7f5138b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDM2fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60">
                                <!--img class="img" src="$restrDto.restr_picture"-->
                            </div>
                            <div class="content_wrap">
                                <div>
                                    <h1 class="content__title">${restrDto.restr_name}</h1>

                                </div>
                                <p class="content__location">${restrDto.restr_location}</p>
                                <h1 class="content__restrTime">${restrDto.restr_time}</h1>
                            </div>
                        </li>
                    </form>

                </ul>
            </div>

            <h1>${bizAccountDto.bizAccount_name}님이 진행한 핫딜 🔥</h1>

            <!--진행한 핫딜이 없는 경우-->
            <c:if test="${empty hotdealDto}">
                <div class="msg__wrap">
                    <i class="fa-solid fa-circle-info"></i>
                    <h3>현재 진행중인 핫딜이 없습니다.</h3>
                </div>
            </c:if>

            <div class="container item">
                <c:forEach var="hotdealDto" items="${hotdealDto}">
                    <li class="restr" data-restrNum="${restrDto.restr_NUM}">
                        <div class="img_wrap">
                            <img class="img"
                                 src="https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60">
                            <!--img class="img" src="$restrDto.restr_picture"-->
                        </div>
                        <div class="content_wrap">
                            <div>
                                <h1 class="content__title">${hotdealDto.restr_menu_food}</h1>
                            </div>
                            <p class="content__hotdealPrice"> ${hotdealDto.restr_menu_price} &#8361;</p>
                            <h1 class="content__menuPrice">  ${hotdealDto.hotdeal_price} &#8361;</h1>
                        </div>
                    </li>
                </c:forEach>
                <%--                <c:forEach var="hotdealDto" items="${hotdealDto}">--%>
                <%--                    ${hotdealDto.hotdeal_NUM} </br>--%>
                <%--                    ${hotdealDto.restr_NUM} </br>--%>
                <%--                    ${hotdealDto.restr_category_loc} </br>--%>
                <%--                    ${hotdealDto.restr_menu_NUM} </br>--%>
                <%--                    ${hotdealDto.restr_menu_food} </br>--%>
                <%--                    ${hotdealDto.restr_menu_price} </br>--%>
                <%--                    ${hotdealDto.hotdeal_price} </br>--%>
                <%--                    ${hotdealDto.hotdeal_discountRate} </br>--%>
                <%--                    ${hotdealDto.hotdeal_desc} </br>--%>
                <%--                    ${hotdealDto.hotdeal_useDate} </br>--%>
                <%--                    ${hotdealDto.hotdeal_eventDuration} </br>--%>
                <%--                    ${hotdealDto.hotdeal_regdate} </br>--%>
                <%--                    ${hotdealDto.hotdeal_update} </br>--%>
                <%--                    ${hotdealDto.hotdeal_salesVolume} </br>--%>
                <%--                    ${hotdealDto.hotdeal_MaxSalesVolume} </br>--%>
                <%--                    ${hotdealDto.bizAccount_email} </br>--%>
                <%--                    &lt;%&ndash;                      <tr>&ndash;%&gt;--%>
                <%--                    &lt;%&ndash;                        <td class="bno">${hotdealDto.hotdeal_salesVolume}</td>&ndash;%&gt;--%>
                <%--                    &lt;%&ndash;                        <td class="writer">${hotdealDto.hotdeal_MaxSalesVolume}</td>&ndash;%&gt;--%>
                <%--                    &lt;%&ndash;                      </tr>&ndash;%&gt;--%>
                <%--                </c:forEach>--%>
            </div>
            <h1>핫딜 판매 내역 💸️</h1>
            <!--핫딜 판매 내역이 없는 경우-->
            <!--c:if test="$empty hotdealDto}"-->  <!--이거 수정해야함!-->
            <div class="msg__wrap">
                <i class="fa-solid fa-circle-info"></i>
                <h3> 아직 판매된 핫딜 제품이 없습니다. </h3>
            </div>
            <!--/c:if-->
            <div class="container item">
                <div class="recent-order">
                    <table>
                        <tbody>
                        <%--            salesVolume--%>
                        <%--            maxSalesVolume--%>
                        <%--            <c:forEach var="paymentDto" items="${paymentDto}">--%>
                        <%--              <tr>--%>
                        <%--                <td class="bno">${paymentDto.}</td>--%>
                        <%--                <td class="writer">${paymentDto.}</td>--%>
                        <%--              </tr>--%>
                        <%--            </c:forEach>--%>
                        </tbody>
                    </table>
                </div>

            </div>
        </div>     <!-- 사업정보-->
        <div class="content index">
            <h1>사업자 정보 </h1>
            <div class="container item">
                <form id="bizAccountInfoForm" action="<c:url value='/mypage/biz/profile/modify'/>" method="post">
                    <div class="user-details">
                        <div class="input-box">
                            <%--            --%>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <%--            --%>
                            <span class="details">이름</span>
                            <input
                                    type="text"
                                    name="bizAccount_name"
                                    placeholder="이름을 입력하세요"
                                    value="${bizAccountDto.bizAccount_name}"
                                    readonly
                                    required
                            />
                        </div>
                        <div class="input-box">
                            <span class="details">Email</span>
                            <input
                                    type="text"
                                    name="bizAccount_email"
                                    placeholder="이메일을 입력하세요"
                                    value="${bizAccountDto.bizAccount_email}"
                                    readonly
                                    required
                            />
                        </div>
                        <div class="input-box">
                            <span class="details">Phone Number</span>
                            <input
                                    type="text"
                                    name="bizAccount_phone"
                                    placeholder="전화번호를 입력하세요"
                                    readonly
                                    value="${bizAccountDto.bizAccount_phone}"
                                    required
                            />
                        </div>
                        <div class="input-box">
                            <span class="details">비밀번호</span>
                            <input
                                    readonly
                                    type="password"
                                    name="bizAccount_pwd"
                                    placeholder="Enter your password"
                                    value=""
                                    required

                            />
                        </div>

                        <div class="buttons">
                            <button type="button" id="bizUpdateBtn">프로필수정</button>
                            <button type="button" id="bizDelBtn">계정 탈퇴</button>
                        </div>


                    </div>
                </form>
            </div>
        </div>            <!-- 사업자정보-->
        <div class="content index">
            <h1>매장 등록 필수 정보 입력 ✏️</h1>
            <div class="container item">
                <form id="" action="<c:url value='/mypage/biz/restr/write'/>" method="post">
                    <%--            --%>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <%--            --%>
                    <input name="request_bizAccount_email" type="hidden" value="${bizAccountDto.bizAccount_email}">
                    <div class="user-details index">
                        <div class="wrap index">
                            <input name="bizAccount_email" value="${bizAccountDto.bizAccount_email}" type="hidden">
                            <!--input name="biz_reg_num" value="$bizAccountDto.biz_reg_num"-->
                            <div class="input-box">
                                <span class="details">매장 이름</span>
                                <input
                                        type="text"
                                        name="request_restr_name"
                                        placeholder="매장 이름을 입력하세요"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">매장 위치</span>
                                <input
                                        type="text"
                                        name="request_restr_location"
                                        placeholder="매장 위치를 입력하세요"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">매장 전화 번호</span>
                                <input
                                        type="text"
                                        name="request_restr_phone"
                                        placeholder="매장 전화번호를 입력하세요"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">매장 소개 하기</span>
                                <textarea name="request_restr_desc" placeholder="매장 소개를 입력하세요. 입력글자제한 200자">

                            </textarea>
                            </div>
                            <div class="input-box">
                                <span class="details">매장 운영 시간</span>
                                <input
                                        type="text"
                                        name="request_restr_time"
                                        placeholder="OPEN"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">매장 사진 등록</span>
                                <input
                                        type="text"
                                        name="request_restr_picture"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">사업자 등록증 입력</span>
                                <input
                                        type="text"
                                        name="request_biz_reg_num"
                                        required
                                />
                            </div>
                            <div class="input-box">
                                <span class="details">태그 입력</span>
                                <input
                                        type="text"
                                        name="request_restr_tag"
                                        placeholder="노출을 원하는 태그를 입력하세요."
                                        required
                                />
                            </div>
                        </div>

                        <div class="wrap">
                            <div class="column-details">
                                <input type="radio" name="restr_cost" id="cost-1" value="만원미만"/>
                                <input type="radio" name="restr_cost" id="cost-2" value="1만원대"/>
                                <input type="radio" name="restr_cost" id="cost-3" value="2만원대"/>
                                <input type="radio" name="restr_cost" id="cost-4" value="3만원대"/>
                                <span class="menu-title">메뉴 평균 가격대 조사</span>
                                <div class="category">
                                    <label for="cost-1">
                                        <span class="dot one"></span>
                                        <span class="column" class="cost">만원미만</span>
                                    </label>
                                    <label for="cost-2">
                                        <span class="dot two"></span>
                                        <span class="column" class="cost">1만원대</span>
                                    </label>
                                    <label for="cost-3">
                                        <span class="dot three"></span>
                                        <span class="column" class="cost">2만원대</span>
                                    </label>
                                    <label for="cost-4">
                                        <span class="dot four"></span>
                                        <span class="column" class="cost">3만원대</span>
                                    </label>
                                </div>
                            </div>
                            <div class="column-details">
                                <input type="radio" name="restr_parking" id="parking-1" value="주차가능"/>
                                <input type="radio" name="restr_parking" id="parking-2" value="주차불가"/>
                                <span class="menu-title">주차 가능 여부</span>
                                <div class="category">
                                    <label for="parking-1">
                                        <span class="dot one"></span>
                                        <span class="column">주차가능</span>
                                    </label>
                                    <label for="parking-2">
                                        <span class="dot two"></span>
                                        <span class="column">주차불가</span>
                                    </label>
                                </div>
                            </div>
                            <div class="column-details">
                                <input type="radio" name="restr_foodType" id="food-1" value="한식"/>
                                <input type="radio" name="restr_foodType" id="food-2" value="중식"/>
                                <input type="radio" name="restr_foodType" id="food-3" value="일식"/>
                                <input type="radio" name="restr_foodType" id="food-4" value="양식"/>
                                <input type="radio" name="restr_foodType" id="food-5" value="세계음식"/>
                                <input type="radio" name="restr_foodType" id="food-6" value="뷔페"/>
                                <input type="radio" name="restr_foodType" id="food-7" value="카페"/>
                                <input type="radio" name="restr_foodType" id="food-8" value="주점"/>
                                <span class="menu-title">매장 음식 종류 선택</span>
                                <div class="category">
                                    <label for="food-1">
                                        <span class="dot a"></span>
                                        <span class="column">한식</span>
                                    </label>
                                    <label for="food-2">
                                        <span class="dot b"></span>
                                        <span class="column">중식</span>
                                    </label>
                                    <label for="food-3">
                                        <span class="dot c"></span>
                                        <span class="column">일식</span>
                                    </label>
                                    <label for="food-4">
                                        <span class="dot d"></span>
                                        <span class="column">양식</span>
                                    </label>
                                    <label for="food-5">
                                        <span class="dot e"></span>
                                        <span class="column">세계음식</span>
                                    </label>
                                    <label for="food-6">
                                        <span class="dot f"></span>
                                        <span class="column">뷔페</span>
                                    </label>
                                    <label for="food-7">
                                        <span class="dot g"></span>
                                        <span class="column">카페</span>
                                    </label>
                                    <label for="food-8">
                                        <span class="dot h"></span>
                                        <span class="column">주점</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <button type="submit" id="regBtn"> 등록</button>
                    </div>
                </form>
            </div>
        </div>            <!-- 매장등록-->
        <div class="content index">
            <h2 class="h2" style="margin-bottom: 20px">메뉴 등록</h2>
            <div class="container item">
                <div class="menuWrap">
                    <form id="menuForm" action="<c:url value='/mypage/biz/restrMenu/write?tab=regMenu'/>" method="post">
                        <%--            --%>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <%--            --%>
                        <input name="restr_NUM" value="${restrDto.restr_NUM}" type="hidden">
                        <div class="input-box">
                            <label>메뉴이름</label>
                            <input name="restr_menu_food" type="text" placeholder="메뉴이름을 입력하세요.">
                        </div>
                        <div class="input-box">
                            <label>메뉴가격</label>
                            <input name="restr_menu_price" type="text" placeholder="메뉴가격을 입력하세요.">
                        </div>
                        <div class="input-box">
                            <label>메뉴설명</label>
                            <input name="restr_menu_desc" type="text" placeholder="메뉴에 대한 간단한 설명을 입력하세요.">
                        </div>
                        <button type="submit" class="restrMenuRegBtn">메뉴추가</button>
                    </form>
                </div>
            </div>

            <h2 class="h2" style="margin-bottom: 20px">메뉴 리스트</h2>
            <div class="container item">
                <div class="swiper mySwiper">
                    <ul class="swiper-wrapper menuList">
                        <c:forEach var="restrMenuDto" items="${restrMenuDto}">
                            <div class="swiper-slide">
                                <form id="menuListForm"
                                      action="<c:url value='/mypage/biz/restrMenu/write?tab=regMenu'/>" method="post">
                                        <%--            --%>
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                        <%--            --%>
                                    <input name="restr_NUM" value="${restrDto.restr_NUM}" type="hidden">
                                    <input name="restr_menu_NUM" type="hidden" value="${restrMenuDto.restr_menu_NUM}">

                                    <div class="input-box">
                                        <label>메뉴이름</label>
                                        <input name="restr_menu_food" type="text" placeholder="메뉴이름을 입력하세요." readonly
                                               value=" ${restrMenuDto.restr_menu_food}">
                                    </div>
                                    <div class="input-box">
                                        <label>메뉴가격</label>
                                        <input name="restr_menu_price" type="text" placeholder="메뉴가격을 입력하세요." readonly
                                               value="${restrMenuDto.restr_menu_price}">
                                    </div>
                                    <div class="input-box">
                                        <label>메뉴설명</label>
                                        <input name="restr_menu_desc" type="text" placeholder="메뉴에 대한 간단한 설명을 입력하세요."
                                               readonly value=" ${restrMenuDto.restr_menu_desc}">
                                    </div>

                                    <div class="buttons">
                                        <button type="button" id="menuModifyBtn"> 수정</button>
                                        <button type="button" id="menuDeleteBtn"> 삭제</button>
                                    </div>

                                </form>


                            </div>

                        </c:forEach>
                    </ul>
                </div>


            </div>

        </div>            <!-- 메뉴등록 (레스토랑 심사에 통과한 경우에만 나타나게 한다.)-->
        <div class="content index">
            <h1>핫딜 이벤트 메뉴 등록 ✏️</h1>
            <div class="container item">
                <div class="user-details">

                    <div class="column-details">
                        <c:forEach var="restrMenuDto" items="${restrMenuDto}" varStatus="status">
                            <form id="hotdealRegForm" method="post">
                                    <%--            --%>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                    <%--            --%>
                                <input class="restr_menu_food" type="radio" name="request_restr_menu_food"
                                       value="${restrMenuDto.restr_menu_food}"
                                       id="dot-<c:out value='${status.count}'/>"/>
                                <div class="category">
                                    <label for="dot-${status.count}">
                                        <span class="dot data-${status.count}"></span>
                                        <span class="column">${restrMenuDto.restr_menu_food}</span>
                                    </label>
                                </div>
                                <input type="hidden" name="request_restr_NUM" value="${restrDto.restr_NUM}">
                                <input type="hidden" name="request_restr_name" value="${restrDto.restr_name}">
                                <input type="hidden" name="request_restr_menu_NUM"
                                       value="${restrMenuDto.restr_menu_NUM}">
                                <input type="hidden" name="request_restr_category_loc"
                                       value=" ${restrDto.restr_category_loc}">
                                <input type="hidden" name="request_hotdeal_desc"
                                       value="${restrMenuDto.restr_menu_desc}">
                                <input type="hidden" name="request_hotdeal_picture"
                                       value="https://images.unsplash.com/photo-1676912819036-b9024f1e74ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDk0fHhqUFI0aGxrQkdBfHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=600&q=60">
                                <input type="hidden" name="request_bizAccount_email"
                                       value=" ${bizAccountDto.bizAccount_email}">
                                <input type="hidden" name="request_hotdeal_discountRate" value="10">
                                <input type="hidden" name="request_hotdeal_salesVolume" value="0">

                                <div class="wrap hotdeal">
                                    <div class="input-box">
                                        <span class="details">정상가</span>
                                        <input name="request_restr_menu_price" value="${restrMenuDto.restr_menu_price}"
                                               readonly>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">할인가</span>
                                        <input name="request_hotdeal_price" placeholder="핫딜 가격을 입력하세요" required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">핫딜 사용 기간</span>
                                        <input name="request_hotdeal_useDate" type="text"
                                               placeholder="ex. 2023-03-15 ~ 2023-04-01"
                                               required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">핫딜 유지 기간</span>
                                        <input name="request_hotdeal_eventDuration" type="text"
                                               placeholder="ex. 30일"
                                               required>
                                    </div>
                                    <div class="input-box">
                                        <span class="details">한정 판매 개수</span>
                                        <input name="request_hotdeal_MaxSalesVolume"
                                               type="text"
                                               placeholder="ex. 100(개) 단, 숫자만 입력"
                                               required>
                                    </div>
                                </div>
                            </form>
                        </c:forEach>

                        <button type="submit" id="hotdealRegBtn"> 등록</button>

                    </div>

                </div>
            </div>
        </div>            <!-- 핫딜등록-->
        <div class="content index">
            <h1>문의 남기기 ✏️</h1>
            <div class="container item">

                <form id="qnaForm" action="<c:url value='/mypage/biz/QNA/write'/>" method="post">
                    <%--            --%>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <%--            --%>
                    <input type="text" name="qna_title" placeholder="제목 : 인태는 못말려">
                    <textarea name="qna_content" value="" placeholder="내용을 입력하세요 : 제발 누가 좀 말려요"></textarea>
                    <label for="qna_picutre" class="qna_picutre">
                        ➕
                    </label>
                    <input id="qna_picutre" type="hidden" name="qna_picture"
                           value="https://images.unsplash.com/photo-1534211698458-e2be12c1a94c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGZsb3dlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60">
                    <input type="hidden" name="qna_writer" value="${bizAccountDto.bizAccount_email}">
                    <input type="hidden" name="qna_name" value="${bizAccountDto.bizAccount_name}">
                    <button type="submit" class="qnaRegBtn">등록</button>
                </form>

            </div>
        </div>            <!-- 문의남기기-->
    </div>
</section>

<%-- / Global Page--%>





<%----%>
<%--// 사업자가 요청/문의한 QNA 에 대한 DATA--%>
<section>
    <h2>사업자가 요청/문의한 QNA 에 대한 DATA</h2>
    <c:forEach var="QNADto" items="${QNADto}">
        ${QNADto.qna_NUM}
        ${QNADto.qna_title}
        ${QNADto.qna_content}
        ${QNADto.qna_picture}
        ${QNADto.qna_regdate}
        ${QNADto.qna_writer}
        ${QNADto.qna_name}
    </c:forEach>
</section>
<%----%>






<%----%>
<%-- 사업자가 진행한 핫딜의 결제정보(payment)에 대한 data--%>
<section>
    <h2>사업자가 진행한 핫딜의 결제정보(payment)에 대한 data</h2>
    <c:forEach var="PaymentList" items="${PaymentList}">
        ${PaymentList.imp_uid}
        ${PaymentList.merchant_uid}
        ${PaymentList.user_email}
        ${PaymentList.pay_date}
        ${PaymentList.restr_NUM}
        ${PaymentList.restr_name}
        ${PaymentList.restr_category_loc}
        ${PaymentList.restr_menu_food}
        ${PaymentList.hotdeal_picture}
        ${PaymentList.hotdeal_useDate}
        ${PaymentList.hotdeal_eventDuration}
    </c:forEach>
</section>
<%----%>






<script>

    $(document).ready(() => {

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


        $("#bizDelBtn").on("click", $(".buttons"), (e) => {

            let form = $("#bizAccountInfoForm");
            form.attr("action", "<c:url value="/mypage/biz/profile/delete"/>");
            form.attr("method", "post");
            form.submit();

        }); // 사업자 계정 탈퇴

        $("#bizUpdateBtn").on("click", $(".buttons"), (e) => {
            let form = $("#bizAccountInfoForm");
            let isReadOnly = $("input[name=bizAccount_name]").attr("readonly");

            // 읽기상태 -> 수정상태
            if (isReadOnly == "readonly") {
                $("input[name=bizAccount_name]").attr('readonly', false);
                // $("input[name=bizAccount_pwd]").attr('readonly', false);
                $("input[name=bizAccount_phone]").attr('readonly', false);
                e.target.innerHTML = "수정완료";
                return;
            }


            form.attr("action", "<c:url value="/mypage/biz/profile/modify"/>");
            form.attr("method", "post");
            form.submit();


        }); // 사업자 계정 수정

        $("#hotdealRegBtn").on("click", (e) => {

            // 선택된 라디오 태그의 폼 태그를 포스트요청으로 보낸다.
            let radio = $("input[type=radio][name=request_restr_menu_food]:checked");
            let form = radio[0].form;

            form.action = "<c:url value='/mypage/biz/hotdeal/write'/>"
            form.method = "post"
            form.submit();

        }); // 핫딜 등록

        $("#menuModifyBtn", ".swiper-slide").on("click", function (e) {
            let buttons = $(this).parent();
            let form = buttons.parent();

            let isReadOnly = $("input[name=restr_menu_food]", ".swiper-slide").attr("readonly");


            if (isReadOnly == "readonly") {
                $("input[name=restr_menu_food]").attr('readonly', false);
                $("input[name=restr_menu_price]").attr('readonly', false);
                $("input[name=restr_menu_desc]").attr('readonly', false);
                $(this)[0].innerText = "등록";
                return;
            }

            console.log(form)
            form.attr("action", "<c:url value='/mypage/biz/restrMenu/modify'/>");
            form.attr("method", "post");
            form.submit();

        }) // 레스토랑 메뉴 수정


        $("#menuDeleteBtn", "li.menu").on("click", function () {
            let form = $(this).parent();

            form.attr("action", "<c:url value='/mypage/biz/restrMenu/delete'/>");
            form.attr("method", "post");
            form.submit();

        }) // 레스토랑 메뉴 삭제


    }) // ready()


</script>


</body>

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
    var swiper = new Swiper(".mySwiper", {
        width: 330,
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
</html>
