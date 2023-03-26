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
    <link rel="stylesheet" href="<c:url value='/css/hotdealList.css'/>"/>
    <%--  script --%>
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <script
            src="https://kit.fontawesome.com/43ede2213f.js"
            crossorigin="anonymous"
    ></script>

</head>
<body>

<%--navbar--%>
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
    <ul class="hotdealList">
        <c:forEach var="hotdealDto" items="${hotdealDto}">
            <li class="hotdealRestr">
                <a href="<c:url value="/hotdeal/read?hotdeal_NUM=${hotdealDto.hotdeal_NUM}"/>" class="hotdealRestr_wrap">
                    <div class="hotdealRest__imgDesc">
                        <div class="hotdealRestr__imgContainer">
                            <img
                                    src="https://i.pinimg.com/564x/6b/0b/ea/6b0bea27a1799ba9167d844f337be5e2.jpg"
                                    alt=""
                                    class="hotdealRestr__img"
                            />
                        </div>
                        <div class="hotdealRestr__imgDeem">
                            <div class="left">
                                <div class="left__item-new">
                                    <span>new</span>
                                </div>
                                <div class="left__item-discountRate">
                                    <p>${hotdealDto.hotdeal_discountRate}%</p>
                                </div>
                            </div>
                            <div class="right">
                                <div class="right__item-menuPrice">${hotdealDto.restr_menu_price}</div>
                                <div class="right__item-hotdealPrice">${hotdealDto.hotdeal_price}</div>
                            </div>
                        </div>
                    </div>
                    <div class="hotdealRestr__info">
                        <div class="info__head">
                            <h1>[${hotdealDto.restr_category_loc}] ${hotdealDto.restr_name}</h1>
                        </div>
                        <div class="info__hotdealMenu">
                            <p>${hotdealDto.restr_menu_food}</p>
                        </div>
                        <div class="info__hotdealDesc">
                            <div class="hotdealDesc__wrap">
                                <p>${hotdealDto.hotdeal_desc}</p>
                            </div>
                        </div>
                    </div>
                </a>
            </li>
        </c:forEach>

    </ul>
</section>

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
<%--    <link rel="stylesheet" href="<c:url value='/css/hotdealList.css'/>"/>--%>
<%--    &lt;%&ndash;  script &ndash;%&gt;--%>
<%--    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>--%>
<%--    <script--%>
<%--            src="https://kit.fontawesome.com/43ede2213f.js"--%>
<%--            crossorigin="anonymous"--%>
<%--    ></script>--%>

<%--</head>--%>
<%--<body>--%>

<%--&lt;%&ndash;navbar&ndash;%&gt;--%>
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
<%--<section id="main">--%>

<%--    <table>--%>
<%--        <tr>--%>
<%--            <th class="">hotdeal_NUM</th>--%>
<%--            <th class="">restr_NUM</th>--%>
<%--            <th class="">restr_name</th>--%>
<%--            <th class="">restr_category_loc</th>--%>
<%--            <th class="">restr_menu_NUM</th>--%>
<%--            <th class="">restr_menu_picture</th>--%>
<%--            <th class="">restr_menu_food</th>--%>
<%--            <th class="">restr_menu_price</th>--%>
<%--            <th class="">hotdeal_price</th>--%>
<%--            <th class="">hotdeal_discountRate</th>--%>
<%--            <th class="">hotdeal_desc</th>--%>
<%--            <th class="">hotdeal_useDate</th>--%>
<%--            <th class="">hotdeal_eventDuration</th>--%>
<%--            <th class="">hotdeal_regdate</th>--%>
<%--            <th class="">hotdeal_update</th>--%>
<%--            <th class="">hotdeal_salesVolume</th>--%>
<%--            <th class="">hotdeal_MaxSalesVolume</th>--%>
<%--            <th class="">bizAccount_email</th>--%>
<%--        </tr>--%>

<%--        <c:forEach var="hotdealDto" items="${hotdealDto}">--%>
<%--            <tr>--%>
<%--                <td class="">${hotdealDto.hotdeal_NUM}</td>--%>
<%--                <td class="">${hotdealDto.restr_NUM}</td>--%>
<%--                <td class="title"><a--%>
<%--                        href="<c:url value="/hotdeal/read?hotdeal_NUM=${hotdealDto.hotdeal_NUM}"/>">${hotdealDto.restr_name}</a>--%>
<%--                </td>--%>
<%--                <td class="">${hotdealDto.restr_category_loc}</td>--%>
<%--                <td class="">${hotdealDto.restr_menu_NUM}</td>--%>
<%--                <td class="">${hotdealDto.restr_menu_picture}</td>--%>
<%--                <td class="">${hotdealDto.restr_menu_food}</td>--%>
<%--                <td class="">${hotdealDto.restr_menu_price}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_price}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_discountRate}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_desc}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_useDate}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_eventDuration}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_regdate}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_update}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_salesVolume}</td>--%>
<%--                <td class="">${hotdealDto.hotdeal_MaxSalesVolume}</td>--%>
<%--                <td class="">${hotdealDto.bizAccount_email}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--    </table>--%>

<%--</section>--%>

<%--</body>--%>
<%--</html>--%>
