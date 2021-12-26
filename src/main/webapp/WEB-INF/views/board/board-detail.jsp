<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
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
				<input type="file" value="파일">${list.filename }
				<c:if test="${nick==list.memberDTO.nickname}">
					<input type="button" value="삭제"
						onclick="location.href='${path}/board/delete/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';"/>
					<input type="button" value="수정" />
				</c:if>
				<input type="button" value="글 목록"
					onclick="location.href=document.referrer;" />
			</form>

       <div class="card mb-2 mt-5">
        <div class="card-header bg-light">
            <i class="fa fa-comment fa">${nick}댓글&nbsp;[${list.commentCount }]</i>
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
			<c:forEach items="${comment}" var="li">
			
			<div class="card-header"></div>
			<%-- <input type="hidden" id="commentId" value="${li.commentId}"> --%>
				<ul id="commentbox${li.commentId}" class="list-group" >
					<li class="list-group-item d-flex justify-content-between">
						<div><c:out value="${li.commentContent }"/></div>
						<div class="d-flex">
							<div class="text-monospace">
								<c:out value="${li.memberDTO.nickname}"/>
							 </div>
							<div><c:out value="${li.regdate}"/> &nbsp;</div>
							<%-- <c:set var="userid" value="${li.memberDTO.memberId}"/> --%>
							<%-- <c:if test="${userid eq #authentication.principal.getMemberId }"> --%>
								<button id="" class="badge btn-warning comment-btn-update" data_cid="${li.commentId}" data_content="${li.commentContent }" data_cname="${li.memberDTO.nickname}">수정</button>
								<span> | </span>
								<button id="" class="badge btn-danger comment-btn-delete" value="${li.commentId}">삭제</button>
							<%-- </c:if> --%>
						</div>
					</li>
				</ul>
			</c:forEach>
		</div>
		
</sec:authorize>
		<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		}); 
	//댓글 수정
	$(document).ready(function(){
		$("#boardwrite").click(function(){
			
		});
	});
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
	</div>

</body>
<script type="text/javascript">
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options) {
		xhr.setRequestHeader(header, token);
	}); 
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
			url:'/commentDelete/${postId}/'+commentId,
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