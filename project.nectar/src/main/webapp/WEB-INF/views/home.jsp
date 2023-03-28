<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Nectar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

    <!-- CSS -->
    <link rel="stylesheet" href="<c:url value='/css/navbarHome.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/popFilter.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/home.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/css/tagFilter.css'/>"/>
    <%--  <link rel="stylesheet" href="<c:url value='/css/tagpic.css'/>" />--%>

    <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>
</head>
<body>
<%--NAVBAR--%>

<section id="navbar">
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

<!-- Home -->


<div id="msg">
    <c:if test="${LoginFailMessage!=null}">
        <p> Error : <c:out value="${LoginFailMessage}"/> </p><br/>
    </c:if>
</div>


<!-- Home -->

<section id="home" style='background-image: url("<c:url value='/images/steak.jpg'/>")'>
    <div class="title">
        <h1 class="title slogan">솔직한 리뷰, 믿을 수 있는 평점!</h1>
    </div>
    <div class="searchBar">
        <button class="filterBtn">
            <i class="fa-solid fa-sliders"></i>
        </button>
        <form action="<c:url value="/restr/search?"/>" class="search-form" method="get" onsubmit="return keywordFormCheck(this)">
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

    <div clss="top_searched_keyword" style="background-color: yellowgreen; margin : 10px; padding: 10px; ">
        <span>인기 검색어 : </span>
        <c:forEach var="topSearchKeyword" items="${topSearchKeywordList}">
            <a href="<c:url value='/restr/search?option=searchEngine&keyword=${topSearchKeyword.searchKeyword}'/>">${topSearchKeyword.searchKeyword}</a>
        </c:forEach>
    </div>


</section>



<!-- Tag Filter -->
<div class="sub_title">
    <h1>믿고 먹는 맛집 리스트 💕</h1>
</div>

<div class="tagFilter">
    <div class="tag item1">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=인스타그램'/>">
            <img
                    src="https://images.unsplash.com/photo-1562147458-0c12e8d29f50?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#인스타그램</span>
            </div>
        </a>
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=데이트'/>">
            <img
                    src="https://images.unsplash.com/photo-1559620192-032c4bc4674e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=858&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#데이트</span>
            </div>
        </a>
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=분위기 좋은곳'/>">
            <img
                    src="https://images.unsplash.com/photo-1517957096399-3a4e3d34d95e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#분위기 좋은 곳</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=핫플'/>">
            <img
                    src="https://images.unsplash.com/photo-1583953623787-ada99d338235?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#핫플</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=가로수길'/>">
            <img
                    src="https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=930&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#가로수길</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=커플'/>">
            <img
                    src="https://images.unsplash.com/photo-1609951651556-5334e2706168?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#커플</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=예쁜'/>">
            <img
                    src="https://images.unsplash.com/photo-1560180474-e8563fd75bab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#예쁜</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=셀카'/>">
            <img
                    src="https://images.unsplash.com/photo-1543573852-1a71a6ce19bc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#셀카</span>
            </div>
        </a
        >
    </div>
    <div class="tag item">
        <a href="<c:url value='/restr/search?option=tagFilter&tag=예쁜'/>">
            <img
                    src="https://images.unsplash.com/photo-1509042239860-f550ce710b93?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
                    alt=""
            />
            <div class="background">
                <span class="text">#크레아</span>
            </div>
        </a
        >
    </div>
</div>

<%--Filter Modal--%>

<section class="filter__modal">
    <div style="text-align:center" id="filter__container">
        <form action="<c:url value="/restr/search"/>" class="filter-form">
            <input type="hidden" name="option" value="homeFilter"/>
            <div class="filter-item">
                <label>음식종류</label><br>
                <p class="cuisine_list_wrap">

                    <input type="radio" id="food01" name="foodType" value="한식">
                    <label for="food01" class="food">
                        <span> 한식 </span>
                    </label>

                    <input type="radio" id="food02" name="foodType" value="중식">
                    <label for="food02" class="food">
                        <span> 중식 </span>
                    </label>

                    <input type="radio" id="food03" name="foodType" value="일식">
                    <label for="food03" class="food">
                        <span> 일식 </span>
                    </label>


                    <input type="radio" id="food04" name="foodType" value="양식">
                    <label for="food04" class="food">
                        <span> 양식 </span>
                    </label>

                    <input type="radio" id="food05" name="foodType" value="세계음식">
                    <label for="food05" class="food">
                        <span> 세계음식 </span>
                    </label>

                    <input type="radio" id="food06" name="foodType" value="뷔페">
                    <label for="food06" class="food">
                        <span> 뷔페 </span>
                    </label>

                    <input type="radio" id="food07" name="foodType" value="카페">
                    <label for="food07" class="food">
                        <span> 카페 </span>
                    </label>

                    <input type="radio" id="food08" name="foodType" value="주점">
                    <label for="food08" class="food">
                        <span> 주점 </span>
                    </label>
                </p>
            </div>
            <hr>
            <div class="filter-item">
                <label>가격/1인당</label><br>
                <p class="price_wrep">
                    <input type="radio" id="price01" name="cost" value="만원미만">
                    <label for="price01">
                        <span> 만원미만 </span></label>
                    <input type="radio" id="price02" name="cost" value="1만원대">
                    <label for="price02">
                        <span> 1만원대 </span></label>
                    <input type="radio" id="price03" name="cost" value="2만원대">
                    <label for="price03">
                        <span> 2만원대 </span></label>
                    <input type="radio" id="price04" name="cost" value="3만원대">
                    <label for="price04">
                        <span> 3만원대 </span></label>
                </p>
            </div>
            <hr>
            <div class="filter-item">
                <label>지역</label><br>
                <nav>
                    <a href="#" class="is-current">서울</a>
                    <a href="#">인천</a>
                    <a href="#">경기</a>
                    <a href="#">더보기</a>
                    <div class="nav-underline"></div>
                </nav>

                <p id="rocalseoul">

                    <input type="radio" id="rocal01" name="location" value="강남구">
                    <label for="rocal01">
                        <span> 강남구 </span>
                    </label>
                    </span>

                    <input type="radio" id="rocal02" name="location" value="강동구">
                    <label for="rocal02">
                        <span> 강동구 </span>
                    </label>
                    </span>

                    <input type="radio" id="rocal03" name="location" value="강서구">
                    <label for="rocal03">
                        <span> 강서구 </span>
                    </label>
                    </span>

                    <input type="radio" id="rocal04" name="location" value="강북구">
                    <label for="rocal04">
                        <span> 강북구 </span>
                    </label>
                    </span>

                    <input type="radio" id="rocal05" name="location" value="서처구">
                    <label for="rocal05">
                        <span> 서처구 </span>
                    </label>
                    </span>

                    <input type="radio" id="rocal06" name="location" value="송파구">
                    <label for="rocal06">
                        <span> 송파구 </span>
                    </label>
                    </span>
                </p>


                <div class="btn-region-cancel_wrap visible">
                </div>
            </div>
            <hr>
            <div class="filter-item">
                <label>주차</label><br>

                <input type="radio" id="pking30" name="parking" value="주차가능">
                <label for="pking30">
                    <span> 주차가능 </span>
                </label>
                </span>

                <input type="radio" id="pking31" name="parking" value="주차불가">
                <label for="pking31">
                    <span> 주차불가 </span>
                </label>
                </span>
                <hr>
                <div class="submit-container" style="top: initial; bottom: 0px;">
                    <button class="cancelBtn" type="button">취소</button>
                    <button type="submit">적용</button>
                </div>
            </div>

        </form>
    </div>
</section>





</body>
</html>

<script>


    const filterBtn = document.querySelector(".filterBtn");
    filterBtn.addEventListener("click", () => {

        const filterModal = document.querySelector(".filter__modal");
        filterModal.classList.toggle("active");

        const body = document.querySelector("body");
        body.style.position = "fixed";
        body.style.width = "100%";
        body.style.height = "100%";
        body.style.overflow = "hidden";


    })

    const filterModal = document.querySelector(".filter__modal");
    filterModal.addEventListener("click", (e) => {

        // 이벤트 버블링 방지
        if(e.target != e.currentTarget){
            return;
        }

        // 여백 누르면 모달창 꺼지게 만들기
        e.target === filterModal ? filterModal.classList.toggle('active') : false

        // 부모 노드 스크롤 방지
        const body = document.querySelector("body");
        body.removeAttribute("style");


    })

    const cancelBtn = document.querySelector(".cancelBtn");
    cancelBtn.addEventListener("click", (e) => {
        filterModal.classList.toggle("active");

        // 부모 노드 스크롤 방지
        const body = document.querySelector("body");
        body.removeAttribute("style");

    })


</script>

<script>
    function keywordFormCheck(form) {
        if (form.keyword.value.length == 0) {
            alert("검색어를 입력해 주세요.")
            return false;
        }
    }
</script>

