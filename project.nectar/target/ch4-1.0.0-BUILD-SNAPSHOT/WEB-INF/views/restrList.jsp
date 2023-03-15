<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


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
<div id="menu">
  <ul>
    <li id="menu_title"><a href="<c:url value='/'/>">Nectar</a></li>
    <li>
      <form action="<c:url value="/restr/list"/>" class="search-form" method="get">
        <input type="hidden" name="option" value="searchEngine"/>
        <input type="text" name="keyword" class="search-input" value="${ph.sc.keyword}" placeholder="지역, 식당 또는 음식">
        <input type="submit" class="search-button" value="검색">
      </form>
    </li>
    <li><a href="<c:url value='/hotdeal/list'/>">오늘의핫딜</a></li>
    <li><a href="<c:url value='/restr/list'/>">맛집리스트</a></li>
    <li>
      <a href="<c:url value='/mypage/main'/>">
      <c:choose>
          <c:when test="${not empty sessionScope.Admin_email}"><i class="fa-solid fa-user-secret"></i></a></c:when>
          <c:when test="${not empty sessionScope.Biz_email}"><i class="fa-solid fa-user-tie"></i></a></c:when>
          <c:when test="${not empty sessionScope.User_email}"><i class="fa-solid fa-user"></i></a></c:when>
          <c:otherwise><i class="fa-regular fa-user"></i></a></c:otherwise>
      </c:choose>
    </li>
  </ul>
</div>


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
                  <a href="">${restrDto.restr_name}</a> <span
                        class="star">${restrDto.restr_star}</span>
                </div>
                <div class="restr__location">
                    ${restrDto.restr_location} - <span class="foodType">${restrDto.restr_foodType}</span>
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
</section>


<%--model 에서 list, ph(page, pageSize 포함) 넘겨줘야함--%>
<div id="pageBar" style="text-align:center">
  <c:if test="${ph.showPrev}">
    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.beginPage-1)}"/>">&lt;</a>
  </c:if>
  <c:forEach var="i" begin="${ph.beginPage}" end="${ph.endPage}">
    <a href="<c:url value='/restr/list${ph.sc.getQueryString(i)}'/>">${i}</a>
  </c:forEach>
  <c:if test="${ph.showNext}">
    <a href="<c:url value="/restr/list${ph.sc.getQueryString(ph.endPage+1)}"/>">&gt;</a>
  </c:if>
</div>





<div id="googleMap" style="width:350px;height:350px; float: right;top:initial; margin:20px;" >

  <%--google MAP part--%>
  <SCRIPT>
    window.initMap = function () {
      const map = new google.maps.Map(document.getElementById('googleMap'), {
        conter: {let: 37.513921, lng: 126.943701},
        zoom: 10
      });

      const malls = [

        <c:forEach var="restrDto" items="${restrDto}">
          {label: "${restrDto.restr_name}", name: "", lat: ${restrDto.restr_latitude}, lng: ${restrDto.restr_longitude}},
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
      form.attr("action", "<c:url value='/restr/delete'/>?page=${ph.sc.page}&pageSize=${ph.sc.pageSize}&restr_NUM=" + restrNum );
      form.attr("method", "post")
      form.submit();
    })
  })
</script>

<script>
  let msg = "${msg}";
  if(msg=="DEL_ERR") alert("게시물 삭제에 실패하였습니다. 다시 시도해 주세요.");
</script>

