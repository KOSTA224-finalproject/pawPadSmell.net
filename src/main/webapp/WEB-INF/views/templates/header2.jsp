<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%-- 로그아웃 시 작동되는 스크립트 --%>
<script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {
				sessionStorage.clear();
				$("#logoutForm").submit();
			});
		});
	</script>
<%-- 로그인한 사용자가 보는 메뉴 --%>
<sec:authorize access="isAuthenticated()">
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
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
				<li class="nav-item"><a style="color:black; id="black" class="nav-link" href="나의 게시물"><h2><sec:authentication property="principal.name" />님</h2></a></li>
				<li class="nav-item"><a style="color:black; class="nav-link" href="#" id="logoutAction"><h2>로그아웃</h2></a></li>
				<form id="logoutForm" action="/logout" method="post" style="display: none">
					<sec:csrfInput />
				</form>
				<li class="nav-item"><a style="color:black;" class="nav-link" href="${path}/second-list"><h2>중고거래</h2></a></li>
				<li class="nav-item"><a style="color:black;"  class="nav-link" href="${path}/community-list"><h2>커뮤니티</h2></a></li>
				<li class="nav-item"><a style="color:black;"  class="nav-link" href="/updateForm"><h2>회원정보수정</h2></a></li>
			</ul>
		</div>
	</div>
</nav>

    <div id="modal" class="modal">
        <div class="modal-dialog">
            
            <div id="modal-content-socket">
             <a href="javascript:void(0);" onclick="closemodal();">X</a>   
                
            </div>
        </div>
    </div>
		<div class="alert alert-dark" id="socketAlert" role="alert">
			<span id="output"></span>
		</div>

		<script type="text/javascript">
let id = sessionStorage.length;
let alertMSG = '<a href="javascript:void(0);" onclick="callFunction();">총 '+id+'개의 알림이 있습니다.</a>';


document.getElementById("output").innerHTML=alertMSG;

//const modal = document.getElementById("modal")
//const btnModal = document.getElementById("btn-modal")
//btnModal.addEventListener("click", e => {
 //   modal.style.display = "flex"
//})

function callFunction() {
	const modal = document.getElementById("modal");
	modal.style.display = "flex";
		for(let i = 0; i < sessionStorage.length; i++){
			document.getElementById("modal-content-socket").innerHTML += "<div style='display:inline;'>" + sessionStorage.getItem(i) + "<br></div>"
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
<div id="socketAlert" class="alert alert-success" role="alert" style="display:none;"></div>
</sec:authorize>
<%-- 비회원 사용자가 보는 메뉴 --%>
<sec:authorize access="isAuthenticated()==false">
<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
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
				<li class="nav-item"><a class="nav-link" href="guest/loginForm"><h2>로그인</h2></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><h2>중고거래</h2></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><h2>커뮤니티</h2></a></li>
			</ul>
		</div>
	</div>
</nav>
</sec:authorize>