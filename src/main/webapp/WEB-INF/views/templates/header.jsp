<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<sec:authentication property="principal" var="member" />


<%-- 로그아웃 시 작동되는 스크립트 --%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#logoutAction").click(function() {
			sessionStorage.clear();
			$("#logoutForm").submit();
		});
	});
	console.log(${principal});
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
					<li class="nav-item"><a class="nav-link" href="member/mypage">
							<h4>
								<c:choose>
									<c:when test="${member.getAttribute('name') == null}" >
										${member.name}님
									</c:when>
									<c:otherwise>
										${member.getAttribute("name")}님
									</c:otherwise>
								</c:choose>
							</h4>
					</a></li>

					<li class="nav-item"><a class="nav-link" href="#"
						id="logoutAction"><h4>로그아웃</h4></a></li>
					<form id="logoutForm" action="/logout" method="post"
						style="display: none">
						<sec:csrfInput />
					</form>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbardrop" data-toggle="dropdown">
							<h4>중고거래</h4>
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/board/list/2/1">CAT</a> <a
								class="dropdown-item" href="${path}/board/list/2/2">DOG</a> <a
								class="dropdown-item" href="${path}/board/list/2/3">BIRD</a> <a
								class="dropdown-item" href="${path}/board/list/2/4">REPTILE</a>
							<a class="dropdown-item" href="${path}/board/list/2/5">FISH</a> <a
								class="dropdown-item" href="${path}/board/list/2/6">ETC</a>
						</div></li>
					<li class="nav-item dropdown"><a class="nav-link" href="#"
						id="navbardrop" data-toggle="dropdown">
							<h4>커뮤니티</h4>
					</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="${path}/board/list/1/1">CAT</a> <a
								class="dropdown-item" href="${path}/board/list/1/2">DOG</a> <a
								class="dropdown-item" href="${path}/board/list/1/3">BIRD</a> <a
								class="dropdown-item" href="${path}/board/list/1/4">REPTILE</a>
							<a class="dropdown-item" href="${path}/board/list/1/5">FISH</a> <a
								class="dropdown-item" href="${path}/board/list/1/6">ETC</a>
						</div></li>
					<li class="nav-item"><a class="nav-link" href="/updateForm"><h4>회원정보수정</h4></a></li>

				</ul>
			</div>
		</div>
		<div class="alert alert-dark" id="socketAlert" role="alert">
			<span id="output"></span>
		</div>
	</nav>




	<script type="text/javascript">
		let id = sessionStorage.length;
		let alertMSG = '<a href="javascript:void(0);" onclick="callFunction();">총 '
				+ id + '개의 알림이 있습니다.</a>';

		document.getElementById("output").innerHTML = alertMSG;

		//const modal = document.getElementById("modal")
		//const btnModal = document.getElementById("btn-modal")
		//btnModal.addEventListener("click", e => {
		//   modal.style.display = "flex"
		//})

		function callFunction() {
			const modal = document.getElementById("modal");
			modal.style.display = "flex";
			for (let i = 0; i < sessionStorage.length; i++) {
				document.getElementById("modal-content-socket").innerHTML += "<div style='display:inline;'>"
						+ sessionStorage.getItem(i) + "<br></div>"
			}
			return true;
		}

		function closemodal() {
			const modal = document.getElementById("modal");
			modal.style.display = "none";
			document.getElementById("modal-content-socket").innerHTML = "";
			return true;
		}
	</script>
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
					<li class="nav-item"><a class="nav-link"
						href="guest/loginForm"><h4>로그인</h4></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><h4>중고거래</h4></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><h4>커뮤니티</h4></a></li>
				</ul>

			</div>
	</nav>

</sec:authorize>