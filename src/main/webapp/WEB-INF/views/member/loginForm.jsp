<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap Icons -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic"
	rel="stylesheet" type="text/css" />
<!-- SimpleLightbox plugin CSS -->


<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<link href="/myweb/css/styles.css" rel="stylesheet" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap"
	rel="stylesheet">
<head>
<script type="text/javascript">
	$(document).ready(function() {
		$("#findForm").submit(function() {
			if ($("#findForm :input[name=id]").val() == "") {
				alert("아이디를 입력하세요!");
				return false;
			}
		});
	});
</script>
<meta charset="UTF-8">
<title>loginForm</title>
</head>
<body style="background-color: #F9FAFD">
	<div class="container">
		<div class="row pt-5 h-100">
			<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
				<a href="/"><img src="/myweb/images/logo-2.png"
					style="width: 350px;"></a><br> <br>
					
					<form action="/login" method="post" id="loginForm">
						<div class="form-floating mb-3">
						<sec:csrfInput /> 
							<input class="form-control" name="id" type="email"
								placeholder="name@example.com" data-sb-validations="required" />
							<label for="id">Email</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">A
								Email is required.</div>
						</div>
						<!-- Email address input-->
						<div class="form-floating mb-3">
							<input class="form-control" name="password" type="password"
								placeholder="name@example.com"
								data-sb-validations="required,password" /> <label
								for="password">Password </label>
								
							<div class="invalid-feedback" data-sb-feedback="email:required">An
								email is required.</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">Email
								is not valid.</div>
						</div>

						<div class="d-grid gap-2">
							<button class="btn btn-light btn-xl bg-primary" 
							><h5>로그인</h5></button>
						</div>
					</form>
					<a href="/oauth2/authorization/kakao">
					<img src="/myweb/images/kakao_login_medium_wide.png">
					</a>
					<br>
					<br>
				

					<div class="asd"
						style="display: flex; align-items: center; justify-content: center;">
						<form style="width: 221px; padding-right: 20px;">
							<div class="d-grid gap-5">
								<a href="/guest/findIdForm" class="btn btn-light btn-xl bg-primary"
									role="button" style="">아이디찾기</a>
							</div>
							<br>
						</form>
						
						<form style="width: 220px;">
							<div class="d-grid gap-2">
								<a href="/guest/registerForm" class="btn btn-light btn-xl bg-primary"
									role="button" style="">회원가입</a>
							</div>
							<br>
						</form>
					</div>
				
			</div>
		</div>
	</div>

</body>
</html>

<!-- <form id="findForm" action="/guest/findMemberById">
	<input type="text" name="id" size="5" placeholder="아이디">
	 <input type="submit" value="검색">
</form>
<br> -->


<%-- 비로그인 상태의 사용자가 보는 메뉴  --%>
<%-- <sec:authorize access="isAuthenticated()==false"> --%>
	<!-- <br> -->
	<%-- spring security 적용 로그인시에는 반드시 post방식으로 해야 함.  --%>
	<%--
	       Spring Security에서는 보안강화를 위해 
		   post방식 정보전송일때는 반드시 csrf 토큰을 삽입해야 전송이 된다
		   아래 security tag를 쓰면 hidden tag 가 자동 생성된다 
		   csrf 토큰을 명시하지 않으면 인가되지 않아 accessDeniedView가 보인다 
		   
	       로그인 로그아웃은 모두 post 방식 요청으로 해야 하고
	        csrf 해킹방지를 위한  토큰처리가 필요하다 
		   
	--%>
	<%-- <form action="/login" method="post" id="loginForm">
		csrf 토큰
		<sec:csrfInput />
		<input type="text" name="id" size="10" placeholder="이메일"><br>
		<input type="password" name="password" size="10" placeholder="비밀번호"><br>
		<input type="submit" value="로그인">
	</form> --%>
	<%-- 비로그인한 사용자가 접근해야 하므로 guest로 접근한다 
	       org.kosta.myproject.config.security.WebSecurityConfig의 설정을 확인한다 
	 --%>
	<%-- <a href="/guest/registerForm">회원가입</a>
	<br>
</sec:authorize> --%>
<%-- 로그인한 사용자가 보는 메뉴 --%>
<%-- <sec:authorize access="isAuthenticated()"> --%>
	<%-- 
Spring Security를 이용하면 Authentication Bean 이 생성
로그인 한 사용자의 정보는 Authentication 객체의 principal 에 저장된다 
 --%>
	<%-- <sec:authentication property="principal.name" />님 <br>
	<a href="/enterCafe">카페가기</a>
	<br> --%>
	<%-- spring security logout은 다음과 같은 처리가 필요하다
	로그인 로그아웃은 모두 post 방식 요청으로 해야 하고  csrf 해킹방지를 위한  토큰처리가 필요하다 --%>
	<!-- <script type="text/javascript">
		$(document).ready(function() {
			$("#logoutAction").click(function() {
				$("#logoutForm").submit();
			});
		});
	</script> -->
	<%-- <a href="#" id="logoutAction">로그아웃</a>
	<form id="logoutForm" action="/logout" method="post"
		style="display: none">
		<sec:csrfInput />
	</form>
	<br>
	<a href="/updateForm">회원정보수정</a>
	<br>
	<br>
</sec:authorize>
<br>
<br>
아래는 관리자일 때 보이는 메뉴
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/admin/main">관리자모드</a>
</sec:authorize>
<br>
<br>
<a href="/guest/testAuth">인증,인가테스트</a> --%>





