<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="loginEmail"  value="${not empty pageContext.request.getSession(false)? 'loginEmail':''}"/>
<c:set var="loginOut" value="${not empty loginEmail ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginEmail ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREA_WORLD</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />
  <link rel="stylesheet" href="<c:url value='/css/popFilter.css'/>" />

  <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>
</head>
<body>
<div id="menu">
  <ul>
    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
    <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
    <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>
    <li><a href="<c:url value='${loginOutLink}'/>">
        <i class="fa-light fa-snowman-head"></i>
    </a></li>
  </ul>
</div>


<div style="text-align:center">
  <div class="board-container">
    <h2 style="text-align: center">멍멍이도 야옹하는 그 맛, 매일 새로운 핫딜 <br> Nectar </h2>
    <div class="search-container">

      <button class="filterBtn">
        <i class="fa-solid fa-sliders"></i>
      </button>
      <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
        <input type="hidden" name="option" value="searchEngine"/>
        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식"
               th:field="food01">
        <input type="submit" class="search-button" value="검색">
      </form>
    </div>
  </div>
</div>

<section class="filter__modal">
  <div style="text-align:center" id="filter__container">
    <form action="<c:url value="/restr/list"/>" class="search-form">
      <input type="hidden" name="option" value="homeFilter"/>
      <div class="filter-item">
        <label>음식종류</label><br>
        <p class="cuisine_list_wrap">

          <input type="radio" id="food01" name="foodType" value="한식">
          <label for="food01" class="food">
            한식
          </label>

          <input type="radio" id="food02" name="foodType" value="중식">
          <label for="food02" class="food">
            중식
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

        <input type="radio" id="pking31" name="parking" value="상관없음">
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


<%--/////////TagFilter 시작///////////////////////////////////////////////--%>

<div id="tag01" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag='/>">#전체</a>
    <img src=""> ${tagPic}
  </label>
</div>

<div id="tag02" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=데이트'/>">#데이트</a>
    <img src="">
  </label>
</div>


<div id="tag03" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=분위기 좋은곳'/>">#분위기 좋은곳</a>
    <img src="">
  </label>
</div>


<div id="tag04" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=가로수길'/>">#가로수길</a>
    <img src="">
  </label>
</div>

<div id="tag05" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=핫플'/>">#핫플</a>
    <img src="">
  </label>
</div>

<div id="tag06" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=커플'/>">#커플</a>
    <img src="">
  </label>
</div>


<div id="tag07" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=예쁜'/>">#예쁜</a>
    <img src="">
  </label>
</div>

<div id="tag08" class="tag__list__wrap">
  <label>
    <a href="<c:url value='/restr/list?option=tagFilter&tag=셀카'/>">#셀카</a>
    <img src="">
  </label>
</div>

<%--////////////////////////////////////////////////////////--%>


</body>
</html>

<script>


  const filterBtn = document.querySelector(".filterBtn");
  filterBtn.addEventListener("click", () => {
    const filterModal = document.querySelector(".filter__modal");
    filterModal.classList.toggle("active");

  })

  const filterModal = document.querySelector(".filter__modal");
  filterModal.addEventListener("click", (e) => {

    // 여백 누르면 모달창 꺼지게 만들기
    e.target === filterModal ? filterModal.classList.toggle('active') : false

  })

  const cancelBtn = document.querySelector(".cancelBtn");
  cancelBtn.addEventListener("click", (e) => {
    filterModal.classList.toggle("active");
  })


</script>







<%--<%@ page language="java" contentType="text/html; charset=UTF-8" %>--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<%--<%@ page session="false" %>--%>
<%--<c:set var="loginID"  value="${not empty pageContext.request.getSession(false)? pageContext.request.session.getAttribute('Admin_email'):''}"/>--%>
<%--<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>--%>
<%--<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>--%>


<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <title>CREA_WORLD</title>--%>
<%--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>--%>

<%--  <!-- CSS -->--%>
<%--  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>" />--%>
<%--  <link rel="stylesheet" href="<c:url value='/css/popFilter.css'/>" />--%>

<%--  <script src="https://kit.fontawesome.com/43ede2213f.js" crossorigin="anonymous"></script>--%>




<%--</head>--%>
<%--<body>--%>
<%--<div id="menu">--%>
<%--  <ul>--%>
<%--    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>--%>
<%--    <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>--%>
<%--    <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>--%>
<%--    <li><a href="<c:url value='${loginOutLink}'/>">${loginOut}</a></li>--%>
<%--  </ul>--%>
<%--</div>--%>


<%--<div style="text-align:center">--%>
<%--  <div class="board-container">--%>
<%--    <h2 style="text-align: center">멍멍이도 야옹하는 그 맛, 매일 새로운 핫딜 <br> Nectar </h2>--%>
<%--    <div class="search-container">--%>

<%--      <button class="filterBtn">--%>
<%--        <i class="fa-solid fa-sliders"></i>--%>
<%--      </button>--%>
<%--      <form action="<c:url value="/restr/list"/>" class="search-form" method="get">--%>
<%--        <input type="hidden" name="option" value="searchEngine"/>--%>
<%--        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식"--%>
<%--               th:field="food01">--%>
<%--        <input type="submit" class="search-button" value="검색">--%>
<%--      </form>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<%--<section class="filter__modal">--%>
<%--  <div style="text-align:center" id="filter__container">--%>
<%--    <form action="<c:url value="/restr/list"/>" class="search-form">--%>
<%--      <input type="hidden" name="option" value="homeFilter"/>--%>
<%--      <div class="filter-item">--%>
<%--        <label>음식종류</label><br>--%>
<%--        <p class="cuisine_list_wrap">--%>

<%--          <input type="radio" id="food01" name="foodType" value="한식">--%>
<%--          <label for="food01" class="food">--%>
<%--            한식--%>
<%--          </label>--%>

<%--          <input type="radio" id="food02" name="foodType" value="중식">--%>
<%--          <label for="food02" class="food">--%>
<%--            중식--%>
<%--          </label>--%>

<%--          <input type="radio" id="food03" name="foodType" value="일식">--%>
<%--          <label for="food03" class="food">--%>
<%--            <span> 일식 </span>--%>
<%--          </label>--%>


<%--          <input type="radio" id="food04" name="foodType" value="양식">--%>
<%--          <label for="food04" class="food">--%>
<%--            <span> 양식 </span>--%>
<%--          </label>--%>

<%--          <input type="radio" id="food05" name="foodType" value="세계음식">--%>
<%--          <label for="food05" class="food">--%>
<%--            <span> 세계음식 </span>--%>
<%--          </label>--%>

<%--          <input type="radio" id="food06" name="foodType" value="뷔페">--%>
<%--          <label for="food06" class="food">--%>
<%--            <span> 뷔페 </span>--%>
<%--          </label>--%>

<%--          <input type="radio" id="food07" name="foodType" value="카페">--%>
<%--          <label for="food07" class="food">--%>
<%--            <span> 카페 </span>--%>
<%--          </label>--%>

<%--          <input type="radio" id="food08" name="foodType" value="주점">--%>
<%--          <label for="food08" class="food">--%>
<%--            <span> 주점 </span>--%>
<%--          </label>--%>
<%--        </p>--%>
<%--      </div>--%>
<%--      <hr>--%>
<%--      <div class="filter-item">--%>
<%--        <label>가격/1인당</label><br>--%>
<%--        <p class="price_wrep">--%>
<%--          <input type="radio" id="price01" name="cost" value="만원미만">--%>
<%--          <label for="price01">--%>
<%--            <span> 만원미만 </span></label>--%>
<%--          <input type="radio" id="price02" name="cost" value="1만원대">--%>
<%--          <label for="price02">--%>
<%--            <span> 1만원대 </span></label>--%>
<%--          <input type="radio" id="price03" name="cost" value="2만원대">--%>
<%--          <label for="price03">--%>
<%--            <span> 2만원대 </span></label>--%>
<%--          <input type="radio" id="price04" name="cost" value="3만원대">--%>
<%--          <label for="price04">--%>
<%--            <span> 3만원대 </span></label>--%>
<%--        </p>--%>
<%--      </div>--%>
<%--      <hr>--%>
<%--      <div class="filter-item">--%>
<%--        <label>지역</label><br>--%>
<%--        <nav>--%>
<%--          <a href="#" class="is-current">서울</a>--%>
<%--          <a href="#">인천</a>--%>
<%--          <a href="#">경기</a>--%>
<%--          <a href="#">더보기</a>--%>
<%--          <div class="nav-underline"></div>--%>
<%--        </nav>--%>

<%--        <p id="rocalseoul">--%>

<%--          <input type="radio" id="rocal01" name="location" value="강남구">--%>
<%--          <label for="rocal01">--%>
<%--            <span> 강남구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>

<%--          <input type="radio" id="rocal02" name="location" value="강동구">--%>
<%--          <label for="rocal02">--%>
<%--            <span> 강동구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>

<%--          <input type="radio" id="rocal03" name="location" value="강서구">--%>
<%--          <label for="rocal03">--%>
<%--            <span> 강서구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>

<%--          <input type="radio" id="rocal04" name="location" value="강북구">--%>
<%--          <label for="rocal04">--%>
<%--            <span> 강북구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>

<%--          <input type="radio" id="rocal05" name="location" value="서처구">--%>
<%--          <label for="rocal05">--%>
<%--            <span> 서처구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>

<%--          <input type="radio" id="rocal06" name="location" value="송파구">--%>
<%--          <label for="rocal06">--%>
<%--            <span> 송파구 </span>--%>
<%--          </label>--%>
<%--          </span>--%>
<%--        </p>--%>
<%--      </div>--%>
<%--      <hr>--%>
<%--      <div class="filter-item">--%>
<%--        <label>주차</label><br>--%>

<%--        <input type="radio" id="pking30" name="parking" value="주차가능">--%>
<%--        <label for="pking30">--%>
<%--          <span> 주차가능 </span>--%>
<%--        </label>--%>
<%--        </span>--%>

<%--        <input type="radio" id="pking31" name="parking" value="주차불가">--%>
<%--        <label for="pking31">--%>
<%--          <span> 주차불가 </span>--%>
<%--        </label>--%>
<%--        </span>--%>
<%--        <hr>--%>
<%--        <div class="submit-container" style="top: initial; bottom: 0px;">--%>
<%--          <button type="button" onclick="closed_filter()">취소</button>--%>
<%--          <button type="submit">적용</button>--%>
<%--        </div>--%>
<%--      </div>--%>

<%--    </form>--%>
<%--  </div>--%>
<%--</section>--%>


<%--&lt;%&ndash;/////////TagFilter 시작///////////////////////////////////////////////&ndash;%&gt;--%>

<%--<div id="tag01" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag='/>">#전체</a>--%>
<%--    <img src=""> ${tagPic}--%>
<%--  </label>--%>
<%--</div>--%>

<%--<div id="tag02" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=데이트'/>">#데이트</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>


<%--<div id="tag03" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=분위기 좋은곳'/>">#분위기 좋은곳</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>


<%--<div id="tag04" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=가로수길'/>">#가로수길</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>

<%--<div id="tag05" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=핫플'/>">#핫플</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>

<%--<div id="tag06" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=커플'/>">#커플</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>


<%--<div id="tag07" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=예쁜'/>">#예쁜</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>

<%--<div id="tag08" class="tag__list__wrap">--%>
<%--  <label>--%>
<%--    <a href="<c:url value='/restr/list?option=tagFilter&tag=셀카'/>">#셀카</a>--%>
<%--    <img src="">--%>
<%--  </label>--%>
<%--</div>--%>

<%--&lt;%&ndash;////////////////////////////////////////////////////////&ndash;%&gt;--%>



<%--</body>--%>
<%--</html>--%>

<%--<script>--%>


<%--  const filterBtn = document.querySelector(".filterBtn");--%>
<%--  filterBtn.addEventListener("click", ()=>{--%>
<%--    const filterModal = document.querySelector(".filter__modal");--%>
<%--    filterModal.classList.toggle("active");--%>

<%--  })--%>

<%--  const filterModal = document.querySelector(".filter__modal");--%>
<%--  filterModal.addEventListener("click", (e)=>{--%>

<%--    // 여백 누르면 모달창 꺼지게 만들기--%>
<%--    e.target === filterModal ? filterModal.classList.toggle('active') : false--%>

<%--  })--%>


<%--</script>--%>
