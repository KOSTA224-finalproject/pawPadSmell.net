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

<!-- SimpleLightbox plugin CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/SimpleLightbox/2.1.0/simpleLightbox.min.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap) -->
<head>
<meta charset="UTF-8">

<title>mypage</title>

</head>
<style>
.filebox label {
	display: block;
	margin: 5px auto;
	width: 110px;
	text-align: center;
	/* padding: .5em .75em; color: #999; font-size: inherit; line-height: normal; vertical-align: middle; background-color: #fdfdfd; cursor: pointer; border: 1px solid #ebebeb; border-bottom-color: #e2e2e2; border-radius: .25em; */
}

.filebox input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>
<body>
	<sec:authorize access="isAuthenticated()">

		<div class="container"
			style="margin-top: 130px; margin-bottom: 140px;">
			<h3>${member.name}<span style="font-size: 16px;">님의 페이지</span>
			</h3>
			<div class="card" style="margin-bottom: 20px;">
				<div class="card-body">
					<c:choose>
						<c:when test="${mypage==null}">
							<br>
							<form action="mypage/upload" method="post"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-4">
										<div class="card">
											<div class="card-header">
												<c:if test="${mypage.profileFilepath == null}">
													<img src="/img/profile.png"
														style="display: block; width: 280px; height: 350px; margin: auto;">
												</c:if>
											</div>
											<div class="filebox">
												<label class="btn btn-primary" for="file">사진 변경</label> <input
													type="file" name="file" id="file">
											</div>
										</div>
									</div>
									<div class="col-8">
										<sec:csrfInput />
										<textarea name="profileText" id="profileText"
											class="form-control" rows="15" placeholder="내용을 입력하세요.">${mypage.profileText }</textarea>
										<%-- <input class="form-control"
								style="font-family: 'Jua'; font-weight: 500; width: 70%; display: inline-block; float: left; margin-bottom: 20px; background-color: white;"
								type="text" name="profileText" id="profileText" placeholder="자기소개글" value="${mypage.profileText }" > --%>
										<br>
										<button id="updateBtn" class="btn btn-primary"
											style="position: relative; top: -15px; float: right;">저장</button>
									</div>
								</div>
							</form>
						</c:when>
						<c:otherwise>
							<br>
							<form id="fileForm" method="post" enctype="multipart/form-data">
								<div class="row">
									<div class="col-4">
										<div class="card">

											<div class="card-header">
												<c:if test="${mypage.profileFilepath != null}">
													<img
														src="${pageContext.request.contextPath}/myfiles/${mypage.profileFilepath}"
														style="display: block; width: 280px; height: 350px; margin: auto;">
												</c:if>
												<c:if test="${mypage.profileFilepath == null}">
													<img src="/img/profile.png"
														style="display: block; width: 280px; height: 350px; margin: auto;">
												</c:if>
											</div>

											<div class="filebox">
												<label class="btn btn-primary" for="file">사진 변경</label> <input
													type="file" name="file" id="file">
											</div>
										</div>
									</div>
									<div class="col-8">
										<sec:csrfInput />
										<textarea name="profileText" id="profileText"
											class="form-control" rows="15" placeholder="내용을 입력하세요.">${mypage.profileText }</textarea>
										<%-- <input class="form-control"
								style="font-family: 'Jua'; font-weight: 500; width: 70%; display: inline-block; float: left; margin-bottom: 20px; background-color: white;"
								type="text" name="profileText" id="profileText" placeholder="자기소개글" value="${mypage.profileText }" > --%>
										<br>
										<button type="button" id="updateBtn" class="btn btn-primary"
											style="position: relative; top: -15px; float: right;">저장</button>
									</div>
								</div>
							</form>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<br>

			<h2>${member.name}님이 작성하신 글 목록입니다!</h2>

			<table class="table" style="text-align: center;">
				<thead>
					<tr>
						<td></td>
						<td>작성자</td>
						<td width="50%">제목</td>

						<td>날짜</td>
						<td>조회수</td>
						<td>댓글수</td>

					</tr>
				</thead>


				<tbody>
					<c:forEach var="dto" items="${list}">
						<tr>
							<td><span class="badge badge-danger">${dto.boardTypeDTO.boardName}</span>&nbsp;<span
								class="badge badge-primary">${dto.categoryDTO.categoryName}</span></td>
							<td>${dto.memberDTO.nickname}</td>
							<td><a href="<c:url value='/board/${dto.postId}'/>">
									${dto.title} </a></td>
							<td>${dto.regdate}</td>
							<td>${dto.hits}</td>
							<td>${dto.commentCount}</td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
			<%-- 페이징 처리 --%>
			<nav aria-label="Page navigation example">
				<ul class="pagination"
					style="margin: 20px 0; display: block; text-align: center;">
					<c:if test="${pagingBean.previousPageGroup}">
						<li class="page-item" style="display: inline-block;"><a
							class="page-link"
							href="/member/mypage?pageNo=${pagingBean.startPageOfPageGroup-1}">이전
						</a></li>
					</c:if>
					<c:forEach begin="${pagingBean.startPageOfPageGroup}"
						end="${pagingBean.endPageOfPageGroup}" var="page">
						<c:choose>
							<c:when test="${page == pagingBean.nowPage}">
								<li class="page-item active" style="display: inline-block;"><a
									class="page-link" href="/member/mypage?pageNo=${page}">
										${page}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item" style="display: inline-block;"><a
									class="page-link" href="/member/mypage?pageNo=${page}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pagingBean.nextPageGroup}">
						<li class="page-item" style="display: inline-block;"><a class="page-link"
								href="/member/mypage?pageNo=${pagingBean.endPageOfPageGroup+1}">다음</a></li>
					</c:if>
				</ul>
			</nav>

		</div>
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
	$(function() {
		$("#updateBtn").click(function() {
			var form = $("#fileForm")[0];
			var formData = new FormData(form);
			$.ajax({
				type : "post",
				url : "${path}/member/getProfile",
				processData : false,
				contentType : false,
				enctype : 'multipart/form-data',
				data : formData,
				success : function(result) {//debounce   timer 
					// d
					setTimeout(function() {
						alert("수정되었습니다");
						//location.href="/member/mypage";
						location.reload();

					}, 2000);
				}
			})
		});
	});
</script>
</html>