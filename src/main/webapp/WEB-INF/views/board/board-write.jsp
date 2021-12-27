<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jquery.min.js  <- 제이쿼리 사용시 꼭 필요 -->
<title>게시물 작성폼</title>
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
<%-- <sec:csrfInput /> --%>
<sec:authorize access="isAuthenticated()">

	<body>
		<div class="layout">

			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<form action="/board/writepro/${boardId}/${categoryId}" 
				enctype="multipart/form-data" method="post">
				<sec:csrfInput />
				<span class="label label-danger">${boardname.boardName}</span>
				<span
					class="label label-primary">${categoryname.categoryName}</span><br>
				작성자: ${nick} <input name="title" type="text"
					placeholder="제목을 입력하세요.">
				<textarea name="content" placeholder="내용을 입력하세요."></textarea>

				<input type="file" name="file">
				<!-- 
            name 값이름 지정 시 서버에서 이 이름으로 데이터를 얻게 된다. 
            accept는 전송 허용 가능한 파일의 타입을 지정하는 것 -> 악성 파일 공격 대비
            ex)
             accept="image/png, image/jpeg"
            -->
				<button id="btn_boardwrite" type="submit">작성</button>
			</form>
		</div>
	</body>
</sec:authorize>
</html>