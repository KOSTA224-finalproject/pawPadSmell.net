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


<%-- <sec:csrfInput /> --%>
<sec:authorize access="isAuthenticated()">

	<body>
		<div class="container px-4 px-lg-5" style="margin-top: 130px;">
			<!-- 파일 업로드를 위한 속성 추가 : enctype="multipart/form-data"  method는 항상 post 방식이어야 한다. -->
			<form action="/board/writepro/${boardId}/${categoryId}"
				enctype="multipart/form-data" method="post">
				<sec:csrfInput />
				<div class="card">
					<div class="card-header form-group">
						<span class="badge badge-danger">${boardname.boardName}</span>
						<span class="badge badge-primary">${categoryname.categoryName}</span> <br>
						<span>작성자: ${nick}</span>
						<input name="title" class="form-control" type="text" placeholder="제목을 입력하세요.">
						
					</div>
					<div class="card-body form-group">
						<textarea name="content" class="form-control" rows="10" placeholder="내용을 입력하세요."></textarea>
					</div>
					<div class="card-footer" >
						<input type="file" class="form-control" name="file">
					</div>
				</div>
				<!-- 
            name 값이름 지정 시 서버에서 이 이름으로 데이터를 얻게 된다. 
            accept는 전송 허용 가능한 파일의 타입을 지정하는 것 -> 악성 파일 공격 대비
            ex)
             accept="image/png, image/jpeg"
            -->
				<button id="btn_boardwrite" class="btn btn-primary" style="position: relative; float:right; margin-top: 15px;  margin-left: 10px;" type="submit">작성</button>
				<button id="btn_boardwrite" class="btn btn-danger" style="position: relative; float:right; margin-top: 15px;" type="button" onclick="closeBtn()">취소</button>
			</form>
		</div>
	</body>
	<script type="text/javascript">
		function closeBtn(){
			console.log("${path}/board/list/${boardId}/${categoryId}")
			location.href="${path}/board/list/${boardId}/${categoryId}";
			//${path}/board/list/${boardId}/${categoryId}
		}
	</script>
</sec:authorize>
</html>