<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<link rel="stylesheet" href="<c:url value='/css/universial_hb.css'/>">
<link rel="stylesheet" href="<c:url value='/css/menu_hb.css'/>">
<link rel="stylesheet" href="<c:url value='/css/registerForm_hb.css'/>">
<body>


<!-- NAVBAR -->
<nav id="navbar">
  <div class="navbar__logo">
    <a href="<c:url value="/" />">BINA</a>
  </div>
  <ul class="navbar__menu">
    <li class="navbar__menu__item active"> <a href="<c:url value="/"/>"> home </a>  </li>
    <li class="navbar__menu__item "> <a href="<c:url value="/board/list"/>"> Board </a>  </li>
    <li class="navbar__menu__item "> <a href="<c:url value="/login/login"/>"> Login </a>  </li>
    <li class="navbar__menu__item "> <a href="<c:url value="/register/add"/>"> Sign in </a>  </li>
  </ul>
</nav>

<!-- Register Form -->

<div class="container">
  <div class="title">Registration</div>
  <div class="content">
    <form action="<c:url value="/register/addBiz"/>" method="post" onsubmit="return registerFormCheck(this)">
      <%--            --%>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <%--            --%>
      <div class="user-details">
        <div class="input-box"> <%--   ID 가 email 로 변경   --%>
          <span class="details ${not empty param.msg ? 'email' : ''}">email</span>
          <input type="text" name="bizAccount_email"  placeholder="Enter your email" required/>
        </div>
        <div class="input-box">
          <span class="details">name</span>
          <input type="text" name="bizAccount_name" placeholder="Enter your name" required />
        </div>
        <div class="input-box">
          <span class="details">Password</span>
          <input type="text" name="bizAccount_pwd" placeholder="Enter your password" required />
        </div>
        <div class="input-box">
          <span class="details  ${not empty param.pmsg ? 'pwd' : ''}">Confirm Password</span>
          <input type="text" name="confirmPwd" placeholder="Confirm your password" required />
        </div>
        <div class="input-box">
          <span class="details">phone</span>
          <input type="text" name="bizAccount_phone" placeholder="Enter your phoneNumber" required />
        </div>

        <%--                <div class="input-box"> &lt;%&ndash;   email 이 date of birth로 변경   &ndash;%&gt;--%>
        <%--                    <span class="details">date of birth</span>--%>
        <%--                    <input type="text" name="date of birth" placeholder="Enter your date of birth" required />--%>
        <%--                </div>--%>
        <%--                <div class="input-box">--%>
        <%--                    <span class="details">Phone Number</span>--%>
        <%--                    <input type="text" name="phn" placeholder="Enter your number" required />--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--            <div class="gender-details">--%>
        <%--                <input type="radio" name="gender" id="dot-1" />--%>
        <%--                <input type="radio" name="gender" id="dot-2" />--%>
        <%--                <input type="radio" name="gender" id="dot-3" />--%>
        <%--                <span class="gender-title">Gender</span>--%>
        <%--                <div class="category">--%>
        <%--                    <label for="dot-1">--%>
        <%--                        <span class="dot one"></span>--%>
        <%--                        <span class="gender">Male</span>--%>
        <%--                    </label>--%>
        <%--                    <label for="dot-2">--%>
        <%--                        <span class="dot two"></span>--%>
        <%--                        <span class="gender">Female</span>--%>
        <%--                    </label>--%>
        <%--                    <label for="dot-3">--%>
        <%--                        <span class="dot three"></span>--%>
        <%--                        <span class="gender">Prefer not to say</span>--%>
        <%--                    </label>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
        <div id="msg">
          ${param.msg}
        </div>
        <div class="button">
          <input type="submit" value="Register" />
        </div>
    </form>
  </div>
</div>




<script>
  function registerFormCheck(frm) {
    if (frm.user_pwd.value != frm.confirmPwd.value) {
      setMessage("비밀번호가 일치하지 않습니다. 다시 입력해 주세요.")
      return false;
    }
    if (frm.user_email.value.length == 0) {
      setMessage("이메일을 입력해 주세요.")
      return false;
    }
    if (frm.user_pwd.value.length == 0) {
      setMessage("비밀번호를 입력해 주세요.")
      return false;
    }
    if (frm.user_name.value.length == 0) {
      setMessage("이름을 입력해 주세요.")
      return false;
    }
    return true;
  }

  function setMessage(msg) {
    document.getElementById("msg").innerHTML = `${'${msg}'}`;
  }
</script>




</body>
</html>

