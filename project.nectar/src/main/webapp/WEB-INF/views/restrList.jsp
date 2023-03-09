<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="loginID" value="${sessionScope.Admin_email}"/>
<c:set var="loginOut" value="${not empty loginID ?'logout' : 'logIn'}"/>
<c:set var="loginOutLink" value="${not empty loginID ?'/login/logout' : '/login/login'}"/>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>CREA_WORLD</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
  <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
  <script
          src="https://kit.fontawesome.com/43ede2213f.js"
          crossorigin="anonymous"
  ></script>

  <!-- CSS -->
  <link rel="stylesheet" href="<c:url value='/css/navbar.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/css/restrList.css'/>"/>


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


<!-- Main -->
<section id="main">
  <ul id="restrList">
    <c:forEach var="restrDto" items="${list}">
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
                    ${restrDto.restr_location}
                  <span class="foodType">${restrDto.restr_foodType}</span>
                </div>
                <div class="restr__reaction">
                  <i class="fa-regular fa-eye"></i> <span>${restrDto.restr_viewCnt}</span>
                  <i class="fa-solid fa-pencil"></i> <span>${restrDto.restr_reviewCnt}</span>
                </div>
              </div>
              <div class="restr__like">
                <i class="fa-regular fa-heart"></i>
              </div>
            </div>
          </div>

          <c:if test="${mode eq 'Admin_access'}">
            <button class="delBtn" type="button">삭제</button>
          </c:if>

        </li>
      </form>

    </c:forEach>

  </ul>
</section>


<%--model 에서 list, ph(page, pageSize 포함) 넘겨줘야함--%>
<div id="pageBar">
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

