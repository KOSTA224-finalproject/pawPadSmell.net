<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%> --%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<sec:authorize access="isAuthenticated()">

		<button type="button" class="btn btn-primary"
			onclick="location.href='/';">메인페이지</button>
		<h1>${boardname.boardName}<br>
			${categoryname.categoryName}게시판
		</h1>
		<button type="button" id="btnWrite" >글쓰기</button>
		<table border="1" width="900px">
			<tr>

				<td>작성자</td>
				<td>제목</td>

				<td>날짜</td>
				<td>조회수</td>
				<td>댓글수</td>

			</tr>

			<c:forEach var="dto" items="${list}">
				<tr>

					<td>${dto.memberDTO.nickname}</td>
					<td><a href="<c:url value='/board/${dto.postId}'/>">

							${dto.title} </a></td>

					<td>${dto.regdate}</td>
					<td>${dto.hits}</td>
					<td>${dto.commentCount}</td>

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
								href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">
									${page}</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link"
								href="${path}/board/list/${boardId}/${categoryId}?pageNo=${page}">${page}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pagingBean.nextPageGroup}">
					<li class="page-item"><form
							action="${path}/board/list/${boardId}/${categoryId}?pageNo=${pagingBean.endPageOfPageGroup+1}">Next</form></li>
				</c:if>
			</ul>
		</nav>
	</sec:authorize>
<div class="card">
			<c:forEach items="${comment}" var="li">
			
			<div class="card-header">댓글</div>
			<%-- <input type="hidden" id="commentId" value="${li.commentId}"> --%>
				<ul id="commentbox${li.commentId}" class="list-group" >
					<li class="list-group-item d-flex justify-content-between">
						<div><c:out value="${li.commentContent }"/></div>
						<div class="d-flex">
							<div class="text-monospace">
								<c:out value="${li.memberDTO.nickname}"/>
							 </div>
							<div><c:out value="${li.regdate}"/> &nbsp;</div>
							<button id="" class="badge btn-warning comment-btn-update" data_cid="${li.commentId}" data_content="${li.commentContent }" data_cname="${li.memberDTO.nickname}">수정</button>
							<span> | </span>
							<button id="" class="badge btn-danger comment-btn-delete" value="${li.commentId}">삭제</button>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
	
	</div>
	<script type="text/javascript">
	//댓글 수정
		$(document).ready(function(){
			$(".comment-btn-update").click("click",function(){
				let cId=$(this).attr("data_cid");
				let cName=$(this).attr("data_cname");
				let content=$(this).attr("data_content");
				console.log(cId);
				console.log(cName);
				console.log(content);
				let updateForm ='';
				updateForm +='<ul id="commentbox'+cId+'" class="list-group" >';
				updateForm += '<li class="list-group-item d-flex justify-content-between">';
				updateForm += '<textarea class="form-control" id="updateContent" rows="1">'+content+'</textarea>';
				updateForm += '<div class="d-flex">';
				updateForm += '<div class="text-monospace">';
				updateForm += ''+cName+'';
				updateForm += '</div>';
				updateForm += '<button id="" class="badge btn-warning update-comment">수정</button>';
				updateForm += '<span> | </span>';
				updateForm += '<button id="" class="badge btn-danger update-close">취소</button>';
				updateForm += '</div>';
				updateForm += '</li>';
				updateForm += '</ul>';
				$("#commentbox"+cId).replaceWith(updateForm);
				$("#updateContent").focus();
				$(".update-close").click(function(){
					console.log("되니?");
					location.reload();
				});
				$(".update-comment").click(function(){
					let updateContent=$("#updateContent").val();
					console.log(cId);
					console.log(updateContent);
					$.ajax({
			            type: "POST",
			            url: '/commentUpdate',
			            data: JSON.stringify({
			            		commentId:cId,
			            		commentContent:updateContent}),	
			            contentType: "application/json; charset=utf-8",
			            dataType: "text",
			        }).done(function (res) {
			            alert("댓글수정이 완료되었습니다.");
			            location.href = "/board/${postId}";
			        }).fail(function (err) {
			            alert(JSON.stringify(err));
			        });
				});
			});
		});
	</script>
</body>
<script type="text/javascript">
$(document).ready(function(){
	let postId= $("#postId").val();
	$("#comment-btn-save").click(function(){
			let data = {
	            commentContent: $("#commentContent").val()
	        }
	        console.log(data);
	        console.log(postId);
	       $.ajax({
	            type: "POST",
	            url: '/commentSave/${postId}',
	            data: JSON.stringify(data),
	            contentType: "application/json; charset=utf-8",
	            //dataType: "json"
	        }).done(function (res) {
	            alert("댓글작성이 완료되었습니다.");
	            location.href = "/board/${postId}";
	        }).fail(function (err) {
	            alert(JSON.stringify(err));
	        });
	});
	$(".comment-btn-delete").click(function(){
		let commentId=$(this).val();
		console.log(commentId);
		console.log(postId);
	    $.ajax({
			type:"DELETE",
			url:'/commentDelete/'+commentId,
		}).done(function (res) {
            alert("댓글삭제가 완료되었습니다.");
            location.href = '/board/${postId}';
        }).fail(function (err) {
            alert(JSON.stringify(err));
        });
	});
});
</script>
</html>