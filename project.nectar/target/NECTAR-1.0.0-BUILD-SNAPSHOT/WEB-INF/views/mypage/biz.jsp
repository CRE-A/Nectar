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
    <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
    <%--  <link rel="stylesheet" href="<c:url value='/css/biz.css'/>"/>--%>
    <link rel="stylesheet" href="<c:url value='/css/globalPage.css'/>"/>

</head>


<body>
<div id="menu">
    <ul>
        <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
        <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
        <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
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
</div>

<h4><a href="<c:url value='/login/logout'/>">LogOut</a></h4>

<%--  Global Page --%>

<section id="globalPage">
    <!-- Left Side -->
    <div class="sideMenu">
        <button class="tab index">사업정보</button>
        <button class="tab index">사업자정보</button>
        <button class="tab index">매장등록</button>
        <button class="tab index">메뉴등록</button>
        <button class="tab index">핫딜등록</button>
        <button class="tab index">문의남기기</button>
    </div>

    <!-- Right Side -->
    <div class="main">
        <div class="content index active">
            <h1>${bizAccountDto.bizAccount_name}님이 운영중인 레스토랑✏️</h1>
            <div class="container item">
                <ul id="restrList">
                    <form id="restrForm" action="" method="">
                        <!-- 게시글 번호 data-restrNum 에 저장-->
                        <li class="restr" data-restrNum="${restrDto.restr_NUM}">
                            <a href="<c:url value='/restr/read${ph.sc.queryString}&restr_NUM=${restrDto.restr_NUM}'/>">
                                <img src="./img/pizza.png" alt="" class="restr__img"/>
                            </a>
                            <div class="restr__content">
                                <div class="restr__head">
                                    <div class="restr__info">
                                        <div class="restr__title">
                                            <a href="">${restrDto.restr_name}</a>
                                            <span class="star">
                    <fmt:formatNumber value="${restrDto.restr_star}" pattern=".0"></fmt:formatNumber>
                  </span>
                                        </div>
                                        <div class="restr__location">
                                            ${restrDto.restr_location} - <span
                                                class="foodType">${restrDto.restr_foodType}</span>
                                        </div>
                                        <div class="restr__reaction">
                                            <i class="fa-regular fa-eye"></i> <span>${restrDto.restr_viewCnt}</span>
                                            <i class="fa-solid fa-pencil"></i>
                                            <span>${restrDto.restr_reviewCnt}</span>
                                            <i class="fa-regular fa-heart"></i>
                                            <span>${restrDto.restr_likeCnt}</span>
                                        </div>
                                    </div>
                                    <div class="restr__hotdeal">
                                        <c:if test="${restrDto.restr_hotdeal_NUM ne '-1'}">
                                            <i class="fa-solid fa-gift"></i>핫딜 진행중</c:if>
                                    </div>
                                </div>
                            </div>

                            <c:if test="${not empty sessionScope.Admin_email}">
                                <button class="delBtn" type="button">삭제</button>
                            </c:if>

                        </li>
                    </form>

                </ul>
            </div>

            <h1>${bizAccountDto.bizAccount_name}님이 진행한 핫딜 ✏️</h1>
            <div class="container item">
                <c:forEach var="hotdealDto" items="${hotdealDto}">
                    ${hotdealDto.hotdeal_NUM} </br>
                    ${hotdealDto.restr_NUM} </br>
                    ${hotdealDto.restr_category_loc} </br>
                    ${hotdealDto.restr_menu_NUM} </br>
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
                    <%--                      <tr>--%>
                    <%--                        <td class="bno">${hotdealDto.hotdeal_salesVolume}</td>--%>
                    <%--                        <td class="writer">${hotdealDto.hotdeal_MaxSalesVolume}</td>--%>
                    <%--                      </tr>--%>
                </c:forEach>
            </div>

            <h1>핫딜 판매 내역 ✏️</h1>
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
        </div>     <!-- 사업자가 운영중인 레스토랑-->
        <div class="content index">
            <h1>사업자 정보 ✏️</h1>
            <div class="container item">
                <form id="bizAccountInfoForm" action="<c:url value='/mypage/biz/profile/modify'/>" method="post">
                    <div class="user-details">
                        <div class="input-box">
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
                                    value="${bizAccountDto.bizAccount_pwd}"

                            />
                        </div>


                        <button type="button" id="bizUpdateBtn">프로필수정</button>
                        <button type="button" id="bizDelBtn">계정 탈퇴</button>

                    </div>
                </form>
            </div>
        </div>            <!-- 사업자 정보-->
        <div class="content index">
            <h1>매장 등록 필수 정보 입력 ✏️</h1>
            <div class="container item">
                <form id="" action="<c:url value='/mypage/biz/restr/write'/>" method="post">
                    <input name="request_bizAccount_email" type="hidden" value="${bizAccountDto.bizAccount_email}">
                    <div class="user-details">
                        <input name="bizAccount_email" value="${bizAccountDto.bizAccount_email}">
                        <%--                        <input name="biz_reg_num" value="${bizAccountDto.biz_reg_num}" >--%>
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

                        <div class="gender-details">
                            <input type="radio" name="request_restr_cost" id="cost-1" value="만원미만"/>
                            <input type="radio" name="request_restr_cost" id="cost-2" value="1만원대"/>
                            <input type="radio" name="request_restr_cost" id="cost-3" value="2만원대"/>
                            <input type="radio" name="request_restr_cost" id="cost-4" value="3만원대"/>
                            <span class="gender-title">메뉴 평균 가격대 조사</span>
                            <div class="category">
                                <label for="cost-1">
                                    <span class="dot one"></span>
                                    <span class="gender" class="cost">만원미만</span>
                                </label>
                                <label for="cost-2">
                                    <span class="dot two"></span>
                                    <span class="gender" class="cost">1만원대</span>
                                </label>
                                <label for="cost-3">
                                    <span class="dot three"></span>
                                    <span class="gender" class="cost">2만원대</span>
                                </label>
                                <label for="cost-4">
                                    <span class="dot three"></span>
                                    <span class="gender" class="cost">3만원대</span>
                                </label>
                            </div>
                        </div>
                        <div class="gender-details">
                            <input type="radio" name="request_restr_parking" id="parking-1" value="주차가능"/>
                            <input type="radio" name="request_restr_parking" id="parking-2" value="주차불가"/>
                            <span class="gender-title">주차 가능 여부</span>
                            <div class="category">
                                <label for="parking-1">
                                    <span class="dot three"></span>
                                    <span class="gender">주차가능</span>
                                </label>
                                <label for="parking-2">
                                    <span class="dot four"></span>
                                    <span class="gender">주차불가</span>=
                                </label>
                            </div>
                        </div>
                        <div class="gender-details">
                            <input type="radio" name="request_restr_foodType" id="food-1" value="한식"/>
                            <input type="radio" name="request_restr_foodType" id="food-2" value="중식"/>
                            <input type="radio" name="request_restr_foodType" id="food-4" value="양식"/>
                            <input type="radio" name="request_restr_foodType" id="food-5" value="세계음식"/>
                            <input type="radio" name="request_restr_foodType" id="food-6" value="뷔페"/>
                            <input type="radio" name="request_restr_foodType" id="food-3" value="일식"/>
                            <input type="radio" name="request_restr_foodType" id="food-7" value="카페"/>
                            <input type="radio" name="request_restr_foodType" id="food-8" value="주점"/>
                            <span class="gender-title">매장 음식 종류 선택</span>
                            <div class="category">
                                <label for="food-1">
                                    <span class="dot five"></span>
                                    <span class="gender">한식</span>
                                </label>
                                <label for="food-2">
                                    <span class="dot six"></span>
                                    <span class="gender">중식</span>
                                </label>
                                <label for="food-3">
                                    <span class="dot seven"></span>
                                    <span class="gender">일식</span>
                                </label>
                                <label for="food-4">
                                    <span class="dot seven"></span>
                                    <span class="gender">양식</span>
                                </label>
                                <label for="food-5">
                                    <span class="dot seven"></span>
                                    <span class="gender">세계음식</span>
                                </label>
                                <label for="food-6">
                                    <span class="dot seven"></span>
                                    <span class="gender">뷔페</span>
                                </label>
                                <label for="food-7">
                                    <span class="dot seven"></span>
                                    <span class="gender">카페</span>
                                </label>
                                <label for="food-8">
                                    <span class="dot seven"></span>
                                    <span class="gender">주점</span>
                                </label>
                            </div>
                        </div>

                        <input type="submit" value="등록"/>
                    </div>
                </form>
            </div>
        </div>            <!-- 매장등록-->
        <c:if test=""> <!-- 메뉴등록 (레스토랑 심사에 통과한 경우에만 나타나게 한다.)-->
            <div class="content index">
                <h2 class="h2">메뉴 등록</h2>
                <form id="menuForm">
                    <label>메뉴이름</label>
                    <input name="restr_menu_food" type="text" placeholder="메뉴이름을 입력하세요.">
                    <label>메뉴가격</label>
                    <input name="restr_menu_price" type="text" placeholder="메뉴가격을 입력하세요.">
                    <label>메뉴사진</label>
                    <button type="submit">메뉴추가</button>
                </form>

                <h2 class="h2">메뉴 리스트</h2>
                <span>메뉴이름</span>
                <span>메뉴가격</span>
                <ul>
                    <c:if test="${not empty restrMenuDto}">
                        <li>
                            <span>파스타</span>
                            <span>12,000원</span>
                        </li>
                    </c:if>

                </ul>

            </div>
        </c:if>
        <div class="content index">
            <h1>핫딜 이벤트 메뉴 등록 ✏️</h1>
            <div class="container item">
                <form action="<c:url value='/mypage/biz/hotdeal/write'/>" method="post">
                    <div class="user-details">
                        <div class="gender-details">
                            <span class="gender-title">핫딜 등록 메뉴 선택하기</span>
                            <c:forEach var="restrMenuDto" items="${restrMenuDto}" varStatus="status">
                                <input type="hidden" name="bizAccount_email" value=" ${bizAccountDto.bizAccount_email}">
                                <input type="hidden" name="restr_menu_NUM" value=" ${bizAccountDto.bizAccount_email}">
                                <input name="restr_menu_food" value="${restrMenuDto.restr_menu_food}">
                                <input name="restr_NUM" value="${restrMenuDto.restr_NUM}">
                                <input name="restr_menu_price" value="${restrMenuDto.restr_menu_price}">
                                <input name="restr_categroy_loc" value="${restrMenuDto.restr_menu_price}">
                                <input name="hotdeal_picture" value="" type="file">
                                <input name="hotdeal_price" value="" placeholder="핫딜 가격을 입력하세요">
                                <input name="hotdeal_useDate" type="text" value="" placeholder="핫딜 사용기간을 입력하세요">
                                <input name="hotdeal_eventDration" type="text" value="" placeholder="핫딜 기간을 입력하세요">
                                <input name="hotdeal_desc" value="${restrMenuDto.restr_menu_desc}">
                                <input type="radio" name="restr_menu_food" id="dot-<c:out value='${status.count}'/>"/>
                                <div class="category">
                                    <label for="dot-${status.count}">
                                        <span class="dot one"></span>
                                        <span class="gender">${restrMenuDto.restr_menu_food}</span>
                                    </label>
                                </div>
                            </c:forEach>
                        </div>

                        <input type="submit" value="Register"/>
                    </div>
                </form>

            </div>
        </div>            <!-- 핫딜 이벤트 메뉴 등록-->
        <div class="content index">
            <h1>문의 남기기 ✏️</h1>
            <div class="container item">

                <form action="<c:url value='/mypage/biz/QNA/write'/>" method="post">
                    <input type="text" name="qna_title" placeholder="제목 : 인태는 못말려">
                    <textarea name="qna_content" value="" placeholder="내용을 입력하세요 : 제발 누가 좀 말려요"></textarea>
                    <input type="file" name="qna_picture">
                    <input type="hidden" name="qna_writer" value="${bizAccountDto.bizAccount_email}">
                    <input type="hidden" name="qna_name" value="${bizAccountDto.bizAccount_name}">
                    <button type="submit">문의글 등록</button>
                </form>

            </div>
        </div>            <!-- 문의 남기기-->
    </div>
</section>

<%-- / Global Page--%>


<div id="MyRestrantlist">
    <h3>BIZ가 운영중인 레스토랑 </h3>
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


<%-- QNA TEST    --%>
<h2>QNA TEST</h2>
<form id="form" action="<c:url value="/mypage/biz/QNA/write"/>" method="post">
    <input class="detail" type="text" name="qna_title" value="나에게 질문하는 것을 두려워 말라" autofocus>
    <input class="detail" type="text" name="qna_content" value="인태 최고" autofocus>
    <input class="detail" type="text" name="qna_picture" value="핵 깜찍한 인태 사진" autofocus>
    <input class="detail" type="text" name="qna_writer" value="Biz_1@google.com"
           autofocus> <%--qna_writer = ${bizAccountDto.bizAccount_email}}--%>
    <input class="detail" type="text" name="qna_name" value="name1"
           autofocus> <%--qna_name   = ${bizAccountDto.bizAccount_name}}--%>
    <%--            --%>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <%--            --%>
    <button id="loginBtn">QNA 등록</button>
</form>
<%--    --%>


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


        $("#bizDelBtn").on("click", (e) => {

            let form = $("#bizAccountInfoForm");
            form.attr("action", "<c:url value="/mypage/biz/profile/delete"/>");
            form.attr("method", "post");
            form.submit();

        }); // 사업자 계정 탈퇴


        $("#bizUpdateBtn").on("click", (e) => {
            let form = $("#bizAccountInfoForm");
            let isReadOnly = $("input[name=bizAccount_name]").attr("readonly");


            // 읽기상태 -> 수정상태
            if (isReadOnly == "readonly") {
                $("input[name=bizAccount_name]").attr('readonly', false);
                $("input[name=bizAccount_pwd]").attr('readonly', false);
                $("input[name=bizAccount_phone]").attr('readonly', false);
                e.target.innerHTML = "수정완료";
                return;
            }


            form.attr("action", "<c:url value="/mypage/biz/profile/modify"/>");
            form.attr("method", "post");
            form.submit();


        }); // 사업자 계정 수정


    }) // ready()


</script>


</body>
</html>