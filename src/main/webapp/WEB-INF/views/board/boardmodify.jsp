<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<!-- ajax 통신을 위한 meta tag -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<head>
<meta charset="UTF-8">
<!-- jquery.min.js  <- 제이쿼리 사용시 꼭 필요 -->
<title>게시물 수정폼</title>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
.layout {
	width: 500px;
	margin: 0 auto;
	margin-top: 40px;
}

.layout input {
	width: 100%;
	box-sizing: border-box
}

.layout textarea {
	width: 100%;
	margin-top: 10px;
	min-height: 300px;
}
</style>

<sec:authorize access="isAuthenticated()">
	<body>
		<div class="layout">

			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<form id="uploadForm" action="/board/update/${postId}/${boardId}/${categoryId}" 
				enctype="multipart/form-data" method="post">
			<!-- <form id="uploadForm"> -->
				<%-- <input type="hidden" name="postId" value="${boardDTO.postId}"> --%>
				<sec:csrfInput />
				<span class="label label-danger">${boardname.boardName}</span> <span
					class="label label-primary">${categoryname.categoryName}</span><br>
				작성자: ${nick} <input name="title" type="text" value=${boardDTO.title}>
				<textarea name="content">${boardDTO.content}</textarea>
				<input type="file" name="file">
				<button id="btn_modify" type="submit">수정하기</button>
			</form>
			<!-- 			<form >
			    <input type="file" name="file" />
			    <button type="button" id="uploadBtn">Save</button>
			</form> -->
		</div>
		
	</body>
	
	<script type="text/javascript">
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	}); 
		
			$(function(){
				$("#btn_modify").click(function(){
					$("#uploadForm").submit(function(){
						return confirm("수정 하시겠습니까?😊");//return false 하면 이동되지 않는다 
					});
				});
			});
		

	
	</script>
</sec:authorize>
</html>