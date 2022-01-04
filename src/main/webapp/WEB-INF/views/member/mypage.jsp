<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- spring security custom tag를 사용하기 위한 선언 --%>
<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authentication property="principal" var="member" />
<html>

<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
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

<title>mypage</title>

</head>

<body>
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
			</div>
		</nav>

		<div class="container">
			<div class="row pt-5 h-100">
				<div class="col-lg-7 mx-auto text-center mt-7 mb-5">
				<c:choose>
					<c:when test="${mypage==null }">
					<h1>마이페이지</h1>
					<br>
					<h2>프로필사진</h2>
					<img src="/img/profile.png"
						style="width: 350px;">
					<form action="mypage/upload" method="post" enctype="multipart/form-data">
						<input type="file" name="file">
						<h2>자기소개글입니다</h2>
						<div class="form-floating mb-3">
							<sec:csrfInput />
							<input class="form-control"
								style="font-family: 'Jua'; font-weight: 500; width: 70%; display: inline-block; float: left; margin-bottom: 20px; background-color: white;"
								type="text" name="profileText" id="aa" placeholder="자기소개글"> <br>
							<input type="submit" class="btn btn-light btn-xl bg-primary"
								style="position: relative; margin: 0; padding: 0; height: 42px; width: 24%; left: 3%; font-weight: bold;"
								value="저장">
					</form>
					</c:when>
					<c:otherwise>
							<h1>마이페이지</h1>
					<br>
					<h2>프로필사진</h2>
					<form id="fileForm" method="post" enctype="multipart/form-data">
					<img src="${mypage.profileFilepath}"
						style="width: 350px;">
						<h2>자기소개글입니다</h2>
						<input type="file" name="file" id="file"  multiple>
						<div class="form-floating mb-3">
							<sec:csrfInput />
							<input class="form-control"
								style="font-family: 'Jua'; font-weight: 500; width: 70%; display: inline-block; float: left; margin-bottom: 20px; background-color: white;"
								type="text" name="profileText" id="profileText" placeholder="자기소개글" value="${mypage.profileText }" > <br>
							<button type="button" id="updateBtn" class="btn btn-light btn-xl bg-primary"
								style="position: relative; margin: 0; padding: 0; height: 42px; width: 24%; left: 3%; font-weight: bold;"
								>수정</button>
					</form>
					</c:otherwise>
				</c:choose>
				</div>
			</div> 
			<br>

			<h2>${member.name }님이작성하신 글 목록입니다!</h2>

			<table border="1" width="900px">
				<tr>
					<td></td>
					<td>작성자</td>
					<td>제목</td>

					<td>날짜</td>
					<td>조회수</td>
					<td>댓글수</td>

				</tr>

				<c:forEach var="dto" items="${list}">


					<tr>
						<td>${dto.boardTypeDTO.boardName},${dto.categoryDTO.categoryName}</td>
						<td>${dto.memberDTO.nickname}내용</td>
						<td><a href="<c:url value='/board/${dto.postId}'/>">
								${dto.title} </a></td>
						<td>내용${dto.regdate}</td>
						<td>내용${dto.hits}</td>
						<td>내용${dto.commentCount}</td>
					</tr>

				</c:forEach>
			</table>
			<%-- 페이징 처리 --%>
			<nav aria-label="Page navigation example">
				<ul class="pagination" style="margin: 20px 0">
					<c:if test="${pagingBean.previousPageGroup}">
						<li class="page-item"><a class="page-link"
							href="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.startPageOfPageGroup-1}">Previous
						</a></li>
					</c:if>
					<c:forEach begin="${pagingBean.startPageOfPageGroup}"
						end="${pagingBean.endPageOfPageGroup}" var="page">
						<c:choose>
							<c:when test="${page == pagingBean.nowPage}">
								<li class="page-item active"><a class="page-link"
									href="/member/mypage?pageNo=${page}"> ${page}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="/member/mypage?pageNo=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">
						<li class="page-item"><form
								action="/member/mypage?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</form></li>
					</c:if>
				</ul>
			</nav>
			
		</div>

	</sec:authorize>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	}); 
$(function(){
	$("#updateBtn").click(function(){
		var form=$("#fileForm")[0];
		var formData = new FormData(form);
		$.ajax({
			type : "post",
			url : "getProfile",
			processData:false,
		    contentType:false,
			enctype: 'multipart/form-data',
			data: formData,
			success : function(result) {
				alert("수정되었습니다");
				location.href="/member/mypage";
			}
		})
	});
});


</script>