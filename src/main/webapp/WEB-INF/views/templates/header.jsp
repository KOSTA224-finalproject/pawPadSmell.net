<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<sec:authentication property="principal" var="member" />
<%-- 로그아웃 시 작동되는 스크립트 --%>
<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {
				$("#logoutForm").submit();
			});
		});
	</script>
<%-- 로그인한 사용자가 보는 메뉴 --%>
<sec:authorize access="isAuthenticated()">

<nav class="navbar navbar-expand-lg navbar-light fixed-top py-0"
	id="mainNav">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="/"><img
			src="/myweb/images/logo-2.png" style="width: 190px;"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto my-2 my-lg-0">
			<li class="nav-item"><a class="nav-link" href="member/mypage"><h4>${member.name}님</h4></a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="logoutAction"><h4>로그아웃</h4></a></li>
				<form id="logoutForm" action="/logout" method="post" style="display: none">
					<sec:csrfInput />
				</form>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">
						<h4>중고거래</h4>
					</a>
					<div class="dropdown-menu">
        				<a class="dropdown-item" href="${path}/board/list/2/1">CAT</a>
        				<a class="dropdown-item" href="${path}/board/list/2/2">DOG</a>
        				<a class="dropdown-item" href="${path}/board/list/2/3">BIRD</a>
        				<a class="dropdown-item" href="${path}/board/list/2/4">REPTILE</a>
        				<a class="dropdown-item" href="${path}/board/list/2/5">FISH</a>
        				<a class="dropdown-item" href="${path}/board/list/2/6">ETC</a>     					
     				</div>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link" href="#" id="navbardrop" data-toggle="dropdown">
						<h4>커뮤니티</h4>
					</a>
					<div class="dropdown-menu">
        				<a class="dropdown-item" href="${path}/board/list/1/1">CAT</a>
        				<a class="dropdown-item" href="${path}/board/list/1/2">DOG</a>
        				<a class="dropdown-item" href="${path}/board/list/1/3">BIRD</a>
        				<a class="dropdown-item" href="${path}/board/list/1/4">REPTILE</a>
        				<a class="dropdown-item" href="${path}/board/list/1/5">FISH</a>
        				<a class="dropdown-item" href="${path}/board/list/1/6">ETC</a>     					
     				</div>
				</li>
				<li class="nav-item"><a class="nav-link" href="/updateForm"><h4>회원정보수정</h4></a></li>
			</ul>
		</div>
	</div>
</nav>
</sec:authorize>
<%-- 비회원 사용자가 보는 메뉴 --%>
<sec:authorize access="isAuthenticated()==false">
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-0"
	id="mainNav">
	<div class="container px-4 px-lg-5">
		<a class="navbar-brand" href="/"><img
			src="/myweb/images/logo-2.png" style="width: 190px;"></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link" href="guest/loginForm"><h4>로그인</h4></a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="register1"><h4>중고거래</h4></a></li>
				<li class="nav-item"><a class="nav-link" href="#" id="register2"><h4>커뮤니티</h4></a></li>
			</ul>
		</div>
	</div>
</nav>
<script type="text/javascript">
$(function() {
	$("#register1").click(function(){
		alert("로그인이 필요한 서비스 입니다");
		location.href="guest/loginForm";
	});
	$("#register2").click(function(){
		alert("로그인이 필요한 서비스 입니다");
		location.href="guest/loginForm";
	});
});
</script>
</sec:authorize>
