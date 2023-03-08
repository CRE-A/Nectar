<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false"%>
<c:set var="loginID"  value="${not empty pageContext.request.getSession(false)? pageContext.request.session.getAttribute('Admin_email'):''}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREA_WORLD</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <style>

    div {
      display: block;
    }
    nav {
      position: relative;
      display: flex;
      width: 640px;
      margin: 4em auto;
    }
    nav a {
      display: block;
      width: 20%;
      padding: .75em 0;
      color: #333;
      text-decoration: none;
      text-align: center;
    }
    .nav-underline {
      position: absolute;
      left: 0;
      bottom: -2px;
      width: 20%;
      height: 2px;
      background: #333;
      transition: all .3s ease-in-out;
    }
    nav a:nth-child(1).is-current ~ .nav-underline {
      left: 0;
    }
    nav a:nth-child(2).is-current ~ .nav-underline {
      left: 20%;
    }
    nav a:nth-child(3).is-current ~ .nav-underline {
      left: 40%;
    }
    nav a:nth-child(4).is-current ~ .nav-underline {
      left: 60%;
    }
    nav a:nth-child(5).is-current ~ .nav-underline {
      left: 80%;
    }
    nav a:nth-child(1):hover ~ .nav-underline {
      left: 0;
    }
    nav a:nth-child(2):hover ~ .nav-underline {
      left: 20%;
    }
    nav a:nth-child(3):hover ~ .nav-underline {
      left: 40%;
    }
    nav a:nth-child(4):hover ~ .nav-underline {
      left: 60%;
    }
    nav a:nth-child(5):hover ~ .nav-underline {
      left: 80%;
    }

    .filter-item .rocal_btn ,.filter-item .parking_btn {
      word-break: break-all;
      display: inline-block;
      width: 22%;
      min-height: 50px;
      margin: 22px 29px 0 0;
      cursor: pointer;
    }
    .filter-item input[type=checkbox]+label.small {
      display: inline-block;
      width: 100%;
      height: 50px;
      line-height: 55px;

    }
    .filter-item input[type=checkbox]+label {
      position: relative;
      box-sizing: border-box;
      max-width: 275px;
      width: 45%;
      line-height: 46px;
      font-size: 1.000rem;
      display: inline-block;
      width: 134px;
      font-size: 0.875rem;
      color: #9b9b9b;
      line-height: 36px;
      text-align: center;
      vertical-align: middle;
      border: 2px solid #cbcbcb;
      border-radius: 40px;

    }
    .filter-item input[type=checkbox]:checked+label {
      color: #ff2ac3;
      border-color: green;
    }
    input[type="checkbox" i] {
      background-color: initial;
      cursor: default;
      appearance: auto;
      box-sizing: border-box;
      border: initial;
    }
    .filter-item input[type=checkbox] {
      display: none;
    }

    p {
      display: block;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0px;
      margin-inline-end: 0px;
    }
    .filter-item .btn-region-cancel_wrap:before {
      content: '';
      display: inline-block;
      margin: -4px 8px 0 0;
      vertical-align: middle;
      background-image: url(https://mp-seoul-image-production-s3.mangoplate.com/web/resources/2018022864551sprites_desktop.png);
      background-position: -995px -836px;
      width: 11px;
      height: 11px;
    }
    .filter-item .btn-region-cancel_wrap {
      text-align: right;
      visibility: hidden;
    }
    .submit-container .btn {
      display: block;
      float: left;
      width: 50%;
      font-size: 1.438rem;
      color: #333333;
      line-height: 90px;
      text-align: center;
    }
    .submit-container .btn.submit {
      background-color: violet;
    }

    .submit-container .btn.cancel {
      background-color: #cbcbcb;
    }
    .submit-container .btn {
      display: block;
      float: left;
      width: 50%;
      font-size: 1.438rem;
      color: #333333;
      line-height: 90px;
      text-align: center;
    }
  </style>

  <script>


    function filter_apply() {
      window.opener.location.href="<c:url value="/restr/list"/>";
      window.close();

    }
    function closed_filter() {
      window.opener.location.href="<c:url value="/"/>";
      window.close();
    }



    function click_food(target1){
      document.getElementsByName("foodType")
              .forEach(el => el.checked = false);
      target1.checked = true;
    }

    function click_cost(target2) {
      document.getElementsByName("cost")
              .forEach(el => el.checked = false);
      target2.checked = true;
    }

    function click_location(target3) {
      document.getElementsByName("location")
              .forEach(el => el.checked = false);
      target3.checked = true;

    }
    function click_parking(target4){
      document.getElementsByName("parking")
              .forEach(el => el.checked = false);
      target4.checked = true;

    }

  </script>
</head>
<body>
<div style="text-align:center">
  <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
    <input type="hidden" name="option" value="homeFilter"/>
    <div class="filter-item">
      <label>음식종류</label><br>
      <p class="cuisine_list_wrap">

        <input type="checkbox" id="food01"name="foodType" value="한식" >
        <label for="food01" class="food"onclick="click_food(this)">
          한식
        </label>

        <input type="checkbox" id="food02"name="foodType" value="중식">
        <label for="food02"class="food"onclick="click_food(this)">
          중식
        </label>

        <input type="checkbox" id="food03"name="foodType" value="일식">
        <label for="food03" class="food" onclick="click_food()">
          <span  > 일식 </span>
        </label>


        <input type="checkbox" id="food04"name="foodType" value="양식">
        <label for="food04" class="food" onclick="click_food()">
          <span  > 양식 </span>
        </label>

        <input type="checkbox" id="food05"name="foodType" value="세계음식">
        <label for="food05" class="food" onclick="click_food()">
          <span  > 세계음식 </span>
        </label>

        <input type="checkbox" id="food06"name="foodType" value="뷔페">
        <label for="food06" class="food" onclick="click_food()">
          <span > 뷔페 </span>
        </label>

        <input type="checkbox" id="food07"name="foodType" value="카페">
        <label for="food07" class="food" onclick="click_food()">
          <span  > 카페 </span>
        </label>

        <input type="checkbox" id="food08"name="foodType" value="주점">
        <label for="food08" class="food" onclick="click_food()">
          <span > 주점 </span>
        </label>
      </p>
    </div>
    <hr>
    <div class="filter-item">
      <label>가격/1인당</label><br>
      <p class="price_wrep">
        <input type="checkbox" id="price01" name="cost"  value="만원미만">
        <label onclick="click_cost()"for="price01">
          <span> 만원미만 </span></label>
        <input type="checkbox" id="price02" name="cost"value="1만원대">
        <label onclick="click_cost()"for="price02">
          <span> 1만원대 </span></label>
        <input type="checkbox" id="price03" name="cost" value="2만원대">
        <label onclick="click_cost()"for="price03">
          <span> 2만원대 </span></label>
        <input type="checkbox" id="price04" name="cost" value="3만원대">
        <label onclick="click_cost()"for="price04">
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

        <input type="checkbox" id="rocal01"name="location" value="강남구">
        <label for="rocal01"onclick="click_location()">
          <span > 강남구 </span>
        </label>
        </span>

        <input type="checkbox" id="rocal02"name="location" value="강동구">
        <label for="rocal02"onclick="click_location()">
          <span  > 강동구 </span>
        </label>
        </span>

        <input type="checkbox" id="rocal03"name="location" value="강서구">
        <label for="rocal03" onclick="click_location()">
          <span> 강서구 </span>
        </label>
        </span>

        <input type="checkbox" id="rocal04"name="location" value="강북구">
        <label for="rocal04" onclick="click_location()">
          <span  > 강북구 </span>
        </label>
        </span>

        <input type="checkbox" id="rocal05"name="location" value="서처구">
        <label for="rocal05" onclick="click_location()">
          <span  > 서처구 </span>
        </label>
        </span>

        <input type="checkbox" id="rocal06" name="location" value="송파구">
        <label for="rocal06" onclick="click_location()">
          <span  > 송파구 </span>
        </label>
        </span>
      </p>

      <%--<p id="rocalincheon">

           <input type="checkbox" id="rocal07" name="location" value="26">
           <label for="rocal07" class="rocal" onclick="click_location()">
             <span value="26" > 계양구 </span>
           </label>
           </span>
      </p>--%>
      <div class="btn-region-cancel_wrap visible">


      </div>
    </div>
    <hr>
    <div class="filter-item">
      <label>주차</label><br>

      <input type="checkbox" id="pking30" name="parking" value="주차가능">
      <label for="pking30" onclick="click_parking()">
        <span  > 주차가능 </span>
      </label>
      </span>

      <input type="checkbox" id="pking31" name="parking" value="주차불가">
      <label for="pking31" onclick="click_parking()">
        <span  > 주차불가 </span>
      </label>
      </span>
      <hr>
      <div class="submit-container" style="top: initial; bottom: 0px;">
        <button onclick="closed_filter()">취소</button>


        <button type="submit" onclick="filter_apply()"  >적용</button>

      </div>
    </div>

  </form>
</div>
</body>
</html>

