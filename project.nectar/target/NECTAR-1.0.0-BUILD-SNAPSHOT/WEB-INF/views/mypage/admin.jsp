<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


<section id="globalPage">
    <!-- Left Side -->
    <div class="sideMenu">
        <button class="tab index">회원정보</button>
        <button class="tab index">매장심사</button>
        <button class="tab index">핫딜심사</button>
        <button class="tab index">F&Q</button>
    </div>

    <!-- Right Side -->
    <div class="main">

        <div class="content index active">
            <h1> 회원 정보 ✏️</h1>
            <div class="container item">
                <form id="userInfoForm" action="<c:url value='/admin/read'/>"></form>
                <select class="user-search-option" name="option">
                    <option value="all">전체</option>
                    <option value="email">이메일</option>
                    <option value="name">이름</option>
                    <option value="stateCode">상태코드</option>
                </select>
                <input type="text">
                <button type="submit">검색</button>
            </div>
            <h1> 회원 검색 결과 ✏️</h1>
            <div class="container item">
                <%-- 회원 검색 리스트--%>
                <div class="recent-order">
                    <table>
                        <thead>
                        <tr>
                            <th class="title">이름</th>
                            <th>이메일</th>
                            <th>연락처</th>
                            <th>상태코드</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%--                        <c:forEach var="SearchResultUserList" items="${SearchResultUserList}">--%>
                        <%--                            <form action="<c:url value='/mypage/admin/account/management'/>" method="post" id="adminForm">--%>
                        <%--                                <tr>--%>
                        <%--                                    <td class="no"><input type="hidden" name="user_NUM"--%>
                        <%--                                                          value="${SearchResultUserList.user_name}">${SearchResultUserList.user_name}</td>--%>
                        <%--                                    <td class="writer"><input type="hidden" name="user_email"--%>
                        <%--                                                              value="${SearchResultUserList.user_email}">${SearchResultUserList.user_email}</td>--%>
                        <%--                                    <td class="viewCnt"><input type="hidden" name="user_ph"--%>
                        <%--                                                               value="${SearchResultUserList.user_phone}">${SearchResultUserList.user_phone}</td>--%>
                        <%--                                    <td>--%>
                        <%--                                        <select name="user_state_code">--%>
                        <%--                                            <option value="0">일반회원</option>--%>
                        <%--                                            <option value="-1">리뷰작성금지</option>--%>
                        <%--                                            <option value="-2">핫딜결제금지</option>--%>
                        <%--                                            <option value="-3">계정삭제</option>--%>
                        <%--                                        </select>--%>
                        <%--                                    </td>--%>
                        <%--                                    <td>--%>
                        <%--                                        <input class="userBtn" type="submit" value="회원등급변경">--%>
                        <%--                                    </td>--%>
                        <%--                                </tr>--%>
                        <%--                            </form>--%>
                        <%--                        </c:forEach>--%>
                        </tbody>
                    </table>
                </div>
            </div>
            <h1> 사업자 검색 결과 ✏️</h1>
            <div class="container item">
                <%-- 사업자 검색 리스트--%>
                <div class="recent-order">
                    <table>
                        <thead>
                        <tr>
                            <th>사업주</th>
                            <th>이메일</th>
                            <th>연락처</th>
                            <th>등록날짜</th>
                            <th>사업자등록번호</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%--                                                <c:forEach var="SearchResultBizAccountList" items="${SearchResultBizAccountList}">--%>

                        <%--                                                    <tr>--%>
                        <%--                                                        <td class="no"> ${SearchResultBizAccountList.bizAccount_name}</td>--%>
                        <%--                                                        <td class="writer"> ${SearchResultBizAccountList.bizAccount_email}</td>--%>
                        <%--                                                        <td class="viewCnt"> ${SearchResultBizAccountList.bizAccount_phone}</td>--%>
                        <%--                                                        <td class="date"> ${SearchResultBizAccountList.bizAccount_regdate}</td>--%>
                        <%--                                                        <td class="viewCnt"> ${SearchResultBizAccountList.bizAccount_regNum}</td>--%>
                        <%--                                                    </tr>--%>

                        <%--                                                </c:forEach>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="content index">
            <h1> 매장심사 ✏️</h1>
            <div class="container item">
                <%-- 심사 요청 매장 리스트--%>
                <div class="recent-order">
                    <table>
                        <thead>
                        <tr>
                            <th>no</th>
                            <th>매장이름</th>
                            <th>연락처</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="request_restrDto" items="${request_restrDto}">

                            <tr>
                                <td >${request_restrDto.request_restr_NUM}</td>
                                <td class="title"><a
                                        href="<c:url value="/mypage/admin/restr/read?request_restr_NUM=${request_restrDto.request_restr_NUM}"/>">
                                        ${request_restrDto.request_restr_name}
                                </a>
                                </td>
                                <td >${request_restrDto.request_restr_phone}</td>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="content index">
            <h1> 핫딜심사 ✏️</h1>
            <div class="container item">
                <%-- 핫딜 요청 매장 리스트--%>
                <div class="recent-order">
                    <table>
                        <thead>
                        <tr>
                            <th>no</th>
                            <th>사업장</th>
                            <th>메뉴</th>
                            <th>가격책정</th>
                        </tr>
                        </thead>
                        <tbody>

                        <%--                        <c:forEach var="request_hotdealDto" items="${request_hotdealDto}">--%>

                        <%--                            <tr>--%>
                        <%--                                <td class="no">${request_hotdealDto.request_restr_NUM}</td>--%>
                        <%--                                <td class="requestRestrName"><a--%>
                        <%--                                        href="<c:url value="/mypage/admin/hotdeal/read?request_restr_NUM=${request_hotdealDto.request_restr_NUM}"/>">${request_hotdealDto.request_restr_name}</a>--%>
                        <%--                                </td>--%>
                        <%--                                <td class="writer">${request_hotdealDto.request_reestr_menu_food}</td>--%>
                        <%--                                <td class="writer">${request_hotdealDto.request_reestr_menu_price}</td>--%>

                        <%--                            </tr>--%>
                        <%--                        </c:forEach>--%>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="content index">
            <h1> F&Q✏️</h1>
            <div class="container item">

                <c:forEach var="QNADto" items="${QNADto}">
                    ${QNADto.qna_NUM}</br>
                    ${QNADto.qna_title}</br>
                    ${QNADto.qna_content}</br>
                    ${QNADto.qna_picture}</br>
                    ${QNADto.qna_regdate}</br>
                    ${QNADto.qna_writer}</br>
                    ${QNADto.qna_name}</br>
                    -------------------</br>
                </c:forEach>
            </div>
        </div>

    </div>
</section>


<%--select tag 에서 선택하면, option 과 keyword 를 parameter로 넘어가서 일치하는 user정보를 담아준다. --%>
<%--<div id="user_info">--%>
<%--    <h3>User 에 대한 정보 </h3>--%>
<%--    <c:forEach var="SearchResultUserList" items="${SearchResultUserList}">--%>
<%--        ${SearchResultUserList.user_email}--%>
<%--        ${SearchResultUserList.user_pwd}--%>
<%--        ${SearchResultUserList.user_name}--%>
<%--        ${SearchResultUserList.user_phone}--%>
<%--        ${SearchResultUserList.user_picture}--%>
<%--        ${SearchResultUserList.user_regdate}--%>
<%--        ${SearchResultUserList.user_state_code}</br>--%>
<%--    </c:forEach>--%>
<%--</div>--%>


<%--<div id="Biz_info">--%>
<%--    <h3>BizAccount 에 대한 정보 </h3>--%>
<%--    <c:forEach var="SearchResultBizAccountList" items="${SearchResultBizAccountList}">--%>
<%--        ${SearchResultBizAccountList.bizAccount_email}--%>
<%--        ${SearchResultBizAccountList.bizAccount_pwd}--%>
<%--        ${SearchResultBizAccountList.bizAccount_name}--%>
<%--        ${SearchResultBizAccountList.bizAccount_phone}--%>
<%--        ${SearchResultBizAccountList.bizAccount_picture}--%>
<%--        ${SearchResultBizAccountList.bizAccount_regdate}--%>
<%--        ${SearchResultBizAccountList.bizAccount_state_code}</br>--%>
<%--        ${SearchResultBizAccountList.bizAccount_regNum}</br>--%>
<%--    </c:forEach>--%>
<%--</div>--%>


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


    }) // ready()

</script>


</body>
</html>
