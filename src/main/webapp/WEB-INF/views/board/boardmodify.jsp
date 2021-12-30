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
<%-- <sec:csrfInput /> --%>
<sec:authorize access="isAuthenticated()">

	<body>
		<div class="container px-4 px-lg-5" style="margin-top: 130px;">

			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<%-- <form action="/board/update/${postId}/${boardId}/${categoryId}" 
				enctype="multipart/form-data" method="post"> --%>
			<form id="uploadForm">
				<input type="hidden" name="postId" value="${boardDTO.postId}">
				<div class="card">
					<div class="card-header form-group">
						<%-- <sec:csrfInput /> --%>
						<span class="badge badge-danger">${boardname.boardName}</span>
						<span class="badge badge-primary">${categoryname.categoryName}</span> <br>
						<span>작성자: ${nick}</span>
						<input class="form-control" name="title" type="text" value=${boardDTO.title}>
					</div>
					<div class="card-body form-group">
						<textarea name="content" class="form-control" rows="10">${boardDTO.content}</textarea>
					</div>
					<div class="card-footer" >
						<input type="file" class="form-control" name="file">
					</div>
				</div>
				<button id="btn_modify" class="btn btn-primary" type="button" style="position: relative; float:right; margin-top: 15px;">수정</button>
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
				alert("에이젝스로 들어옴");
				var form = $('#uploadForm')[0];
			    var formData = new FormData(form);
			    
			    $.ajax({
			        url : '/board/update/${postId}/${boardId}/${categoryId}',
			        type : 'POST',
			        enctype: 'multipart/form-data',
			        data : formData,
			        contentType : false,
			        processData : false,        
			    	success : function(result) {
					alert("수정되었습니다");
					location.href="/board/${postId}";
					}
			    })
			});
		});
		

	
	</script>
</sec:authorize>
</html>