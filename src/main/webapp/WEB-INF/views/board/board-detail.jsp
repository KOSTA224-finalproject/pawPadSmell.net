<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>상세보기</title>
</head>
<body>

	<sec:authorize access="isAuthenticated()">
		<div class="container col-9" style="margin-top: 130px;">
			<div class="card" style="margin-bottom: 20px;">
				<div class="card-header">
					<table class="table table-borderless">
						<tr style="height: 35px;">
							<td colspan="2" style="padding: 0 10px;"><span
								class="badge badge-primary">${list.categoryDTO.categoryName}</span>
							</td>
						</tr>
						<tr style="height: 60px;">
							<td colspan="2" style="padding: 0 12px"><h3
									style="position: relative; top: 7px;">${list.title}</h3></td>
						</tr>
						<tr style="height: 20px;">
							<td style="padding: 0 12px; padding-bottom: 5px;">Post by <span
								style="font-weight: bold; font-size: 20px;">${list.memberDTO.nickname}</span></td>
						</tr>
						<tr style="height: 20px;">
							<td width="18%" style="padding: 0 12px">${list.regdate }</td>
							<td style="padding: 0 12px"><span
								class="label label-primary">조회 &nbsp;${list.hits}</span></td>
						</tr>

					</table>
				</div>
				<div class="card-body" style="min-height: 220px;">

					${list.content }<br> <%-- <img src="${list.filepath}"
						style="width: 350px;"> --%> <img src="${pageContext.request.contextPath}/newfiles/${list.filename}" style="width: 350px;">
						<%-- <jsp:include page="../../include/AdminTopFixMenu.jsp" /> --%>
				</div>
				<!-- <div class="card-footer"></div> -->
			</div>
			<%-- <input type="file" value="파일">${list.filename } --%>

			<form name="detailForm">
				<!-- script에서 user_pwd에 접근하기 위한 폼 -->
				<div
					style="text-align: right; position: relative; right: 0%; top: 50%;">
					<c:if test="${nick==list.memberDTO.nickname}">
						<input type="button" value="삭제" class="btn btn-danger"
							onclick="location.href='${path}/board/delete/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
						<input type="button" value="수정" class="btn btn-primary"
							onclick="location.href='${path}/board/modify/${list.postId}/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
					</c:if>
					<input type="button" value="목록" class="btn btn-secondary"
						onclick="location.href='${path}/board/list/${list.boardTypeDTO.boardId}/${list.categoryDTO.categoryId}/';" />
				</div>
			</form>
			<div class="card mb-2 mt-5">
				<div class="card-header bg-light">
					<i class="fa fa-comment fa">댓글&nbsp;[${list.commentCount }]</i>
				</div>
				<form>
					<div class="card-body">
						<input type="hidden" id="postId" value="${list.postId}">
						<ul class="list-group list-group-flush">
							<li class="list-group-item"><textarea class="form-control"
									id="commentContent" rows="1"></textarea>
								<button id="comment-btn-save" type="button"
									class="btn btn-outline-dark mt-3">등록</button></li>
						</ul>
					</div>
				</form>
			</div>
			<br />

			<div class="card">
				<c:forEach items="${comment}" var="li">
					<div class="card-header">
						<div class="text-monospace">
							<c:out value="${li.memberDTO.nickname}" />
						</div>
					</div>
					<%-- <input type="hidden" id="commentId" value="${li.commentId}"> --%>
					<ul id="commentbox${li.commentId}" class="list-group">
						<li class="list-group-item d-flex justify-content-between">
							<div style="position: relative; top: 3px;">
								<c:out value="${li.commentContent }" />
							</div>
							<div class="d-flex">

								<div style="margin-right: 8px; position: relative; top: 3px;">
									<c:out value="${li.regdate}" />
								</div>
								<c:set var="userid" value="${userMemberId}" />
								<c:if test="${li.memberDTO.memberId eq userMemberId }">
									<button id=""
										class="btn btn-sm btn-outline-primary comment-btn-update"
										data_cid="${li.commentId}"
										data_content="${li.commentContent }"
										data_cname="${li.memberDTO.nickname}">수정</button>
									<span style="margin: 0 3px;"> </span>
									<button id=""
										class="btn btn-sm btn-outline-danger comment-btn-delete"
										value="${li.commentId}">삭제</button>
								</c:if>
							</div>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
	</sec:authorize>
	<script type="text/javascript">
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		//댓글 수정
/* 		$(document).ready(function() {
			$("#boardwrite").click(function() {

			});
			});
		}); */
		$(document).ready(function() {
			$(".comment-btn-update").click("click",function() {
				let cId = $(this).attr(
				"data_cid");
				let cName = $(this).attr(
				"data_cname");
				let content = $(this).attr(
				"data_content");
				console.log(cId);
				console.log(cName);
				console.log(content);
				let updateForm = '';
				updateForm += '<ul id="commentbox'+cId+'" class="list-group" >';
				updateForm += '<li class="list-group-item d-flex justify-content-between">';
				updateForm += '<textarea class="form-control" id="updateContent" rows="1">'
				+ content
				+ '</textarea>';
				updateForm += '<div class="d-flex">';
				updateForm += '<div class="text-monospace">';
				updateForm += '' + cName + '';
				updateForm += '</div>';
				updateForm += '<button id="" class="badge btn-warning update-comment">수정</button>';
				updateForm += '<span> | </span>';
				updateForm += '<button id="" class="badge btn-danger update-close">취소</button>';
				updateForm += '</div>';
				updateForm += '</li>';
				updateForm += '</ul>';
				$("#commentbox" + cId).replaceWith(updateForm);
				$("#updateContent").focus();
				$(".update-close").click(function() {
							console.log("되니?");
							location.reload();
							});
							$(".update-comment").click(function() {
								let updateContent = $("#updateContent").val();
									console.log(cId);
									console.log(updateContent);
									$.ajax({
											type : "POST",
											url : '/commentUpdate',
											data : JSON.stringify({
												commentId : cId,
												commentContent : updateContent
												}),
												contentType : "application/json; charset=utf-8",
												dataType : "text",
												}).done(
													function(res) {
													alert("댓글수정이 완료되었습니다.");
													window.location.reload();
													}).fail(function(err) {
															alert(JSON.stringify(err));
													});
										});
						});

		});

	$(document).ready(function() {
		gBno = '${postId}';
		gBoardWriter = '${nick}';
		gIsDirect = true;
		var token = $("meta[name='_csrf']").attr("content");
		var header = $("meta[name='_csrf_header']").attr("content");
		$(document).ajaxSend(function(e, xhr, options) {
			xhr.setRequestHeader(header, token);
		});
		let postId = $("#postId").val();
		$('#comment-btn-save').on('click', function(evt) {
			evt.preventDefault();
			if (socket.readyState !== 1)
				return;
			let msg = $('textarea#commentContent').val();
			socket.send(msg);
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
	        	
	        	if (socket) {
					// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
					let socketMsg = "reply," + "${nick}" + "," + "${list.memberDTO.nickname}" + "," + ${postId};
					socket.send(socketMsg);
				}
	        	
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
<!-- 	<script type="text/javascript"> -->
<%-- /* 	$(document).ready(function() {
		gBno = '${postId}';
		gBoardWriter = '${nick}';
		gIsDirect = true;
		$('#comment-btn-save').on('click', function(evt) {
			evt.preventDefault();
			if (socket.readyState !== 1)
				return;
			let msg = $('textarea#commentContent').val();
			socket.send(msg);
		});
	}); */
/* 	$(document).ready(	function() {
		// var $boxFooter = $("section.content div.box-footer");


		//listPage(1, '${postId}'); // QQQ
		gBno = '${postId}';
		gBoardWriter = '${postId}';

		//$('#myModal').modal('show');
		
	    showAttaches(${postId});	
	    
	    gIsDirect = true;
	    
	    $('#btnSend').on('click', function(evt) {
	    	evt.preventDefault();
	    	if (socket.readyState !== 1) return;
	    	
	   	    let msg = $('textarea#commentContent').val();
	   	    socket.send(msg);
	   	});
	    
	}); */ */
	/* function save() {
		let jsonData = getValidData( $('#replyer'), $('#replytext') );
		if (!jsonData) return;
		
		let url = gIsEdit ? "/replies/" + gRno : "/replies/",
			method = gIsEdit ? 'PATCH' : 'POST';
		
		console.debug("QQQ>>", gIsEdit, gBno)
		if (!gIsEdit)
			jsonData.bno = gBno;//게시글 번호
		
		sendAjax(url, (isSuccess, res) => {
			if (isSuccess) {
				let resultMsg = gIsEdit ? gRno + "번 댓글이 수정되었습니다." : "댓글이 등록되었습니다.";  
				alert(resultMsg);
				listPage(gIsEdit ? gPage : 1);
				closeMod();

				if (socket) {
					// websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
					let socketMsg = "reply," + jsonData.replyer + "," + gBoardWriter + "," + gBno;
					console.debug("sssssssmsg>>", socketMsg)
					socket.send(socketMsg);
				}
			} else {
				console.debug("Error on editReply>>", res);
			}
		}, method, jsonData);
	} */ --%>
<!-- </script> -->
</html>