<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
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
<meta charset="UTF-8">
<title>findIdForm</title>
</head>
<body style="background-color: #F9FAFD">
	<div class="container">
		<div class="row pt-5 h-100">
			<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
				<a href="/"><img src="/myweb/images/logo-2.png"
					style="width: 350px;"></a><br> <br>
				<form id="findForm" action="/guest/findIdByName">
					<input class="form-control" type="text" name="name" size="20" placeholder="아이디"><br>
				<br> <input
					class="btn btn-light btn-xl bg-primary"	type="submit" value="아이디 찾기">
				</form>
				<br><br>
				<h1>당신의 등록된 E-mail은 "${requestScope.dto.email}" 입니다!</h1>	
			</div> 
		</div>
	</div>
</body>
</html>