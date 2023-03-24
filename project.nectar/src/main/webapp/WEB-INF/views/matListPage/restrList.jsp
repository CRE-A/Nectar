<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Nectar</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/css/restrList.css'/>"/>
  <%--  script --%>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script
          src="https://kit.fontawesome.com/43ede2213f.js"
          crossorigin="anonymous"
  ></script>
  <script defer src="<c:url value="/restr/list"/>"></script>
  <script
          defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDGgEEcmo8EbPKj8kwDcpC8W18nIZvnq2U&callback=initMap"
  ></script>

</head>
<body>

<section id="navbar">
  <div class="logo">
    <a href="<c:url value='/'/>"> <img src="<c:url value="/images/nectarLogo.png"/>" alt="" class="logo__img"/></a>
  </div>
  <div class="searchBar">
    <form action="" class="search-form" method="get">
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
      <a href="<c:url value='/mypage/logincheck'/>">
        <c:choose>
        <c:when test="${not empty sessionScope.Admin_email}"><i
              class="fa-solid fa-user-secret"></i></a></c:when>
      <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
      <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
      <c:otherwise>LOGIN</i></a></c:otherwise>
      </c:choose>
    </li>
  </ul>
</section>


<!-- Main -->
<section id="main">
  <ul id="restrList">
    <c:forEach var="restrDto" items="${restrDto}">
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
                  <i class="fa-solid fa-pencil"></i> <span>${restrDto.restr_reviewCnt}</span>
                  <i class="fa-regular fa-heart"></i> <span>${restrDto.restr_likeCnt}</span>
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
    </c:forEach>

  </ul>

  <div id="sideMenu">
    <h2 class="googleLocation">
      <c:choose>
        <c:when test="${not empty ph.sc.keyword}">#${ph.sc.keyword} 로 찾아본 맛집이에요 🏠</h2></c:when>
        <c:when test="${not empty ph.sc.foodType}">#${ph.sc.foodType} 으로 찾아 본 맛집이에요 🏠</h2></c:when>
        <c:when test="${not empty ph.sc.cost}">#${ph.sc.cost} 로 찾아 본 맛집이에요 🏠</h2></c:when>
        <c:when test="${not empty ph.sc.location}">#${ph.sc.location} 으로 찾아 본 맛집이에요 🏠</h2></c:when>
        <c:otherwise>#${ph.sc.tag} 로 찾아 본 맛집이에요 🏠</h2></c:otherwise>
      </c:choose>
    <div id="googleMap" style="width:400px;height:400px; float: right;top:initial; margin:20px;">
    </div>
    <h2 class="recentClick">최근 클릭한 맛집이에요 🥰</h2>

    <div class="recentRestr">
      <ul class="recentRestrList">
        <c:forEach var="viewBrowserHistoryList" items="${viewBrowserHistoryList}">
          <div class="recentRestr">
            <li class="recentRestr__item">
              <div class="recentRestr__imgContainer">
                <img
                        src="https://images.unsplash.com/photo-1580822184713-fc5400e7fe10?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8c3VzaGl8ZW58MHx8MHx8&auto=format&fit=crop&w=600&q=60"
                        alt=""
                        class="recentRestr__img"
                />
              </div>
              <div class="recentRestr__info">
                <h3>${viewBrowserHistoryList.restr_name}
                  <span> <fmt:formatNumber value="${viewBrowserHistoryList.restr_star}" pattern=".0"></fmt:formatNumber></span>
                </h3>
                <p> 음식종류 | <span>${viewBrowserHistoryList.restr_foodType}</span></p>
                <p> 위치 | <span>${viewBrowserHistoryList.restr_location}</span></p>
                <p> 가격대 | <span>${viewBrowserHistoryList.restr_cost}</span></p>
              </div>
            </li>
          </div>
        </c:forEach>
      </ul>
    </div>
  </div>


</section>


<div id="pageBar" style="text-align:center">
  <c:if test="${ph.showPrev}">
    <a href="<c:url value="/restr/search${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
  </c:if>
  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
    <a href="<c:url value='/restr/search${ph.sc.getQueryString(i)}'/>">${i}</a>
  </c:forEach>
  <c:if test="${ph.showNext}">
    <a href="<c:url value="/restr/search${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
  </c:if>
</div>



<%--google MAP part--%>
<SCRIPT>
  window.initMap = function () {
    const map = new google.maps.Map(document.getElementById('googleMap'), {
      conter: {let: 37.513921, lng: 126.943701},
      zoom: 10
    });

    const malls = [

      <c:forEach var="restrDto" items="${restrDto}">
      {
        label: "${restrDto.restr_name}",
        name: "",
        lat: ${restrDto.restr_latitude},
        lng: ${restrDto.restr_longitude}
      },
      </c:forEach>


    ];
    const bounds = new google.maps.LatLngBounds();
    const infoWindow = new google.maps.InfoWindow();

    malls.forEach(({label, name, lat, lng}) => {
      const marker = new google.maps.Marker({
        position: {lat, lng},
        label,
        map
      });
      bounds.extend(marker.position);

      marker.addListener("click", () => {
        map.PanTo(marker.position);
        infowindow.setContent(name);
        infowindow.open({
          anchor: marker,
          map
        });
      });
    });

    map.fitBounds(bounds)
  };

</script>

</div>


</body>
</html>

<script>
  $(document).ready(() => {

    $("#restrList").on("click", ".delBtn", function () {
      const restrNum = $(this).parent().attr("data-restrnum");
      console.log(restrNum);
      if (!confirm("정말로 삭제하시겠습니까?")) return;
      let form = $('#restrForm')
      form.attr("action", "<c:url value='/restr/delete'/>?page=${ph.sc.page}&pageSize=${ph.sc.pageSize}&restr_NUM=" + restrNum);
      form.attr("method", "post")
      form.submit();
    })
  })
</script>

<script>
  let msg = "${msg}";
  if (msg == "DEL_ERR") alert("게시물 삭제에 실패하였습니다. 다시 시도해 주세요.");
</script>


