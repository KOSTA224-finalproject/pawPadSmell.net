<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */



.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}
</style>

<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>
	<sec:authorize access="isAuthenticated()">
	<div class="col-sm-9">
		<hr>
		<h2>${list.title}</h2>
		<h5>
			<span class="glyphicon glyphicon-time"></span> Post by
			${list.memberDTO.nickname}
		</h5>
		<h5>
			<span class="label label-danger">${list.categoryDTO.categoryName}</span>
			<span class="label label-primary">${list.hits}</span>
		</h5>
		<br>
		<p>${fn : replace(list.content, enter, "<br />") }</p>
		<br> <br>




		<form name="detailForm">
			<!-- script에서 user_pwd에 접근하기 위한 폼 -->
			<input type="file" value="파일">${list.filename } <input
				type="button" value="삭제" onclick="location.href='${path}/board/delete/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}';" >
				</input>
			<input type="button" value="수정" /> <input type="button" value="글 목록"
				onclick="location.href=document.referrer;" />
		</form>
	<div class="card mb-2 mt-5">

        <div class="card-header bg-light">
            <i class="fa fa-comment fa"></i> 댓글
        </div>
        <form>
            <div class="card-body">
                <input type="hidden" id="postId" value="${list.postId}">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <textarea class="form-control" id="commentContent" rows="1"></textarea>
                        <button id="comment-btn-save" type="button" class="btn btn-dark mt-3">등록</button>
                    </li>
                </ul>
            </div>
        </form>
    </div>
		<br />
		<div class="card">
			<div class="card-header">댓글</div>
			<c:forEach items="${comment}" var="li">
			<input type="hidden" id="commentId" value="${li.commentId}">
				<ul id="reply--box" class="list-group">
				
					<li id="'comment--'+${li.commentId}"
						class="list-group-item d-flex justify-content-between">
						<div><c:out value="${li.commentContent}"/></div>
						<div class="d-flex">
							<div class="text-monospace">
								<c:out value="${li.MemberDTO.name}"/>
							 </div>
							<div><c:out value="${li.regdate}"/> &nbsp;</div>
							<button id="" class="badge btn-warning comment-btn-update" value="${li.commentId}">수정</button>
							<span> | </span>
							<button id="" class="badge btn-danger comment-btn-delete" value="${li.commentId}">삭제</button>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
		
</sec:authorize>

	</div>
</body>
</html>